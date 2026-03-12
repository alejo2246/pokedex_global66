import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/result.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokedex/features/pokedex/presentation/viewmodels/pokedex_viewmodel.dart';

class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}

void main() {
  late MockGetPokemonListUseCase mockUseCase;
  late ProviderContainer container;

  const tBulbasaur = Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.grass],
  );
  const tCharmander = Pokemon(
    id: 4,
    name: 'charmander',
    imageUrl: '',
    thumbnailUrl: '',
    types: [PokemonType.fire],
  );

  final tFirstPage = PokemonListResult(
    count: 151,
    next: 'https://next-page',
    pokemons: [tBulbasaur],
  );
  final tSecondPage = PokemonListResult(
    count: 151,
    next: null,
    pokemons: [tCharmander],
  );
  final tSinglePage = PokemonListResult(
    count: 1,
    next: null,
    pokemons: [tBulbasaur],
  );

  setUp(() {
    mockUseCase = MockGetPokemonListUseCase();
    container = ProviderContainer(
      overrides: [
        getPokemonListUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
    addTearDown(container.dispose);
  });

  void stubUseCase(Result<PokemonListResult> result) {
    when(() => mockUseCase.call(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => result);
  }

  group('build', () {
    test('loads first page and builds initial state', () async {
      stubUseCase(Success(tFirstPage));

      final state = await container.read(pokedexViewModelProvider.future);

      expect(state.pokemons.length, 1);
      expect(state.pokemons.first.name, 'bulbasaur');
      expect(state.total, 151);
      expect(state.hasMore, isTrue);
      expect(state.offset, 1);
    });

    test('hasMore is false when next is null', () async {
      stubUseCase(Success(tSinglePage));

      final state = await container.read(pokedexViewModelProvider.future);

      expect(state.hasMore, isFalse);
    });

    test('provider future rejects when use case returns Failure', () async {
      stubUseCase(const Failure('network error'));

      // In Riverpod 3, provider.future rejects ↔ state is AsyncError
      final threw = await container
          .read(pokedexViewModelProvider.future)
          .then((_) => false, onError: (_) => true);

      expect(threw, isTrue);
    });

    test('sets isLoadingMore to false initially', () async {
      stubUseCase(Success(tFirstPage));

      final state = await container.read(pokedexViewModelProvider.future);

      expect(state.isLoadingMore, isFalse);
    });
  });

  group('loadMore', () {
    test('appends pokemons from second page', () async {
      var callCount = 0;
      when(() => mockUseCase.call(
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenAnswer(
        (_) async => callCount++ == 0 ? Success(tFirstPage) : Success(tSecondPage),
      );

      await container.read(pokedexViewModelProvider.future);
      await container.read(pokedexViewModelProvider.notifier).loadMore();

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.pokemons.length, 2);
      expect(state.pokemons[0].name, 'bulbasaur');
      expect(state.pokemons[1].name, 'charmander');
    });

    test('sets hasMore to false when second page has no next', () async {
      var callCount = 0;
      when(() => mockUseCase.call(
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenAnswer(
        (_) async => callCount++ == 0 ? Success(tFirstPage) : Success(tSecondPage),
      );

      await container.read(pokedexViewModelProvider.future);
      await container.read(pokedexViewModelProvider.notifier).loadMore();

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.hasMore, isFalse);
    });

    test('does not call use case when hasMore is false', () async {
      stubUseCase(Success(tSinglePage));

      await container.read(pokedexViewModelProvider.future);
      await container.read(pokedexViewModelProvider.notifier).loadMore();

      verify(() => mockUseCase.call(
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).called(1); // only the initial build call
    });

    test('sets loadMoreError and clears isLoadingMore on failure', () async {
      var callCount = 0;
      when(() => mockUseCase.call(
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenAnswer(
        (_) async =>
            callCount++ == 0 ? Success(tFirstPage) : const Failure('page error'),
      );

      await container.read(pokedexViewModelProvider.future);
      await container.read(pokedexViewModelProvider.notifier).loadMore();

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.loadMoreError, 'page error');
      expect(state.isLoadingMore, isFalse);
      expect(state.pokemons.length, 1); // original list preserved
    });

    test('advances offset by the number of new pokemons', () async {
      var callCount = 0;
      when(() => mockUseCase.call(
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenAnswer(
        (_) async => callCount++ == 0 ? Success(tFirstPage) : Success(tSecondPage),
      );

      await container.read(pokedexViewModelProvider.future);
      await container.read(pokedexViewModelProvider.notifier).loadMore();

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.offset, 2); // 1 from first page + 1 from second
    });
  });

  group('setSearchQuery', () {
    test('updates searchQuery in state', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container.read(pokedexViewModelProvider.notifier).setSearchQuery('char');

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.searchQuery, 'char');
    });

    test('empty query clears the filter', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container.read(pokedexViewModelProvider.notifier).setSearchQuery('char');
      container.read(pokedexViewModelProvider.notifier).setSearchQuery('');

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.searchQuery, '');
    });
  });

  group('applyTypeFilters', () {
    test('sets the selected types', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container
          .read(pokedexViewModelProvider.notifier)
          .applyTypeFilters({PokemonType.fire, PokemonType.water});

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.selectedTypes, {PokemonType.fire, PokemonType.water});
      expect(state.hasActiveFilters, isTrue);
    });

    test('replaces existing type selection', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container
          .read(pokedexViewModelProvider.notifier)
          .applyTypeFilters({PokemonType.fire});
      container
          .read(pokedexViewModelProvider.notifier)
          .applyTypeFilters({PokemonType.water});

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.selectedTypes, {PokemonType.water});
    });
  });

  group('clearFilters', () {
    test('clears all selected types', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container
          .read(pokedexViewModelProvider.notifier)
          .applyTypeFilters({PokemonType.fire});
      container.read(pokedexViewModelProvider.notifier).clearFilters();

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.selectedTypes, isEmpty);
      expect(state.hasActiveFilters, isFalse);
    });
  });

  group('toggleTypeFilter', () {
    test('adds type when not selected', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container
          .read(pokedexViewModelProvider.notifier)
          .toggleTypeFilter(PokemonType.fire);

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.selectedTypes, contains(PokemonType.fire));
    });

    test('removes type when already selected', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container
          .read(pokedexViewModelProvider.notifier)
          .applyTypeFilters({PokemonType.fire});
      container
          .read(pokedexViewModelProvider.notifier)
          .toggleTypeFilter(PokemonType.fire);

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.selectedTypes, isNot(contains(PokemonType.fire)));
    });

    test('can toggle multiple types independently', () async {
      stubUseCase(Success(tFirstPage));

      await container.read(pokedexViewModelProvider.future);
      container
          .read(pokedexViewModelProvider.notifier)
          .toggleTypeFilter(PokemonType.fire);
      container
          .read(pokedexViewModelProvider.notifier)
          .toggleTypeFilter(PokemonType.water);

      final state = container.read(pokedexViewModelProvider).value!;
      expect(state.selectedTypes, containsAll([PokemonType.fire, PokemonType.water]));
    });
  });
}
