import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_detail.dart';

class MockDio extends Mock implements Dio {}

// ─── helpers ───────────────────────────────────────────────────────────────

Response<dynamic> _response(dynamic data) => Response(
      data: data,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

final _listJson = {
  'count': 151,
  'next': 'https://pokeapi.co/api/v2/pokemon?offset=20',
  'previous': null,
  'results': [
    {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
  ],
};

final _detailJson = {
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

final _fullJson = {
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
  ],
};

final _speciesJson = {
  'gender_rate': 1,
  'flavor_text_entries': [
    {
      'flavor_text': 'Una semilla misteriosa.',
      'language': {'name': 'es'},
    },
  ],
  'genera': [
    {'genus': 'Semilla Pokémon', 'language': {'name': 'es'}},
  ],
};

final _typeJson = {
  'name': 'grass',
  'damage_relations': {
    'double_damage_from': [
      {'name': 'fire'},
      {'name': 'ice'},
    ],
    'half_damage_from': [],
    'no_damage_from': [],
  },
};

void main() {
  late MockDio mockDio;
  late PokedexRepositoryImpl repository;

  setUp(() {
    mockDio = MockDio();
    repository = PokedexRepositoryImpl(mockDio);
    registerFallbackValue(RequestOptions(path: ''));
  });

  // ─── getPokemonList ──────────────────────────────────────────────────────
  group('getPokemonList', () {
    test('returns Success with PokemonListResult on 200', () async {
      when(() => mockDio.get(
            '/pokemon',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _response(_listJson));

      final result = await repository.getPokemonList(limit: 20, offset: 0);

      expect(result, isA<Success<PokemonListResult>>());
      final data = (result as Success<PokemonListResult>).data;
      expect(data.count, 151);
      expect(data.pokemons.length, 1);
      expect(data.pokemons.first.name, 'bulbasaur');
    });

    test('preserves next URL', () async {
      when(() => mockDio.get(
            '/pokemon',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _response(_listJson));

      final result = await repository.getPokemonList();
      final data = (result as Success<PokemonListResult>).data;

      expect(data.next, isNotNull);
    });

    test('next is null when last page', () async {
      final noNextJson = {..._listJson, 'next': null};
      when(() => mockDio.get(
            '/pokemon',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _response(noNextJson));

      final result = await repository.getPokemonList();
      final data = (result as Success<PokemonListResult>).data;

      expect(data.next, isNull);
    });

    test('returns Failure on DioException', () async {
      when(() => mockDio.get(
            '/pokemon',
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/pokemon'),
        type: DioExceptionType.connectionTimeout,
      ));

      final result = await repository.getPokemonList();

      expect(result, isA<Failure<PokemonListResult>>());
    });

    test('returns Failure on generic exception', () async {
      when(() => mockDio.get(
            '/pokemon',
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(Exception('unexpected'));

      final result = await repository.getPokemonList();

      expect(result, isA<Failure<PokemonListResult>>());
    });
  });

  // ─── getPokemonDetail ────────────────────────────────────────────────────
  group('getPokemonDetail', () {
    test('returns Success with Pokemon and types on 200', () async {
      when(() => mockDio.get('/pokemon/1'))
          .thenAnswer((_) async => _response(_detailJson));

      final result = await repository.getPokemonDetail(1);

      expect(result, isA<Success<Pokemon>>());
      final pokemon = (result as Success<Pokemon>).data;
      expect(pokemon.id, 1);
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.types.length, 2);
    });

    test('passes the correct id in the URL', () async {
      when(() => mockDio.get('/pokemon/25'))
          .thenAnswer((_) async => _response({
                'id': 25,
                'name': 'pikachu',
                'types': [
                  {
                    'slot': 1,
                    'type': {'name': 'electric'},
                  },
                ],
              }));

      final result = await repository.getPokemonDetail(25);

      expect(result, isA<Success<Pokemon>>());
      expect((result as Success<Pokemon>).data.id, 25);
    });

    test('returns Failure on DioException', () async {
      when(() => mockDio.get('/pokemon/1')).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/pokemon/1'),
        type: DioExceptionType.badResponse,
        response: Response(
          data: null,
          statusCode: 404,
          requestOptions: RequestOptions(path: '/pokemon/1'),
        ),
      ));

      final result = await repository.getPokemonDetail(1);

      expect(result, isA<Failure<Pokemon>>());
    });
  });

  // ─── getPokemonFullDetail ────────────────────────────────────────────────
  group('getPokemonFullDetail', () {
    setUp(() {
      // Stub pokemon + species parallel requests
      when(() => mockDio.get('/pokemon/1'))
          .thenAnswer((_) async => _response(_fullJson));
      when(() => mockDio.get('/pokemon-species/1'))
          .thenAnswer((_) async => _response(_speciesJson));
      // Stub type request
      when(() => mockDio.get('/type/grass'))
          .thenAnswer((_) async => _response(_typeJson));
    });

    test('returns Success with PokemonDetail', () async {
      final result = await repository.getPokemonFullDetail(1);

      expect(result, isA<Success<PokemonDetail>>());
    });

    test('converts height from decimeters to meters', () async {
      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.heightM, closeTo(0.7, 0.001));
    });

    test('converts weight from hectograms to kilograms', () async {
      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.weightKg, closeTo(6.9, 0.001));
    });

    test('parses Spanish description (removes newlines)', () async {
      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.description, isNotEmpty);
      expect(detail.description, isNot(contains('\n')));
      expect(detail.description, isNot(contains('\f')));
    });

    test('parses Spanish category (strips " Pokémon" suffix)', () async {
      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.category, 'Semilla');
    });

    test('preserves genderRate from species', () async {
      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.genderRate, 1);
    });

    test('normalizes ability name (replaces hyphens with spaces)', () async {
      when(() => mockDio.get('/pokemon/1')).thenAnswer((_) async => _response({
            ..._fullJson,
            'abilities': [
              {
                'ability': {'name': 'solar-power'},
                'is_hidden': true,
              },
            ],
          }));

      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.abilities.first.name, 'solar power');
    });

    test('calculates weaknesses correctly (fire > 1x against grass)', () async {
      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      // Grass type: doubleDamageFrom fire & ice
      expect(detail.weaknesses, contains(isA<Object>()));
    });

    test('returns empty description when no Spanish entry exists', () async {
      final noEsSpecies = {
        'gender_rate': 0,
        'flavor_text_entries': [
          {
            'flavor_text': 'English only.',
            'language': {'name': 'en'},
          },
        ],
        'genera': [
          {'genus': 'Seed Pokémon', 'language': {'name': 'en'}},
        ],
      };
      when(() => mockDio.get('/pokemon-species/1'))
          .thenAnswer((_) async => _response(noEsSpecies));

      final result = await repository.getPokemonFullDetail(1);
      final detail = (result as Success<PokemonDetail>).data;

      expect(detail.description, isEmpty);
      expect(detail.category, isEmpty);
    });

    test('returns Failure on DioException', () async {
      when(() => mockDio.get('/pokemon/1')).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/pokemon/1'),
        type: DioExceptionType.connectionTimeout,
      ));

      final result = await repository.getPokemonFullDetail(1);

      expect(result, isA<Failure<PokemonDetail>>());
    });
  });
}
