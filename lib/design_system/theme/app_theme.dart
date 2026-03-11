import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_typography.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.surface,
    textTheme: const TextTheme(
      displayLarge: AppTypography.fontStyle8Medium,
      displayMedium: AppTypography.fontStyle7Medium,
      displaySmall: AppTypography.fontStyle6Semibold,
      headlineLarge: AppTypography.fontStyle5Semibold,
      headlineMedium: AppTypography.fontStyle5Medium,
      headlineSmall: AppTypography.fontStyle4Semibold,
      titleLarge: AppTypography.fontStyle4Medium,
      titleMedium: AppTypography.fontStyle3Bold,
      titleSmall: AppTypography.fontStyle3Medium,
      bodyLarge: AppTypography.fontStyle3Regular,
      bodyMedium: AppTypography.fontStyle2SemiBold,
      bodySmall: AppTypography.fontStyle2Medium,
      labelLarge: AppTypography.fontStyle1Bold,
      labelMedium: AppTypography.fontStyle1Medium,
      labelSmall: AppTypography.fontStyle1Medium,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.fontStyle4Medium,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textInverse,
        textStyle: AppTypography.fontStyle3Bold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textLink,
        textStyle: AppTypography.fontStyle3Medium,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTypography.fontStyle3Medium,
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTypography.fontStyle3Regular.copyWith(
        color: AppColors.textDisabled,
      ),
      labelStyle: AppTypography.fontStyle3Regular.copyWith(
        color: AppColors.textSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.textDisabled),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.textDisabled),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.textDisabled,
      thickness: 1,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primaryLight,
      labelStyle: AppTypography.fontStyle2Medium.copyWith(
        color: AppColors.textPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
