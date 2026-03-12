import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:pokedex/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class MockFavoritesLocalDataSource extends Mock
    implements FavoritesLocalDataSource {}

void main() {
  late MockFavoritesLocalDataSource mockDataSource;
  late FavoritesRepositoryImpl repository;

  const tPokemon = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.grass],
  );

  setUp(() {
    mockDataSource = MockFavoritesLocalDataSource();
    repository = FavoritesRepositoryImpl(mockDataSource);
    registerFallbackValue(tPokemon);
  });

  group('getFavorites', () {
    test('returns Success with list when datasource succeeds', () async {
      when(() => mockDataSource.getAll()).thenReturn([tPokemon]);

      final result = await repository.getFavorites();

      expect(result, isA<Success<List<Pokemon>>>());
      expect((result as Success<List<Pokemon>>).data.first.id, 1);
    });

    test('returns Success with empty list', () async {
      when(() => mockDataSource.getAll()).thenReturn([]);

      final result = await repository.getFavorites();

      expect(result, isA<Success<List<Pokemon>>>());
      expect((result as Success<List<Pokemon>>).data, isEmpty);
    });

    test('returns Failure when datasource throws', () async {
      when(() => mockDataSource.getAll()).thenThrow(Exception('disk error'));

      final result = await repository.getFavorites();

      expect(result, isA<Failure<List<Pokemon>>>());
    });
  });

  group('toggleFavorite', () {
    test('calls remove when pokemon is already favorite', () async {
      when(() => mockDataSource.isFavorite(1)).thenReturn(true);
      when(() => mockDataSource.remove(1)).thenReturn(null);

      final result = await repository.toggleFavorite(tPokemon);

      verify(() => mockDataSource.remove(1)).called(1);
      verifyNever(() => mockDataSource.save(any()));
      expect(result, isA<Success<void>>());
    });

    test('calls save when pokemon is not a favorite', () async {
      when(() => mockDataSource.isFavorite(1)).thenReturn(false);
      when(() => mockDataSource.save(tPokemon)).thenReturn(null);

      final result = await repository.toggleFavorite(tPokemon);

      verify(() => mockDataSource.save(tPokemon)).called(1);
      verifyNever(() => mockDataSource.remove(any()));
      expect(result, isA<Success<void>>());
    });

    test('returns Failure when datasource throws on save', () async {
      when(() => mockDataSource.isFavorite(1)).thenReturn(false);
      when(() => mockDataSource.save(any())).thenThrow(Exception('write error'));

      final result = await repository.toggleFavorite(tPokemon);

      expect(result, isA<Failure<void>>());
    });

    test('returns Failure when datasource throws on remove', () async {
      when(() => mockDataSource.isFavorite(1)).thenReturn(true);
      when(() => mockDataSource.remove(any())).thenThrow(Exception('write error'));

      final result = await repository.toggleFavorite(tPokemon);

      expect(result, isA<Failure<void>>());
    });
  });

  group('isFavorite', () {
    test('returns true when datasource says it is', () {
      when(() => mockDataSource.isFavorite(1)).thenReturn(true);
      expect(repository.isFavorite(1), isTrue);
      verify(() => mockDataSource.isFavorite(1)).called(1);
    });

    test('returns false when datasource says it is not', () {
      when(() => mockDataSource.isFavorite(99)).thenReturn(false);
      expect(repository.isFavorite(99), isFalse);
    });
  });
}
