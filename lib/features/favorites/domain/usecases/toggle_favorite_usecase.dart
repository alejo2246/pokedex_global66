import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../../../pokedex/domain/entities/pokemon.dart';
import '../../data/repositories/favorites_repository_impl.dart';
import '../repositories/ifavorites_repository.dart';

part 'toggle_favorite_usecase.g.dart';

class ToggleFavoriteUseCase {
  final IFavoritesRepository _repository;

  ToggleFavoriteUseCase(this._repository);

  Future<Result<void>> call(Pokemon pokemon) =>
      _repository.toggleFavorite(pokemon);
}

@riverpod
ToggleFavoriteUseCase toggleFavoriteUseCase(Ref ref) {
  return ToggleFavoriteUseCase(ref.watch(favoritesRepositoryProvider));
}
