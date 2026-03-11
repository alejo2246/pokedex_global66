import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../../../pokedex/domain/entities/pokemon.dart';
import '../../data/repositories/favorites_repository_impl.dart';
import '../repositories/ifavorites_repository.dart';

part 'get_favorites_usecase.g.dart';

class GetFavoritesUseCase {
  final IFavoritesRepository _repository;

  GetFavoritesUseCase(this._repository);

  Future<Result<List<Pokemon>>> call() => _repository.getFavorites();
}

@riverpod
GetFavoritesUseCase getFavoritesUseCase(Ref ref) {
  return GetFavoritesUseCase(ref.watch(favoritesRepositoryProvider));
}
