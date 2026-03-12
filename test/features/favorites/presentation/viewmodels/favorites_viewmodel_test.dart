import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:pokedex/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:pokedex/features/favorites/presentation/viewmodels/favorites_viewmodel.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockToggleFavoriteUseCase extends Mock implements ToggleFavoriteUseCase {}

void main() {
  late MockGetFavoritesUseCase mockGetFavorites;
  late MockToggleFavoriteUseCase mockToggleFavorite;
  late ProviderContainer container;

  const tPokemon = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.grass],
  );
  const tCharmander = Pokemon(
    id: 4,
    name: 'charmander',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.fire],
  );

  setUp(() {
    mockGetFavorites = MockGetFavoritesUseCase();
    mockToggleFavorite = MockToggleFavoriteUseCase();
    registerFallbackValue(tPokemon);

    container = ProviderContainer(
      overrides: [
        getFavoritesUseCaseProvider.overrideWithValue(mockGetFavorites),
        toggleFavoriteUseCaseProvider.overrideWithValue(mockToggleFavorite),
      ],
    );
    addTearDown(container.dispose);
  });

  group('FavoritesState', () {
    test('isFavorite returns true for contained id', () {
      const state = FavoritesState(
        favorites: [tPokemon],
        favoriteIds: {1},
      );
      expect(state.isFavorite(1), isTrue);
    });

    test('isFavorite returns false for unknown id', () {
      const state = FavoritesState();
      expect(state.isFavorite(99), isFalse);
    });

    test('copyWith preserves untouched fields', () {
      const state = FavoritesState(favorites: [tPokemon], favoriteIds: {1});
      final copy = state.copyWith(favoriteIds: {1, 4});
      expect(copy.favorites.first.id, 1);
      expect(copy.favoriteIds, containsAll([1, 4]));
    });

    test('default state has empty favorites and ids', () {
      const state = FavoritesState();
      expect(state.favorites, isEmpty);
      expect(state.favoriteIds, isEmpty);
    });
  });

  group('FavoritesViewModel.build', () {
    test('loads favorites and builds state with correct ids', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([tPokemon]));

      final state = await container.read(favoritesViewModelProvider.future);

      expect(state.favorites.length, 1);
      expect(state.favorites.first.id, 1);
      expect(state.favoriteIds, {1});
      expect(state.isFavorite(1), isTrue);
    });

    test('builds empty state when no favorites stored', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([]));

      final state = await container.read(favoritesViewModelProvider.future);

      expect(state.favorites, isEmpty);
      expect(state.favoriteIds, isEmpty);
    });

    test('provider future rejects when getFavorites fails', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Failure('load error'));

      // In Riverpod 3, provider.future rejects ↔ state is AsyncError
      final threw = await container
          .read(favoritesViewModelProvider.future)
          .then((_) => false, onError: (_) => true);

      expect(threw, isTrue);
    });

    test('builds correct ids set for multiple favorites', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([tPokemon, tCharmander]));

      final state = await container.read(favoritesViewModelProvider.future);

      expect(state.favoriteIds, {1, 4});
      expect(state.isFavorite(1), isTrue);
      expect(state.isFavorite(4), isTrue);
      expect(state.isFavorite(7), isFalse);
    });
  });

  group('FavoritesViewModel.toggleFavorite', () {
    test('removes pokemon from state when it is already favorite', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([tPokemon]));
      when(() => mockToggleFavorite.call(any()))
          .thenAnswer((_) async => const Success(null));

      await container.read(favoritesViewModelProvider.future);
      await container.read(favoritesViewModelProvider.notifier).toggleFavorite(tPokemon);

      final state = container.read(favoritesViewModelProvider).value!;
      expect(state.favorites, isEmpty);
      expect(state.favoriteIds, isEmpty);
      expect(state.isFavorite(1), isFalse);
    });

    test('adds pokemon to state when it is not a favorite', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([]));
      when(() => mockToggleFavorite.call(any()))
          .thenAnswer((_) async => const Success(null));

      await container.read(favoritesViewModelProvider.future);
      await container.read(favoritesViewModelProvider.notifier).toggleFavorite(tPokemon);

      final state = container.read(favoritesViewModelProvider).value!;
      expect(state.favorites.length, 1);
      expect(state.favorites.first.id, 1);
      expect(state.favoriteIds, {1});
      expect(state.isFavorite(1), isTrue);
    });

    test('calls toggleFavoriteUseCase with the correct pokemon', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([]));
      when(() => mockToggleFavorite.call(any()))
          .thenAnswer((_) async => const Success(null));

      await container.read(favoritesViewModelProvider.future);
      await container.read(favoritesViewModelProvider.notifier).toggleFavorite(tPokemon);

      verify(() => mockToggleFavorite.call(tPokemon)).called(1);
    });

    test('preserves other favorites when removing one', () async {
      when(() => mockGetFavorites.call())
          .thenAnswer((_) async => const Success([tPokemon, tCharmander]));
      when(() => mockToggleFavorite.call(any()))
          .thenAnswer((_) async => const Success(null));

      await container.read(favoritesViewModelProvider.future);
      await container.read(favoritesViewModelProvider.notifier).toggleFavorite(tPokemon);

      final state = container.read(favoritesViewModelProvider).value!;
      expect(state.favorites.length, 1);
      expect(state.favorites.first.id, 4);
      expect(state.favoriteIds, {4});
    });
  });
}
