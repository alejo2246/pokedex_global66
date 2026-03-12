import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/favorites/domain/repositories/ifavorites_repository.dart';
import 'package:pokedex/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class MockFavoritesRepository extends Mock implements IFavoritesRepository {}

void main() {
  late MockFavoritesRepository mockRepository;
  late ToggleFavoriteUseCase useCase;

  const tPokemon = Pokemon(id: 1, name: 'bulbasaur', imageUrl: '', thumbnailUrl: '');

  setUp(() {
    mockRepository = MockFavoritesRepository();
    useCase = ToggleFavoriteUseCase(mockRepository);
    registerFallbackValue(tPokemon);
  });

  test('delegates to repository.toggleFavorite() and returns Success', () async {
    when(() => mockRepository.toggleFavorite(tPokemon))
        .thenAnswer((_) async => const Success(null));

    final result = await useCase.call(tPokemon);

    expect(result, isA<Success<void>>());
    verify(() => mockRepository.toggleFavorite(tPokemon)).called(1);
  });

  test('returns Failure when repository fails', () async {
    when(() => mockRepository.toggleFavorite(any()))
        .thenAnswer((_) async => const Failure('write error'));

    final result = await useCase.call(tPokemon);

    expect(result, isA<Failure<void>>());
    expect((result as Failure<void>).message, 'write error');
  });
}
