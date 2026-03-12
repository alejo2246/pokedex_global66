import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/domain/repositories/ipokedex_repository.dart';
import 'package:pokedex/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';

class MockPokedexRepository extends Mock implements IPokedexRepository {}

void main() {
  late MockPokedexRepository mockRepository;
  late GetPokemonListUseCase useCase;

  const tBase = Pokemon(id: 1, name: 'bulbasaur', imageUrl: 'url', thumbnailUrl: 'thumb');
  const tEnriched = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: 'url',
    thumbnailUrl: 'thumb',
    types: [PokemonType.grass],
  );
  final tListResult = PokemonListResult(
    count: 151,
    next: 'https://next-page',
    pokemons: [tBase],
  );

  setUp(() {
    mockRepository = MockPokedexRepository();
    useCase = GetPokemonListUseCase(mockRepository);
  });

  test('returns Success with enriched pokemons when all calls succeed', () async {
    when(() => mockRepository.getPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => Success(tListResult));
    when(() => mockRepository.getPokemonDetail(1))
        .thenAnswer((_) async => const Success(tEnriched));

    final result = await useCase.call(limit: 50, offset: 0);

    expect(result, isA<Success<PokemonListResult>>());
    final data = (result as Success<PokemonListResult>).data;
    expect(data.pokemons.first.types, [PokemonType.grass]);
  });

  test('preserves count and next from the list response', () async {
    when(() => mockRepository.getPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => Success(tListResult));
    when(() => mockRepository.getPokemonDetail(1))
        .thenAnswer((_) async => const Success(tEnriched));

    final result = await useCase.call();
    final data = (result as Success<PokemonListResult>).data;

    expect(data.count, 151);
    expect(data.next, 'https://next-page');
  });

  test('falls back to base pokemon when detail call fails', () async {
    when(() => mockRepository.getPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => Success(tListResult));
    when(() => mockRepository.getPokemonDetail(1))
        .thenAnswer((_) async => const Failure('timeout'));

    final result = await useCase.call();

    expect(result, isA<Success<PokemonListResult>>());
    final data = (result as Success<PokemonListResult>).data;
    expect(data.pokemons.first.types, isEmpty);
    expect(data.pokemons.first.name, 'bulbasaur');
  });

  test('returns Failure immediately when list call fails', () async {
    when(() => mockRepository.getPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => const Failure('network error'));

    final result = await useCase.call();

    expect(result, isA<Failure<PokemonListResult>>());
    verifyNever(() => mockRepository.getPokemonDetail(any()));
  });

  test('calls getPokemonDetail for each pokemon in the list', () async {
    final tListWith2 = PokemonListResult(
      count: 2,
      next: null,
      pokemons: [
        tBase,
        const Pokemon(id: 4, name: 'charmander', imageUrl: '', thumbnailUrl: ''),
      ],
    );
    when(() => mockRepository.getPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => Success(tListWith2));
    when(() => mockRepository.getPokemonDetail(any()))
        .thenAnswer((_) async => const Failure('any'));

    await useCase.call();

    verify(() => mockRepository.getPokemonDetail(1)).called(1);
    verify(() => mockRepository.getPokemonDetail(4)).called(1);
  });

  test('next is null when there are no more pages', () async {
    final noMorePages = PokemonListResult(count: 1, next: null, pokemons: [tBase]);
    when(() => mockRepository.getPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => Success(noMorePages));
    when(() => mockRepository.getPokemonDetail(1))
        .thenAnswer((_) async => const Success(tEnriched));

    final result = await useCase.call();
    final data = (result as Success<PokemonListResult>).data;

    expect(data.next, isNull);
  });
}
