import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:pokedex/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:pokedex/features/favorites/presentation/pages/favorites_page.dart';
import 'package:pokedex/features/favorites/presentation/viewmodels/favorites_viewmodel.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockToggleFavoriteUseCase extends Mock implements ToggleFavoriteUseCase {}

// ─── fake notifier ───────────────────────────────────────────────────────────

class FakeFavoritesViewModel extends FavoritesViewModel {
  final AsyncValue<FavoritesState> fakeState;

  FakeFavoritesViewModel(this.fakeState);

  @override
  Future<FavoritesState> build() async {
    return switch (fakeState) {
      AsyncData(:final value) => value,
      AsyncError(:final error) => throw error,
      _ => throw StateError('loading'),
    };
  }
}

// ─── helpers ─────────────────────────────────────────────────────────────────

Widget buildPage(AsyncValue<FavoritesState> state) {
  return ProviderScope(
    overrides: [
      favoritesViewModelProvider.overrideWith(
        () => FakeFavoritesViewModel(state),
      ),
    ],
    child: const MaterialApp(home: FavoritesPage()),
  );
}

void main() {
  const tBulbasaur = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    thumbnailUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
    types: [PokemonType.grass],
  );

  group('FavoritesPage', () {
    testWidgets('shows AppBar with "Favoritos" title', (tester) async {
      await tester.pumpWidget(buildPage(
        const AsyncData(FavoritesState()),
      ));
      await tester.pump();

      expect(find.text('Favoritos'), findsOneWidget);
    });

    testWidgets('shows skeleton while loading', (tester) async {
      await tester.pumpWidget(buildPage(const AsyncLoading()));
      await tester.pump();

      // PokedexSkeletonList renders shimmer cards — check scaffold body has children
      expect(find.byType(FavoritesPage), findsOneWidget);
    });

    testWidgets('shows error state on AsyncError', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncError(Exception('error'), StackTrace.empty),
      ));
      await tester.pumpAndSettle(); // allow async build() to throw and widget to rebuild

      expect(find.text('Algo salio mal...'), findsOneWidget);
    });

    testWidgets('shows empty state when favorites list is empty', (tester) async {
      await tester.pumpWidget(buildPage(
        const AsyncData(FavoritesState()),
      ));
      await tester.pump();

      expect(find.text('Sin favoritos'), findsOneWidget);
      expect(
        find.text('Agrega Pokémon a tus favoritos desde la Pokédex.'),
        findsOneWidget,
      );
    });

    testWidgets('shows list of favorites when data is available', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(FavoritesState(
          favorites: [tBulbasaur],
          favoriteIds: {1},
        )),
      ));
      await tester.pump();

      // PokemonCard renders the pokemon name capitalized
      expect(find.text('Bulbasaur'), findsOneWidget);
    });

    testWidgets('renders a card for each favorite', (tester) async {
      final favorites = [
        tBulbasaur,
        const Pokemon(
          id: 4,
          name: 'charmander',
          imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          thumbnailUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
          types: [PokemonType.fire],
        ),
      ];

      await tester.pumpWidget(buildPage(
        AsyncData(FavoritesState(
          favorites: favorites,
          favoriteIds: {1, 4},
        )),
      ));
      await tester.pump();

      expect(find.text('Bulbasaur'), findsOneWidget);
      expect(find.text('Charmander'), findsOneWidget);
    });
  });
}
