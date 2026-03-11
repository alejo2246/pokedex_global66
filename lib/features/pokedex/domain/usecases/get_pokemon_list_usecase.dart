import 'package:pokedex/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../entities/pokemon.dart';
import '../repositories/ipokedex_repository.dart';

part 'get_pokemon_list_usecase.g.dart';

class GetPokemonListUseCase {
  final IPokedexRepository _repository;

  GetPokemonListUseCase(this._repository);

  Future<Result<PokemonListResult>> call({
    int limit = 20,
    int offset = 0,
  }) async {
    final listResult = await _repository.getPokemonList(
      limit: limit,
      offset: offset,
    );

    if (listResult is! Success<PokemonListResult>) return listResult;

    final base = listResult.data;

    // NOTA: Se hace un call a getPokemonDetail por cada ítem porque el endpoint
    // de listado de PokeAPI solo devuelve nombre y URL. El diseño (Figma) requiere
    // mostrar los tipos y colorear el card según el tipo primario, por lo que
    // no hay forma de evitar estas llamadas sin cambiar el diseño de la pantalla.
    final details = await Future.wait(
      base.pokemons.map((p) => _repository.getPokemonDetail(p.id)),
    );

    final enriched = List.generate(base.pokemons.length, (i) {
      final detail = details[i];
      return detail is Success<Pokemon> ? detail.data : base.pokemons[i];
    });

    return Success(PokemonListResult(
      count: base.count,
      next: base.next,
      pokemons: enriched,
    ));
  }
}

@riverpod
GetPokemonListUseCase getPokemonListUseCase(Ref ref) {
  final repository = ref.watch(pokedexRepositoryProvider);
  return GetPokemonListUseCase(repository);
}
