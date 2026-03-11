import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/design_system/components/atoms/favorite_icon.dart';
import 'package:pokedex/design_system/theme/pokemon_type_theme.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';

import '../../../core/utils/string_helper.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../../../features/pokedex/domain/entities/pokemon.dart';
import '../atoms/type_badge.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;
  final bool isFavorite;
  final VoidCallback? onFavorite;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.isFavorite = false,
    this.onFavorite,
  });

  static const double cardHeight = 102;

  @override
  Widget build(BuildContext context) {
    final PokemonType firstType = pokemon.types.first;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: firstType.softColor,
          borderRadius: const BorderRadius.all(AppRadius.borderRadius3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sl,
                  horizontal: AppSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      StringHelper.formatId(pokemon.id.toString()),
                      style: AppTypography.fontStyle2SemiBold.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      StringHelper.capitalize(pokemon.name),
                      style: AppTypography.fontStyle6Semibold,
                      overflow: .ellipsis,
                    ),
                    if (pokemon.types.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Wrap(
                        spacing: AppSpacing.xs,
                        runSpacing: AppSpacing.xs,
                        alignment: WrapAlignment.center,
                        children: pokemon.types
                            .map((type) => TypeBadge(type: type))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: firstType.primaryColor,
                borderRadius: const BorderRadius.all(AppRadius.borderRadius3),
              ),
              width: 126,
              height: double.infinity,
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  SizedBox(
                    width: 94,
                    height: 94,
                    child: ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment(-0.54, -0.84),
                        end: Alignment(0.54, 0.84),
                        colors: [Colors.white, Colors.transparent],
                      ).createShader(bounds),
                      child: SvgPicture.asset(
                        firstType.iconAssetBlackAndWhite,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'pokemon-image-${pokemon.id}',
                    child: CachedNetworkImage(
                      imageUrl: pokemon.thumbnailUrl,
                      fit: BoxFit.contain,
                      placeholder: (_, _) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (_, _, _) => const Icon(
                        Icons.catching_pokemon,
                        size: 48,
                        color: AppColors.textDisabled,
                      ),
                      width: 94,
                      height: 94,
                    ),
                  ),
                  if (onFavorite != null)
                    Positioned(
                      top: AppSpacing.sm,
                      right: AppSpacing.sm,
                      child: FavoriteIcon(
                        isFavorite: isFavorite,
                        onFavorite: onFavorite,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
