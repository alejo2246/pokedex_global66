import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/constants/api_constants.dart';
import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/pokedex/data/dto/list/pokemon_detail_response.dart';
import 'package:pokedex/features/pokedex/data/dto/list/pokemon_list_response.dart';
import 'package:pokedex/features/pokedex/data/dto/detail/pokemon_full_response.dart';
import 'package:pokedex/features/pokedex/data/dto/detail/pokemon_species_response.dart';
import 'package:pokedex/features/pokedex/data/dto/detail/pokemon_type_response.dart';

void main() {
  // ───────────────── PokemonListResponse ─────────────────
  group('PokemonListResponse', () {
    final tJson = {
      'count': 151,
      'next': 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
      'previous': null,
      'results': [
        {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
        {'name': 'ivysaur', 'url': 'https://pokeapi.co/api/v2/pokemon/2/'},
      ],
    };

    test('fromJson parses count, next and results', () {
      final response = PokemonListResponse.fromJson(tJson);
      expect(response.count, 151);
      expect(response.next, isNotNull);
      expect(response.results.length, 2);
      expect(response.results.first.name, 'bulbasaur');
    });

    test('next is null when there are no more pages', () {
      final json = {...tJson, 'next': null};
      final response = PokemonListResponse.fromJson(json);
      expect(response.next, isNull);
    });

    test('toEntity converts to PokemonListResult correctly', () {
      final response = PokemonListResponse.fromJson(tJson);
      final entity = response.toEntity();
      expect(entity.count, 151);
      expect(entity.pokemons.length, 2);
      expect(entity.pokemons.first.id, 1);
      expect(entity.pokemons.first.name, 'bulbasaur');
    });
  });

  // ───────────────── PokemonEntryModel ─────────────────
  group('PokemonEntryModel', () {
    const tEntry = PokemonEntryModel(
      name: 'pikachu',
      url: 'https://pokeapi.co/api/v2/pokemon/25/',
    );

    test('id extracts the numeric id from the URL', () {
      expect(tEntry.id, 25);
    });

    test('toEntity builds Pokemon with correct image URLs', () {
      final pokemon = tEntry.toEntity();
      expect(pokemon.id, 25);
      expect(pokemon.name, 'pikachu');
      expect(pokemon.imageUrl, ApiConstants.pokemonImageUrl(25));
      expect(pokemon.thumbnailUrl, ApiConstants.pokemonThumbnailUrl(25));
      expect(pokemon.types, isEmpty); // list endpoint has no types
    });

    test('id works for 3-digit ids', () {
      const entry = PokemonEntryModel(
        name: 'mewtwo',
        url: 'https://pokeapi.co/api/v2/pokemon/150/',
      );
      expect(entry.id, 150);
    });
  });

  // ───────────────── PokemonDetailResponse ─────────────────
  group('PokemonDetailResponse', () {
    final tJson = {
      'id': 1,
      'name': 'bulbasaur',
      'types': [
        {
          'slot': 1,
          'type': {'name': 'grass'},
        },
        {
          'slot': 2,
          'type': {'name': 'poison'},
        },
      ],
    };

    test('fromJson parses id, name and types', () {
      final response = PokemonDetailResponse.fromJson(tJson);
      expect(response.id, 1);
      expect(response.name, 'bulbasaur');
      expect(response.types.length, 2);
      expect(response.types.first.type.name, 'grass');
    });

    test('toEntity maps types to PokemonType enum', () {
      final response = PokemonDetailResponse.fromJson(tJson);
      final entity = response.toEntity();
      expect(entity.types, [PokemonType.grass, PokemonType.poison]);
    });

    test('toEntity builds correct image URLs from id', () {
      final response = PokemonDetailResponse.fromJson(tJson);
      final entity = response.toEntity();
      expect(entity.imageUrl, ApiConstants.pokemonImageUrl(1));
      expect(entity.thumbnailUrl, ApiConstants.pokemonThumbnailUrl(1));
    });

    test('unknown type maps to PokemonType.normal', () {
      final json = {
        'id': 1,
        'name': 'test',
        'types': [
          {
            'slot': 1,
            'type': {'name': 'shadow'}, // not a real type
          },
        ],
      };
      final entity = PokemonDetailResponse.fromJson(json).toEntity();
      expect(entity.types, [PokemonType.normal]);
    });
  });

  // ───────────────── PokemonSpeciesResponse ─────────────────
  group('PokemonSpeciesResponse', () {
    final tJson = {
      'gender_rate': 1,
      'flavor_text_entries': [
        {
          'flavor_text': 'A strange seed was\nplanted.',
          'language': {'name': 'en'},
        },
        {
          'flavor_text': 'Una semilla\nextraña fue plantada.',
          'language': {'name': 'es'},
        },
      ],
      'genera': [
        {'genus': 'Seed Pokémon', 'language': {'name': 'en'}},
        {'genus': 'Semilla Pokémon', 'language': {'name': 'es'}},
      ],
    };

    test('fromJson parses genderRate, flavorTextEntries and genera', () {
      final response = PokemonSpeciesResponse.fromJson(tJson);
      expect(response.genderRate, 1);
      expect(response.flavorTextEntries.length, 2);
      expect(response.genera.length, 2);
    });

    test('flavorTextEntry has correct language', () {
      final response = PokemonSpeciesResponse.fromJson(tJson);
      final esEntry = response.flavorTextEntries
          .firstWhere((e) => e.language.name == 'es');
      expect(esEntry.flavorText, contains('semilla'));
    });

    test('genus has correct language', () {
      final response = PokemonSpeciesResponse.fromJson(tJson);
      final esGenus = response.genera
          .firstWhere((g) => g.language.name == 'es');
      expect(esGenus.genus, contains('Semilla'));
    });

    test('genderRate -1 means genderless', () {
      final json = {...tJson, 'gender_rate': -1};
      final response = PokemonSpeciesResponse.fromJson(json);
      expect(response.genderRate, -1);
    });
  });

  // ───────────────── PokemonTypeResponse / weakness calculation ─────────────────
  group('PokemonTypeResponse', () {
    final tJson = {
      'name': 'grass',
      'damage_relations': {
        'double_damage_from': [
          {'name': 'fire'},
          {'name': 'ice'},
        ],
        'half_damage_from': [
          {'name': 'water'},
          {'name': 'grass'},
        ],
        'no_damage_from': [],
      },
    };

    test('fromJson parses name and damage relations', () {
      final response = PokemonTypeResponse.fromJson(tJson);
      expect(response.name, 'grass');
      expect(response.damageRelations.doubleDamageFrom.length, 2);
      expect(response.damageRelations.halfDamageFrom.length, 2);
      expect(response.damageRelations.noDamageFrom, isEmpty);
    });

    test('doubleDamageFrom contains correct type names', () {
      final response = PokemonTypeResponse.fromJson(tJson);
      final names = response.damageRelations.doubleDamageFrom
          .map((t) => t.name)
          .toList();
      expect(names, containsAll(['fire', 'ice']));
    });
  });

  // ───────────────── PokemonFullResponse ─────────────────
  group('PokemonFullResponse', () {
    final tJson = {
      'id': 1,
      'name': 'bulbasaur',
      'height': 7,
      'weight': 69,
      'types': [
        {
          'slot': 1,
          'type': {'name': 'grass'},
        },
      ],
      'abilities': [
        {
          'ability': {'name': 'overgrow'},
          'is_hidden': false,
        },
        {
          'ability': {'name': 'chlorophyll'},
          'is_hidden': true,
        },
      ],
    };

    test('fromJson parses all fields', () {
      final response = PokemonFullResponse.fromJson(tJson);
      expect(response.id, 1);
      expect(response.name, 'bulbasaur');
      expect(response.height, 7);
      expect(response.weight, 69);
      expect(response.types.length, 1);
      expect(response.abilities.length, 2);
    });

    test('height and weight conversion: height / 10 = meters', () {
      final response = PokemonFullResponse.fromJson(tJson);
      expect(response.height / 10, 0.7);
      expect(response.weight / 10, 6.9);
    });

    test('abilities include hidden flag correctly', () {
      final response = PokemonFullResponse.fromJson(tJson);
      expect(response.abilities.first.ability.name, 'overgrow');
      expect(response.abilities.first.isHidden, isFalse);
      expect(response.abilities.last.ability.name, 'chlorophyll');
      expect(response.abilities.last.isHidden, isTrue);
    });
  });
}
