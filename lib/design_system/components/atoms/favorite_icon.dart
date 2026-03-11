import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';

enum FavoritIconSize { sm, lg }

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onFavorite;
  final bool showBg;
  final FavoritIconSize size;
  const FavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onFavorite,
    this.showBg = true,
    this.size = FavoritIconSize.sm,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavorite,
      child: Container(
        width: AppSpacing.xl,
        height: AppSpacing.xl,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: showBg ? AppColors.bgIcon : Colors.transparent,
          border: showBg
              ? Border.all(width: 2, color: AppColors.textInverse)
              : null,
        ),
        child: Center(
          child: Icon(
            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: isFavorite ? AppColors.bronze500 : AppColors.textInverse,
            weight: 5,
            size: size == FavoritIconSize.lg ? 28 : 20,
          ),
        ),
      ),
    );
  }
}
