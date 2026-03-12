import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/presentation/viewmodels/pokedex_viewmodel.dart';

void main() {
  const tBulbasaur = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.grass, PokemonType.poison],
  );
  const tCharmander = Pokemon(
    id: 4,
    name: 'charmander',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.fire],
  );
  const tSquirtle = Pokemon(
    id: 7,
    name: 'squirtle',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.water],
  );
  const tPokemons = [tBulbasaur, tCharmander, tSquirtle];

  group('PokedexState', () {
    group('filteredPokemons', () {
      test('returns all pokemons when no filters active', () {
        const state = PokedexState(pokemons: tPokemons);
        expect(state.filteredPokemons, tPokemons);
      });

      test('filters by search query (partial match)', () {
        const state = PokedexState(pokemons: tPokemons, searchQuery: 'char');
        expect(state.filteredPokemons.length, 1);
        expect(state.filteredPokemons.first.name, 'charmander');
      });

      test('search is case-insensitive', () {
        const state = PokedexState(pokemons: tPokemons, searchQuery: 'BULBA');
        expect(state.filteredPokemons.length, 1);
        expect(state.filteredPokemons.first.name, 'bulbasaur');
      });

      test('returns empty when no pokemon matches search', () {
        const state = PokedexState(pokemons: tPokemons, searchQuery: 'mew');
        expect(state.filteredPokemons, isEmpty);
      });

      test('filters by single type', () {
        const state = PokedexState(
          pokemons: tPokemons,
          selectedTypes: {PokemonType.water},
        );
        expect(state.filteredPokemons.length, 1);
        expect(state.filteredPokemons.first.name, 'squirtle');
      });

      test('filters by multiple types (OR logic — any matching type)', () {
        const state = PokedexState(
          pokemons: tPokemons,
          selectedTypes: {PokemonType.fire, PokemonType.water},
        );
        expect(state.filteredPokemons.length, 2);
      });

      test('pokemon with multi-type matches if any selected type matches', () {
        const state = PokedexState(
          pokemons: tPokemons,
          selectedTypes: {PokemonType.poison},
        );
        // Bulbasaur has grass + poison
        expect(state.filteredPokemons.length, 1);
        expect(state.filteredPokemons.first.name, 'bulbasaur');
      });

      test('returns empty when no pokemon matches type filter', () {
        const state = PokedexState(
          pokemons: tPokemons,
          selectedTypes: {PokemonType.dragon},
        );
        expect(state.filteredPokemons, isEmpty);
      });

      test('applies both search and type filter together', () {
        const state = PokedexState(
          pokemons: tPokemons,
          searchQuery: 'saur',
          selectedTypes: {PokemonType.grass},
        );
        expect(state.filteredPokemons.length, 1);
        expect(state.filteredPokemons.first.name, 'bulbasaur');
      });

      test('combined filter returns empty when search matches but type does not', () {
        const state = PokedexState(
          pokemons: tPokemons,
          searchQuery: 'bulba',
          selectedTypes: {PokemonType.fire},
        );
        expect(state.filteredPokemons, isEmpty);
      });
    });

    group('hasActiveFilters', () {
      test('returns false when selectedTypes is empty', () {
        const state = PokedexState();
        expect(state.hasActiveFilters, isFalse);
      });

      test('returns true when at least one type is selected', () {
        const state = PokedexState(selectedTypes: {PokemonType.fire});
        expect(state.hasActiveFilters, isTrue);
      });
    });

    group('copyWith', () {
      test('updates only the specified field', () {
        const state = PokedexState(pokemons: tPokemons, total: 100);
        final copy = state.copyWith(isLoadingMore: true);
        expect(copy.isLoadingMore, isTrue);
        expect(copy.pokemons, tPokemons);
        expect(copy.total, 100);
      });

      test('updates searchQuery', () {
        const state = PokedexState(searchQuery: 'bulb');
        final copy = state.copyWith(searchQuery: 'char');
        expect(copy.searchQuery, 'char');
      });

      test('updates selectedTypes', () {
        const state = PokedexState();
        final copy = state.copyWith(selectedTypes: {PokemonType.fire});
        expect(copy.selectedTypes, {PokemonType.fire});
      });

      test('always resets loadMoreError to null when not provided', () {
        const state = PokedexState(loadMoreError: 'previous error');
        final copy = state.copyWith(isLoadingMore: false);
        expect(copy.loadMoreError, isNull);
      });

      test('preserves loadMoreError when explicitly provided', () {
        const state = PokedexState();
        final copy = state.copyWith(loadMoreError: 'new error');
        expect(copy.loadMoreError, 'new error');
      });
    });
  });
}
