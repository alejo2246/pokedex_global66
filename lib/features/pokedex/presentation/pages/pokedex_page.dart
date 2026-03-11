import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design_system/components/atoms/app_button.dart';
import 'package:pokedex/design_system/components/atoms/app_text_field.dart';
import 'package:pokedex/design_system/components/molecules/app_error_state.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';

import '../../../../core/constants/pokemon_type.dart';
import '../../../../core/router/route_names.dart';
import '../../../../design_system/components/molecules/app_multi_select.dart';
import '../../../../design_system/components/molecules/pokemon_card.dart';
import '../../../../design_system/components/molecules/pokemon_card_skeleton.dart';
import '../../../../design_system/components/organisms/pokedex_skeleton_list.dart';
import '../../../../design_system/tokens/app_colors.dart';
import '../../../../design_system/tokens/app_spacing.dart';
import '../../../../design_system/tokens/app_typography.dart';
import '../../domain/entities/pokemon.dart';
import '../viewmodels/pokedex_viewmodel.dart';
import '../../../favorites/presentation/viewmodels/favorites_viewmodel.dart';

class PokedexPage extends ConsumerStatefulWidget {
  const PokedexPage({super.key});

  @override
  ConsumerState<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends ConsumerState<PokedexPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      ref.read(pokedexViewModelProvider.notifier).loadMore();
    }
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<PokedexState>>(pokedexViewModelProvider, (
      prev,
      next,
    ) {
      final prevError = prev?.value?.loadMoreError;
      final nextError = next.value?.loadMoreError;
      if (nextError != null && nextError != prevError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nextError),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    final state = ref.watch(pokedexViewModelProvider);
    final bool hasActiveFilters = state.value?.hasActiveFilters ?? false;

    final bool hasActiveFiltersOrSearch =
        hasActiveFilters || _searchController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: AppTextField(
          controller: _searchController,
          iconLeft: 'search.svg',
          hint: 'Procurar Pokémon...',
          onChanged: (q) =>
              ref.read(pokedexViewModelProvider.notifier).setSearchQuery(q),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: _showFilterSheet,
                  child: Container(
                    width: 52,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.tapBarBorder),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.tune,
                        size: 20,
                        color: AppColors.textDisabled,
                      ),
                    ),
                  ),
                ),
                if (hasActiveFilters)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: switch (state) {
        AsyncLoading() => const PokedexSkeletonList(),
        AsyncError(:final error) => AppErrorState(
          title: 'Algo salio mal...',
          subtitle: error.toString(),
          onRetry: () => ref.read(pokedexViewModelProvider.notifier).refresh(),
        ),
        AsyncData(:final value) when value.filteredPokemons.isEmpty =>
          AppErrorState(
            title: 'No hay Pokémons',
            subtitle: value.hasActiveFilters
                ? 'Ningún Pokémon coincide con los filtros aplicados.'
                : 'La Pokédex está vacía por el momento.',
            retryLabel: 'Limpiar filtros',
            onRetry: value.hasActiveFilters ? _clearFilterAndSearch : null,
          ),
        AsyncData(:final value) => RefreshIndicator(
          onRefresh: () =>
              ref.read(pokedexViewModelProvider.notifier).refresh(),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(AppSpacing.md),
            separatorBuilder: (_, index) => SizedBox(
              height: hasActiveFiltersOrSearch && index == 0
                  ? AppSpacing.sm
                  : AppSpacing.sl,
            ),
            itemCount:
                value.filteredPokemons.length +
                (value.isLoadingMore ? 1 : 0) +
                (hasActiveFiltersOrSearch ? 1 : 0),
            itemBuilder: (context, index) {
              if (hasActiveFiltersOrSearch && index == 0) {
                return Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Se han encontrado ',
                        style: AppTypography.fontStyle3Regular.copyWith(
                          color: AppColors.textDisabled,
                        ),
                        children: [
                          TextSpan(
                            text: '${value.filteredPokemons.length} resultados',
                            style: AppTypography.fontStyle3Bold.copyWith(
                              color: AppColors.textDisabled,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: AppSpacing.xs),
                    InkWell(
                      onTap: _clearFilterAndSearch,
                      child: Text(
                        'Borrar filtro',
                        style: AppTypography.fontStyle3Medium.copyWith(
                          color: AppColors.textLink,
                          decoration: .underline,
                          decorationColor: AppColors.textLink,
                        ),
                      ),
                    ),
                  ],
                );
              }
              final i = hasActiveFiltersOrSearch ? index - 1 : index;
              if (i >= value.filteredPokemons.length) {
                return const PokemonCardSkeleton();
              }

              final pokemon = value.filteredPokemons[i];
              return _PokemonListItem(pokemon: pokemon);
            },
          ),
        ),
      },
    );
  }

  void _clearFilterAndSearch() {
    ref.read(pokedexViewModelProvider.notifier).clearFilters();
    _searchController.clear();
    ref.read(pokedexViewModelProvider.notifier).setSearchQuery('');
  }
}

class _FilterBottomSheet extends ConsumerStatefulWidget {
  const _FilterBottomSheet();

  @override
  ConsumerState<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<_FilterBottomSheet> {
  late Set<PokemonType> _pendingTypes;

  @override
  void initState() {
    super.initState();
    final current = ref.read(pokedexViewModelProvider).value?.selectedTypes;
    _pendingTypes = Set.from(current ?? {});
  }

  void _toggle(PokemonType type) {
    setState(() {
      if (_pendingTypes.contains(type)) {
        _pendingTypes.remove(type);
      } else {
        _pendingTypes.add(type);
      }
    });
  }

  void _apply() {
    ref.read(pokedexViewModelProvider.notifier).applyTypeFilters(_pendingTypes);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.75;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: AppRadius.borderRadius4),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  size: AppSpacing.lg,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: AppSpacing.sl),

              Center(
                child: Text(
                  'Filtra por tus preferencias',
                  style: AppTypography.fontStyle6Semibold,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              Flexible(
                child: AppMultiSelect<PokemonType>(
                  title: 'Tipo',
                  items: PokemonType.values,
                  selected: _pendingTypes,
                  labelBuilder: (type) => type.displayName,
                  onToggle: _toggle,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),
              AppButton(text: 'Aplicar', onPressed: _apply),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                text: 'Cancelar',
                onPressed: () => Navigator.pop(context),
                type: AppButtonType.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonListItem extends ConsumerWidget {
  final Pokemon pokemon;

  const _PokemonListItem({required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoritesViewModelProvider.select(
        (s) => s.value?.isFavorite(pokemon.id) ?? false,
      ),
    );

    return PokemonCard(
      pokemon: pokemon,
      isFavorite: isFavorite,
      onFavorite: () =>
          ref.read(favoritesViewModelProvider.notifier).toggleFavorite(pokemon),
      onTap: () => context.goNamed(
        AppRoute.pokemonDetail,
        pathParameters: {'id': pokemon.id.toString()},
        extra: pokemon,
      ),
    );
  }
}
