import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design_system/components/organisms/pokedex_skeleton_list.dart';
import 'package:pokedex/l10n/l10n.dart';

import '../../../../core/router/route_names.dart';
import '../../../../design_system/components/molecules/app_error_state.dart';
import '../../../../design_system/components/molecules/pokemon_card.dart';
import '../../../../design_system/tokens/app_colors.dart';
import '../../../../design_system/tokens/app_spacing.dart';
import '../../../../design_system/tokens/app_typography.dart';
import '../viewmodels/favorites_viewmodel.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text(
          context.l10n.favoritesTitle,
          style: AppTypography.fontStyle4Semibold.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: switch (state) {
        AsyncLoading() => PokedexSkeletonList(),
        AsyncError(:final error) => AppErrorState(
          title: context.l10n.errorTitle,
          subtitle: error.toString(),
          image: 'jigglypuff_image.png',
        ),
        AsyncData(:final value) when value.favorites.isEmpty => AppErrorState(
          title: context.l10n.noFavorites,
          subtitle: context.l10n.noFavoritesSubtitle,
          image: 'jigglypuff_image.png',
        ),
        AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.md),
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sl),
          itemCount: value.favorites.length,
          itemBuilder: (context, index) {
            final pokemon = value.favorites[index];
            return PokemonCard(
              pokemon: pokemon,
              isFavorite: true,
              onFavorite: () => ref
                  .read(favoritesViewModelProvider.notifier)
                  .toggleFavorite(pokemon),
              onTap: () => context.goNamed(
                AppRoute.pokemonDetail,
                pathParameters: {'id': pokemon.id.toString()},
                extra: pokemon,
              ),
            );
          },
        ),
      },
    );
  }
}
