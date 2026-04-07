import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.n0,
      surface: AppColors.n100,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.n900,
      onSurface: AppColors.n900,
      error: AppColors.error,
      onError: Colors.white,
    ),
    textTheme: AppTextTheme.light,
    extensions: [
      AppCustomColors(
        description: AppColors.n500,
        cardBorder: AppColors.n200,
        divider: AppColors.n300,
        placeholder: AppColors.n400,
        subjectCardBackground: const Color(0xFFF8FAFC),
        subjectCardBorder: Colors.black.withOpacity(0.06),
        subjectCardTitle: const Color(0xFF111827),
        subjectCardDescription: const Color(0xFF6B7280),
        subjectCardIconStart: const Color(0xFF6366F1),
        subjectCardIconEnd: const Color(0xFF8B5CF6),
        subjectCardIconForeground: Colors.white,
      ),
    ],
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.dn0,
      surface: AppColors.dn100,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: AppColors.dn900,
      onSurface: AppColors.dn900,
      error: AppColors.error,
      onError: Colors.black,
    ),
    textTheme: AppTextTheme.dark,
    extensions: [
      AppCustomColors(
        description: AppColors.dn500,
        cardBorder: AppColors.dn300,
        divider: AppColors.dn400,
        placeholder: AppColors.dn500,
        subjectCardBackground: const Color(0xFF111827),
        subjectCardBorder: Colors.white.withOpacity(0.08),
        subjectCardTitle: Colors.white,
        subjectCardDescription: const Color(0xFF94A3B8),
        subjectCardIconStart: const Color(0xFF6366F1),
        subjectCardIconEnd: const Color(0xFF8B5CF6),
        subjectCardIconForeground: Colors.white,
      ),
    ],
  );
}

