import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/favorites/domain/repositories/ifavorites_repository.dart';
import 'package:pokedex/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class MockFavoritesRepository extends Mock implements IFavoritesRepository {}

void main() {
  late MockFavoritesRepository mockRepository;
  late GetFavoritesUseCase useCase;

  const tPokemon = Pokemon(id: 1, name: 'bulbasaur', imageUrl: '', thumbnailUrl: '');

  setUp(() {
    mockRepository = MockFavoritesRepository();
    useCase = GetFavoritesUseCase(mockRepository);
  });

  test('calls repository.getFavorites() and returns the result', () async {
    when(() => mockRepository.getFavorites())
        .thenAnswer((_) async => const Success([tPokemon]));

    final result = await useCase.call();

    expect(result, isA<Success<List<Pokemon>>>());
    expect((result as Success<List<Pokemon>>).data.first.id, 1);
    verify(() => mockRepository.getFavorites()).called(1);
  });

  test('returns Failure when repository fails', () async {
    when(() => mockRepository.getFavorites())
        .thenAnswer((_) async => const Failure('load error'));

    final result = await useCase.call();

    expect(result, isA<Failure<List<Pokemon>>>());
    expect((result as Failure<List<Pokemon>>).message, 'load error');
  });

  test('returns Success with empty list', () async {
    when(() => mockRepository.getFavorites())
        .thenAnswer((_) async => const Success([]));

    final result = await useCase.call();

    expect(result, isA<Success<List<Pokemon>>>());
    expect((result as Success<List<Pokemon>>).data, isEmpty);
  });
}
