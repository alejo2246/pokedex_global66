import 'package:pokedex/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../entities/pokemon_detail.dart';
import '../repositories/ipokedex_repository.dart';

part 'get_pokemon_detail_usecase.g.dart';

class GetPokemonDetailUseCase {
  final IPokedexRepository _repository;

  GetPokemonDetailUseCase(this._repository);

  Future<Result<PokemonDetail>> call(int id) =>
      _repository.getPokemonFullDetail(id);
}

@riverpod
GetPokemonDetailUseCase getPokemonDetailUseCase(Ref ref) {
  final repository = ref.watch(pokedexRepositoryProvider);
  return GetPokemonDetailUseCase(repository);
}
