import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

void main() {
  const tPokemon = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: 'https://example.com/1.png',
    thumbnailUrl: 'https://example.com/thumb/1.png',
    types: [PokemonType.grass, PokemonType.poison],
  );

  final tJson = {
    'id': 1,
    'name': 'bulbasaur',
    'imageUrl': 'https://example.com/1.png',
    'thumbnailUrl': 'https://example.com/thumb/1.png',
    'types': ['grass', 'poison'],
  };

  group('Pokemon', () {
    group('fromJson', () {
      test('creates Pokemon with correct fields', () {
        final result = Pokemon.fromJson(tJson);
        expect(result.id, 1);
        expect(result.name, 'bulbasaur');
        expect(result.imageUrl, 'https://example.com/1.png');
        expect(result.thumbnailUrl, 'https://example.com/thumb/1.png');
        expect(result.types, [PokemonType.grass, PokemonType.poison]);
      });

      test('handles empty types list', () {
        final json = {...tJson, 'types': <String>[]};
        final result = Pokemon.fromJson(json);
        expect(result.types, isEmpty);
      });

      test('maps unknown type to PokemonType.normal', () {
        final json = {...tJson, 'types': ['totally_unknown']};
        final result = Pokemon.fromJson(json);
        expect(result.types, [PokemonType.normal]);
      });

      test('handles single type', () {
        final json = {...tJson, 'types': ['fire']};
        final result = Pokemon.fromJson(json);
        expect(result.types, [PokemonType.fire]);
      });
    });

    group('toJson', () {
      test('serializes all fields correctly', () {
        final result = tPokemon.toJson();
        expect(result['id'], 1);
        expect(result['name'], 'bulbasaur');
        expect(result['imageUrl'], 'https://example.com/1.png');
        expect(result['thumbnailUrl'], 'https://example.com/thumb/1.png');
        expect(result['types'], ['grass', 'poison']);
      });

      test('serializes empty types as empty list', () {
        const p = Pokemon(id: 2, name: 'test', imageUrl: '', thumbnailUrl: '');
        expect(p.toJson()['types'], isEmpty);
      });
    });

    group('round-trip', () {
      test('fromJson(toJson()) preserves all data', () {
        final result = Pokemon.fromJson(tPokemon.toJson());
        expect(result.id, tPokemon.id);
        expect(result.name, tPokemon.name);
        expect(result.imageUrl, tPokemon.imageUrl);
        expect(result.thumbnailUrl, tPokemon.thumbnailUrl);
        expect(result.types, tPokemon.types);
      });
    });

    group('default values', () {
      test('types defaults to empty list', () {
        const p = Pokemon(id: 1, name: 'test', imageUrl: '', thumbnailUrl: '');
        expect(p.types, isEmpty);
      });
    });
  });

  group('PokemonListResult', () {
    test('holds count, next and pokemons', () {
      final result = PokemonListResult(
        count: 151,
        next: 'https://next-page',
        pokemons: [tPokemon],
      );
      expect(result.count, 151);
      expect(result.next, 'https://next-page');
      expect(result.pokemons.length, 1);
    });

    test('next is nullable', () {
      final result = PokemonListResult(count: 10, pokemons: []);
      expect(result.next, isNull);
    });
  });
}
