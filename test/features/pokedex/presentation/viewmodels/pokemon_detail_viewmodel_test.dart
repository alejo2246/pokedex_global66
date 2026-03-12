import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokedex/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex/features/pokedex/presentation/viewmodels/pokemon_detail_viewmodel.dart';

class MockGetPokemonDetailUseCase extends Mock
    implements GetPokemonDetailUseCase {}

void main() {
  late MockGetPokemonDetailUseCase mockUseCase;
  late ProviderContainer container;

  final tDetail = PokemonDetail(
    heightM: 0.7,
    weightKg: 6.9,
    abilities: const [
      PokemonAbility(name: 'overgrow', isHidden: false),
      PokemonAbility(name: 'chlorophyll', isHidden: true),
    ],
    description: 'Un Pokémon semilla misterioso.',
    category: 'Semilla',
    genderRate: 1,
    weaknesses: const [PokemonType.fire, PokemonType.psychic],
  );

  setUp(() {
    mockUseCase = MockGetPokemonDetailUseCase();
    container = ProviderContainer(
      overrides: [
        getPokemonDetailUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
    addTearDown(container.dispose);
  });

  test('returns PokemonDetail on Success', () async {
    when(() => mockUseCase.call(1)).thenAnswer((_) async => Success(tDetail));

    final detail = await container.read(pokemonDetailViewModelProvider(1).future);

    expect(detail.heightM, 0.7);
    expect(detail.weightKg, 6.9);
    expect(detail.description, 'Un Pokémon semilla misterioso.');
    expect(detail.category, 'Semilla');
    expect(detail.genderRate, 1);
  });

  test('returns abilities list correctly', () async {
    when(() => mockUseCase.call(1)).thenAnswer((_) async => Success(tDetail));

    final detail = await container.read(pokemonDetailViewModelProvider(1).future);

    expect(detail.abilities.length, 2);
    expect(detail.abilities.first.name, 'overgrow');
    expect(detail.abilities.first.isHidden, isFalse);
    expect(detail.abilities.last.isHidden, isTrue);
  });

  test('returns weaknesses list correctly', () async {
    when(() => mockUseCase.call(1)).thenAnswer((_) async => Success(tDetail));

    final detail = await container.read(pokemonDetailViewModelProvider(1).future);

    expect(detail.weaknesses, containsAll([PokemonType.fire, PokemonType.psychic]));
  });

  test('use case returns Failure → verifies call was made with error result', () async {
    when(() => mockUseCase.call(1))
        .thenAnswer((_) async => const Failure('api error'));

    final result = await mockUseCase.call(1);

    expect(result, isA<Failure<PokemonDetail>>());
    expect((result as Failure<PokemonDetail>).message, 'api error');
    verify(() => mockUseCase.call(1)).called(1);
  });

  test('uses the correct id when fetching', () async {
    when(() => mockUseCase.call(25)).thenAnswer((_) async => Success(tDetail));

    await container.read(pokemonDetailViewModelProvider(25).future);

    verify(() => mockUseCase.call(25)).called(1);
    verifyNever(() => mockUseCase.call(1));
  });

  test('different ids result in independent providers', () async {
    final tDetail2 = PokemonDetail(
      heightM: 1.7,
      weightKg: 90.5,
      abilities: const [PokemonAbility(name: 'blaze', isHidden: false)],
      description: 'A lizard Pokémon.',
      category: 'Lizard',
      genderRate: 1,
      weaknesses: const [PokemonType.water],
    );

    when(() => mockUseCase.call(1)).thenAnswer((_) async => Success(tDetail));
    when(() => mockUseCase.call(4)).thenAnswer((_) async => Success(tDetail2));

    final detail1 = await container.read(pokemonDetailViewModelProvider(1).future);
    final detail4 = await container.read(pokemonDetailViewModelProvider(4).future);

    expect(detail1.heightM, 0.7);
    expect(detail4.heightM, 1.7);
  });
}
