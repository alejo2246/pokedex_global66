import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokedex/domain/repositories/ipokedex_repository.dart';
import 'package:pokedex/features/pokedex/domain/usecases/get_pokemon_detail_usecase.dart';

class MockPokedexRepository extends Mock implements IPokedexRepository {}

void main() {
  late MockPokedexRepository mockRepository;
  late GetPokemonDetailUseCase useCase;

  final tDetail = PokemonDetail(
    heightM: 0.7,
    weightKg: 6.9,
    abilities: const [PokemonAbility(name: 'overgrow', isHidden: false)],
    description: 'A seed Pokémon.',
    category: 'Seed',
    genderRate: 1,
    weaknesses: const [PokemonType.fire, PokemonType.ice],
  );

  setUp(() {
    mockRepository = MockPokedexRepository();
    useCase = GetPokemonDetailUseCase(mockRepository);
  });

  test('delegates to repository.getPokemonFullDetail(id)', () async {
    when(() => mockRepository.getPokemonFullDetail(1))
        .thenAnswer((_) async => Success(tDetail));

    final result = await useCase.call(1);

    expect(result, isA<Success<PokemonDetail>>());
    verify(() => mockRepository.getPokemonFullDetail(1)).called(1);
  });

  test('returns the detail data on Success', () async {
    when(() => mockRepository.getPokemonFullDetail(1))
        .thenAnswer((_) async => Success(tDetail));

    final result = await useCase.call(1);
    final data = (result as Success<PokemonDetail>).data;

    expect(data.heightM, 0.7);
    expect(data.weightKg, 6.9);
    expect(data.abilities.first.name, 'overgrow');
    expect(data.weaknesses, contains(PokemonType.fire));
  });

  test('returns Failure when repository fails', () async {
    when(() => mockRepository.getPokemonFullDetail(1))
        .thenAnswer((_) async => const Failure('api error'));

    final result = await useCase.call(1);

    expect(result, isA<Failure<PokemonDetail>>());
    expect((result as Failure<PokemonDetail>).message, 'api error');
  });

  test('passes the correct id to the repository', () async {
    when(() => mockRepository.getPokemonFullDetail(25))
        .thenAnswer((_) async => Success(tDetail));

    await useCase.call(25);

    verify(() => mockRepository.getPokemonFullDetail(25)).called(1);
    verifyNever(() => mockRepository.getPokemonFullDetail(1));
  });
}
