import 'package:flutter/material.dart';
import 'package:pokedex/design_system/tokens/app_colors.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';

import '../../tokens/app_spacing.dart';
import '../atoms/shimmer_box.dart';

class PokemonCardSkeleton extends StatelessWidget {
  const PokemonCardSkeleton({super.key});

  static const double cardHeight = 102;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.all(AppRadius.borderRadius3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ShimmerBox(
                    width: AppSpacing.xl,
                    height: 12,
                    borderRadius: BorderRadius.all(AppRadius.borderRadiusFull),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  ShimmerBox(
                    width: 100,
                    height: 30,
                    borderRadius: BorderRadius.all(AppRadius.borderRadiusFull),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: 64,
                        height: 24,
                        borderRadius: BorderRadius.all(
                          AppRadius.borderRadiusFull,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      ShimmerBox(
                        width: 64,
                        height: 24,
                        borderRadius: BorderRadius.all(
                          AppRadius.borderRadiusFull,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ShimmerBox(
            width: 102,
            borderRadius: BorderRadius.all(AppRadius.borderRadius3),
          ),
        ],
      ),
    );
  }
}
