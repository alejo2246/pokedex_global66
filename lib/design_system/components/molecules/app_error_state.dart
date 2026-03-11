import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../atoms/app_button.dart';

class AppErrorState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;
  final String retryLabel;
  final VoidCallback? onRetry;

  const AppErrorState({
    super.key,
    required this.title,
    this.subtitle,
    this.image = 'magikarp_jump.png',
    this.retryLabel = 'Reintentar',
    this.onRetry,
  });

  static const String imagePath = 'assets/images/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset('$imagePath$image'),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: AppTypography.fontStyle6Semibold.copyWith(
                color: AppColors.escalaDeCinza800,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                subtitle!,
                style: AppTypography.fontStyle3Regular.copyWith(
                  color: AppColors.escalaDeCinza700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.md),
              AppButton(text: retryLabel, onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
