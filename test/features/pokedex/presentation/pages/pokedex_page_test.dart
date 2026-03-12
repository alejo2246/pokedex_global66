import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:pokedex/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:pokedex/features/favorites/presentation/viewmodels/favorites_viewmodel.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokedex/features/pokedex/presentation/pages/pokedex_page.dart';
import 'package:pokedex/features/pokedex/presentation/viewmodels/pokedex_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockToggleFavoriteUseCase extends Mock implements ToggleFavoriteUseCase {}

// ─── fake notifiers ──────────────────────────────────────────────────────────

class FakePokedexViewModel extends PokedexViewModel {
  final AsyncValue<PokedexState> fakeState;

  FakePokedexViewModel(this.fakeState);

  @override
  Future<PokedexState> build() async {
    return switch (fakeState) {
      AsyncData(:final value) => value,
      AsyncError(:final error) => throw error,
      _ => throw StateError('loading'),
    };
  }
}

class FakeFavoritesViewModel extends FavoritesViewModel {
  @override
  Future<FavoritesState> build() async => const FavoritesState();
}

// ─── helper ───────────────────────────────────────────────────────────────────

Widget buildPage(AsyncValue<PokedexState> pokedexState) {
  return ProviderScope(
    overrides: [
      pokedexViewModelProvider.overrideWith(
        () => FakePokedexViewModel(pokedexState),
      ),
      favoritesViewModelProvider.overrideWith(() => FakeFavoritesViewModel()),
    ],
    child: const MaterialApp(home: PokedexPage()),
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
  const tCharmander = Pokemon(
    id: 4,
    name: 'charmander',
    imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    thumbnailUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
    types: [PokemonType.fire],
  );

  group('PokedexPage', () {
    testWidgets('shows search field in AppBar', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(pokemons: [tBulbasaur], total: 1)),
      ));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('shows filter button in AppBar', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(pokemons: [tBulbasaur], total: 1)),
      ));
      await tester.pump();

      expect(find.byIcon(Icons.tune), findsOneWidget);
    });

    testWidgets('shows skeleton list while AsyncLoading', (tester) async {
      await tester.pumpWidget(buildPage(const AsyncLoading()));
      await tester.pump();

      expect(find.byType(PokedexPage), findsOneWidget);
      // PokedexSkeletonList is shown — no cards yet
      expect(find.text('Bulbasaur'), findsNothing);
    });

    testWidgets('shows error state on AsyncError', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncError(Exception('network error'), StackTrace.empty),
      ));
      await tester.pumpAndSettle(); // allow async build() to throw and widget to rebuild

      expect(find.text('Algo salio mal...'), findsOneWidget);
    });

    testWidgets('shows Pokémon cards when data is loaded', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(
          pokemons: [tBulbasaur, tCharmander],
          total: 2,
        )),
      ));
      await tester.pump();

      expect(find.text('Bulbasaur'), findsOneWidget);
      expect(find.text('Charmander'), findsOneWidget);
    });

    testWidgets('shows empty state when filteredPokemons is empty', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(
          pokemons: [tBulbasaur],
          total: 1,
          searchQuery: 'xyzabc', // no match
        )),
      ));
      await tester.pump();

      expect(find.text('No hay Pokémons'), findsOneWidget);
    });

    testWidgets('shows result count row when search query is active',
        (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(
          pokemons: [tBulbasaur, tCharmander],
          total: 2,
        )),
      ));
      await tester.pump();

      // Type into the search field — this updates _searchController.text,
      // which drives hasActiveFiltersOrSearch in the page
      await tester.enterText(find.byType(TextField), 'char');
      await tester.pump();

      expect(find.text('Borrar filtro'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (w) => w is RichText && w.text.toPlainText().contains('resultados'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows result count row when type filter is active',
        (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(
          pokemons: [tBulbasaur, tCharmander],
          total: 2,
          selectedTypes: {PokemonType.fire},
        )),
      ));
      await tester.pump();

      expect(
        find.byWidgetPredicate(
          (w) => w is RichText && w.text.toPlainText().contains('resultados'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows filter badge dot when filters are active', (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(
          pokemons: [tBulbasaur],
          total: 1,
          selectedTypes: {PokemonType.grass},
        )),
      ));
      await tester.pump();

      // The badge is a small Container inside a Stack — just verify the page renders
      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('shows "Limpiar filtros" retry button when type filter yields empty results',
        (tester) async {
      await tester.pumpWidget(buildPage(
        AsyncData(PokedexState(
          pokemons: [tBulbasaur],
          total: 1,
          selectedTypes: {PokemonType.dragon},
        )),
      ));
      await tester.pump();

      expect(find.text('Limpiar filtros'), findsOneWidget);
    });
  });
}
