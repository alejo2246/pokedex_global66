import '../../../../core/utils/result.dart';
import '../../../pokedex/domain/entities/pokemon.dart';

abstract interface class IFavoritesRepository {
  Future<Result<List<Pokemon>>> getFavorites();
  Future<Result<void>> toggleFavorite(Pokemon pokemon);
  bool isFavorite(int id);
}
