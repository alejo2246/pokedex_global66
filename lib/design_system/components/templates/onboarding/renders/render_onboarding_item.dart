import 'package:flutter/material.dart';
import 'package:pokedex/design_system/components/atoms/app_dots_indicator.dart';
import 'package:pokedex/design_system/components/templates/onboarding/models/onboarding_item_model.dart';
import 'package:pokedex/design_system/tokens/app_spacing.dart';
import 'package:pokedex/design_system/tokens/app_typography.dart';
import 'package:pokedex/design_system/tokens/app_colors.dart';

class RenderOnboardingItem extends StatelessWidget {
  final OnboardingItemModel item;
  final AppDotsIndicator dots;
  const RenderOnboardingItem({
    required this.item,
    required this.dots,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        mainAxisAlignment: .end,
        children: [
          Image.asset('assets/images/${item.image}'),
          const SizedBox(height: AppSpacing.md),
          Text(
            item.title,
            style: AppTypography.fontStyle7Medium,
            textAlign: .center,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            item.description,
            style: AppTypography.fontStyle3Regular.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: .center,
          ),
          const SizedBox(height: AppSpacing.lg),
          dots,
        ],
      ),
    );
  }
}
