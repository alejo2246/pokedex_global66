import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../../../pokedex/domain/entities/pokemon.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

part 'favorites_viewmodel.g.dart';

class FavoritesState {
  final List<Pokemon> favorites;
  final Set<int> favoriteIds;

  const FavoritesState({
    this.favorites = const [],
    this.favoriteIds = const {},
  });

  bool isFavorite(int id) => favoriteIds.contains(id);

  FavoritesState copyWith({
    List<Pokemon>? favorites,
    Set<int>? favoriteIds,
  }) =>
      FavoritesState(
        favorites: favorites ?? this.favorites,
        favoriteIds: favoriteIds ?? this.favoriteIds,
      );
}

@riverpod
class FavoritesViewModel extends _$FavoritesViewModel {
  @override
  Future<FavoritesState> build() async {
    final result = await ref.read(getFavoritesUseCaseProvider).call();
    return switch (result) {
      Success(:final data) => FavoritesState(
          favorites: data,
          favoriteIds: data.map((p) => p.id).toSet(),
        ),
      Failure(:final message) => throw Exception(message),
    };
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    final current = state.value;
    if (current == null) return;

    await ref.read(toggleFavoriteUseCaseProvider).call(pokemon);

    final isFav = current.isFavorite(pokemon.id);
    state = AsyncData(
      current.copyWith(
        favorites: isFav
            ? current.favorites.where((p) => p.id != pokemon.id).toList()
            : [...current.favorites, pokemon],
        favoriteIds: isFav
            ? current.favoriteIds.difference({pokemon.id})
            : {...current.favoriteIds, pokemon.id},
      ),
    );
  }
}
