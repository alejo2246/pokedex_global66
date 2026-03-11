import '../../../../core/utils/result.dart';
import '../entities/pokemon.dart';
import '../entities/pokemon_detail.dart';

abstract interface class IPokedexRepository {
  Future<Result<PokemonListResult>> getPokemonList({
    int limit = 20,
    int offset = 0,
  });

  Future<Result<Pokemon>> getPokemonDetail(int id);

  Future<Result<PokemonDetail>> getPokemonFullDetail(int id);
}
