import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/utils/string_helper.dart';

import '../../../core/constants/pokemon_type.dart';
import '../../theme/pokemon_type_theme.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

class TypeBadge extends StatelessWidget {
  final PokemonType type;

  const TypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final Color color = type.primaryColor;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(AppRadius.borderRadius3),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface,
            ),
            padding: EdgeInsets.all(AppSpacing.xs),
            child: Center(
              child: SvgPicture.asset(type.iconAsset, width: 14, height: 14),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            StringHelper.capitalize(type.displayName),
            style: AppTypography.fontStyle2Medium.copyWith(
              color: AppColors.textInverse,
            ),
          ),
        ],
      ),
    );
  }

 
}
