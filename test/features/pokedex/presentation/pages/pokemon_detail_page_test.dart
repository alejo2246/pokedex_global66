import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/favorites/presentation/viewmodels/favorites_viewmodel.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokedex/presentation/pages/pokemon_detail_page.dart';
import 'package:pokedex/features/pokedex/presentation/viewmodels/pokemon_detail_viewmodel.dart';
import 'package:pokedex/l10n/app_localizations.dart';

// ─── fake notifiers ──────────────────────────────────────────────────────────

class FakePokemonDetailViewModel extends PokemonDetailViewModel {
  final AsyncValue<PokemonDetail> fakeState;

  FakePokemonDetailViewModel(this.fakeState);

  @override
  Future<PokemonDetail> build(int id) async {
    if (fakeState case AsyncData(:final value)) return value;
    if (fakeState case AsyncError(:final error, :final stackTrace)) {
      // Set state directly via microtask instead of throwing from build(),
      // which avoids timing issues with handleCreate in the generated code.
      Future.microtask(() {
        if (ref.mounted) state = AsyncError(error, stackTrace);
      });
    }
    // AsyncLoading or pending error: stall forever
    return await Completer<PokemonDetail>().future;
  }
}

class FakeFavoritesViewModel extends FavoritesViewModel {
  @override
  Future<FavoritesState> build() async => const FavoritesState();
}

// ─── constants ───────────────────────────────────────────────────────────────

const tPokemon = Pokemon(
  id: 1,
  name: 'bulbasaur',
  imageUrl:
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
  thumbnailUrl:
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
  types: [PokemonType.grass, PokemonType.poison],
);

final tDetail = PokemonDetail(
  heightM: 0.7,
  weightKg: 6.9,
  abilities: const [PokemonAbility(name: 'overgrow', isHidden: false)],
  description: 'Un Pokémon semilla misterioso.',
  category: 'Semilla',
  genderRate: 1,
  weaknesses: const [PokemonType.fire, PokemonType.ice],
);

// ─── helper ───────────────────────────────────────────────────────────────────

Widget buildPage(AsyncValue<PokemonDetail> detailState) {
  return ProviderScope(
    overrides: [
      pokemonDetailViewModelProvider.overrideWith2(
        (int id) => FakePokemonDetailViewModel(detailState),
      ),
      favoritesViewModelProvider.overrideWith(() => FakeFavoritesViewModel()),
    ],
    child: MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const PokemonDetailPage(pokemonId: '1', pokemon: tPokemon),
    ),
  );
}

void main() {
  group('PokemonDetailPage', () {
    // ── header (always visible regardless of state) ─────────────────────────

    testWidgets('shows Pokémon name in header', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('Bulbasaur'), findsOneWidget);
    });

    testWidgets('shows formatted id (Nº001)', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('Nº001'), findsOneWidget);
    });

    testWidgets('shows back button in AppBar', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.byIcon(Icons.arrow_back_ios_rounded), findsOneWidget);
    });

    // ── loading state ────────────────────────────────────────────────────────

    testWidgets('shows CircularProgressIndicator while AsyncLoading',
        (tester) async {
      await tester.pumpWidget(buildPage(const AsyncLoading()));
      // One pump — async build hasn't resolved yet (Completer never completes)
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    // ── error state ──────────────────────────────────────────────────────────

    testWidgets('shows error state on AsyncError', (tester) async {
      // Increase height so AppErrorState fits inside SliverFillRemaining
      tester.view.physicalSize = const Size(800, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        buildPage(AsyncError(Exception('api error'), StackTrace.empty)),
      );
      // First pump: build() stalls, microtask sets state = AsyncError
      // Second pump: widget rebuilds with error state
      await tester.pump();
      await tester.pump();
      expect(find.text('Algo salio mal...'), findsOneWidget);
    });

    // ── data state ───────────────────────────────────────────────────────────

    testWidgets('shows description text', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('Un Pokémon semilla misterioso.'), findsOneWidget);
    });

    testWidgets('shows info labels: Peso, Altura, Categoría, Habilidad',
        (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('PESO'), findsOneWidget);
      expect(find.text('ALTURA'), findsOneWidget);
      expect(find.text('CATEGORÍA'), findsOneWidget);
      expect(find.text('HABILIDAD'), findsOneWidget);
    });

    testWidgets('shows weight value in kg', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('6.9 kg'), findsOneWidget);
    });

    testWidgets('shows height value in meters', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('0.7 m'), findsOneWidget);
    });

    testWidgets('shows category value', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('Semilla'), findsOneWidget);
    });

    testWidgets('shows ability name capitalized', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('Overgrow'), findsOneWidget);
    });

    testWidgets('shows GENERO section', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('GENERO'), findsOneWidget);
    });

    // Content below the fold uses skipOffstage: false

    testWidgets('shows "Debilidades" section title', (tester) async {
      await tester.pumpWidget(buildPage(AsyncData(tDetail)));
      await tester.pump();
      expect(find.text('Debilidades', skipOffstage: false), findsOneWidget);
    });

    testWidgets('shows "Sin debilidades conocidas" when weaknesses empty',
        (tester) async {
      final detail = PokemonDetail(
        heightM: 0.7,
        weightKg: 6.9,
        abilities: const [PokemonAbility(name: 'overgrow', isHidden: false)],
        description: '',
        category: '',
        genderRate: 1,
        weaknesses: const [],
      );
      await tester.pumpWidget(buildPage(AsyncData(detail)));
      await tester.pump();
      expect(
        find.text('Sin debilidades conocidas', skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('shows "Sin género" for genderless Pokémon', (tester) async {
      final detail = PokemonDetail(
        heightM: 0.7,
        weightKg: 6.9,
        abilities: const [PokemonAbility(name: 'overgrow', isHidden: false)],
        description: '',
        category: '',
        genderRate: -1,
        weaknesses: const [],
      );
      await tester.pumpWidget(buildPage(AsyncData(detail)));
      await tester.pump();
      expect(find.text('Sin género', skipOffstage: false), findsOneWidget);
    });
  });
}
