import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemon_list_usecase.dart';

part 'pokedex_viewmodel.g.dart';

class PokedexState {
  final List<Pokemon> pokemons;
  final bool isLoadingMore;
  final bool hasMore;
  final int offset;
  final int total;
  final String? loadMoreError;
  final String searchQuery;
  final Set<PokemonType> selectedTypes;

  const PokedexState({
    this.pokemons = const [],
    this.isLoadingMore = false,
    this.hasMore = true,
    this.offset = 0,
    this.total = 0,
    this.loadMoreError,
    this.searchQuery = '',
    this.selectedTypes = const {},
  });

  List<Pokemon> get filteredPokemons {
    var result = pokemons;
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      result = result.where((p) => p.name.contains(query)).toList();
    }
    if (selectedTypes.isNotEmpty) {
      result = result
          .where((p) => p.types.any(selectedTypes.contains))
          .toList();
    }
    return result;
  }

  bool get hasActiveFilters => selectedTypes.isNotEmpty;

  PokedexState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoadingMore,
    bool? hasMore,
    int? offset,
    int? total,
    String? loadMoreError,
    String? searchQuery,
    Set<PokemonType>? selectedTypes,
  }) {
    return PokedexState(
      pokemons: pokemons ?? this.pokemons,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      offset: offset ?? this.offset,
      total: total ?? this.total,
      loadMoreError: loadMoreError,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedTypes: selectedTypes ?? this.selectedTypes,
    );
  }
}

const _pageSize = 50;

@riverpod
class PokedexViewModel extends _$PokedexViewModel {
  @override
  Future<PokedexState> build() async {
    final result = await ref
        .read(getPokemonListUseCaseProvider)
        .call(limit: _pageSize, offset: 0);

    switch (result) {
      case Success(:final data):
        return PokedexState(
          pokemons: data.pokemons,
          offset: data.pokemons.length,
          total: data.count,
          hasMore: data.next != null,
        );
      case Failure(:final message):
        throw Exception(message);
    }
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    final result = await ref
        .read(getPokemonListUseCaseProvider)
        .call(limit: _pageSize, offset: current.offset);

    switch (result) {
      case Success(:final data):
        state = AsyncData(
          current.copyWith(
            isLoadingMore: false,
            pokemons: [...current.pokemons, ...data.pokemons],
            offset: current.offset + data.pokemons.length,
            total: data.count,
            hasMore: data.next != null,
          ),
        );
      case Failure(:final message):
        state = AsyncData(
          current.copyWith(isLoadingMore: false, loadMoreError: message),
        );
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  void setSearchQuery(String query) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(searchQuery: query));
  }

  void toggleTypeFilter(PokemonType type) {
    final current = state.value;
    if (current == null) return;
    final updated = Set<PokemonType>.from(current.selectedTypes);
    if (updated.contains(type)) {
      updated.remove(type);
    } else {
      updated.add(type);
    }
    state = AsyncData(current.copyWith(selectedTypes: updated));
  }

  void applyTypeFilters(Set<PokemonType> types) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(selectedTypes: Set.from(types)));
  }

  void clearFilters() {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(selectedTypes: {}));
  }
}
