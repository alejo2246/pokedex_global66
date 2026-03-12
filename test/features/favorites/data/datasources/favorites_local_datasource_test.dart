import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPrefs;
  late FavoritesLocalDataSourceImpl dataSource;

  const tBulbasaur = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: 'https://example.com/1.png',
    thumbnailUrl: 'https://example.com/thumb/1.png',
    types: [PokemonType.grass],
  );
  const tCharmander = Pokemon(
    id: 4,
    name: 'charmander',
    imageUrl: 'https://example.com/4.png',
    thumbnailUrl: 'https://example.com/thumb/4.png',
    types: [PokemonType.fire],
  );

  setUp(() {
    mockPrefs = MockSharedPreferences();
    dataSource = FavoritesLocalDataSourceImpl(mockPrefs);
  });

  group('getAll', () {
    test('returns empty list when nothing is stored', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn(null);
      expect(dataSource.getAll(), isEmpty);
    });

    test('returns empty list when stored list is empty', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn([]);
      expect(dataSource.getAll(), isEmpty);
    });

    test('returns decoded Pokemon list', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);

      final result = dataSource.getAll();

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.name, 'bulbasaur');
      expect(result.first.types, [PokemonType.grass]);
    });

    test('returns all stored pokemon', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn([
        jsonEncode(tBulbasaur.toJson()),
        jsonEncode(tCharmander.toJson()),
      ]);

      final result = dataSource.getAll();

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[1].id, 4);
    });
  });

  group('save', () {
    test('adds pokemon to empty list', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn([]);
      when(() => mockPrefs.setStringList('favorites', any()))
          .thenAnswer((_) async => true);

      dataSource.save(tBulbasaur);

      final captured =
          verify(() => mockPrefs.setStringList('favorites', captureAny()))
              .captured
              .first as List<String>;
      expect(captured.length, 1);
      final saved = jsonDecode(captured.first) as Map<String, dynamic>;
      expect(saved['id'], 1);
      expect(saved['name'], 'bulbasaur');
    });

    test('appends pokemon to existing list', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);
      when(() => mockPrefs.setStringList('favorites', any()))
          .thenAnswer((_) async => true);

      dataSource.save(tCharmander);

      final captured =
          verify(() => mockPrefs.setStringList('favorites', captureAny()))
              .captured
              .first as List<String>;
      expect(captured.length, 2);
    });

    test('does not add duplicate — skips if already favorite', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);

      dataSource.save(tBulbasaur);

      verifyNever(() => mockPrefs.setStringList(any(), any()));
    });
  });

  group('remove', () {
    test('removes pokemon with matching id', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);
      when(() => mockPrefs.setStringList('favorites', any()))
          .thenAnswer((_) async => true);

      dataSource.remove(1);

      final captured =
          verify(() => mockPrefs.setStringList('favorites', captureAny()))
              .captured
              .first as List<String>;
      expect(captured, isEmpty);
    });

    test('keeps other pokemon when removing one', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn([
        jsonEncode(tBulbasaur.toJson()),
        jsonEncode(tCharmander.toJson()),
      ]);
      when(() => mockPrefs.setStringList('favorites', any()))
          .thenAnswer((_) async => true);

      dataSource.remove(1);

      final captured =
          verify(() => mockPrefs.setStringList('favorites', captureAny()))
              .captured
              .first as List<String>;
      expect(captured.length, 1);
      final remaining = jsonDecode(captured.first) as Map<String, dynamic>;
      expect(remaining['id'], 4);
    });

    test('does nothing when id is not in list', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);
      when(() => mockPrefs.setStringList('favorites', any()))
          .thenAnswer((_) async => true);

      dataSource.remove(99);

      final captured =
          verify(() => mockPrefs.setStringList('favorites', captureAny()))
              .captured
              .first as List<String>;
      expect(captured.length, 1);
    });
  });

  group('isFavorite', () {
    test('returns true when pokemon id is in list', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);
      expect(dataSource.isFavorite(1), isTrue);
    });

    test('returns false when pokemon id is not in list', () {
      when(() => mockPrefs.getStringList('favorites'))
          .thenReturn([jsonEncode(tBulbasaur.toJson())]);
      expect(dataSource.isFavorite(99), isFalse);
    });

    test('returns false when list is null', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn(null);
      expect(dataSource.isFavorite(1), isFalse);
    });

    test('returns false when list is empty', () {
      when(() => mockPrefs.getStringList('favorites')).thenReturn([]);
      expect(dataSource.isFavorite(1), isFalse);
    });
  });
}
