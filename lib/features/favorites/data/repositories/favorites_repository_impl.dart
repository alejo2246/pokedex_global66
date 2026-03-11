import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../../../pokedex/domain/entities/pokemon.dart';
import '../../domain/repositories/ifavorites_repository.dart';
import '../datasources/favorites_local_datasource.dart';

part 'favorites_repository_impl.g.dart';

class FavoritesRepositoryImpl implements IFavoritesRepository {
  final FavoritesLocalDataSource _dataSource;

  FavoritesRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Pokemon>>> getFavorites() async {
    try {
      return Success(_dataSource.getAll());
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<void>> toggleFavorite(Pokemon pokemon) async {
    try {
      if (_dataSource.isFavorite(pokemon.id)) {
        _dataSource.remove(pokemon.id);
      } else {
        _dataSource.save(pokemon);
      }
      return const Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  bool isFavorite(int id) => _dataSource.isFavorite(id);
}

@riverpod
IFavoritesRepository favoritesRepository(Ref ref) {
  return FavoritesRepositoryImpl(ref.watch(favoritesLocalDataSourceProvider));
}
