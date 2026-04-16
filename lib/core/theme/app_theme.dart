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
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.n0,
      foregroundColor: AppColors.n900,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
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
        mathematicsPalette: const SubjectPalette(
          start: Color(0xFF2563EB),
          end: Color(0xFF60A5FA),
          foreground: Colors.white,
          shadow: Color(0x332563EB),
        ),
        physicsPalette: const SubjectPalette(
          start: Color(0xFF7C3AED),
          end: Color(0xFFA78BFA),
          foreground: Colors.white,
          shadow: Color(0x337C3AED),
        ),
        chemistryPalette: const SubjectPalette(
          start: Color(0xFFF97316),
          end: Color(0xFFFBBF24),
          foreground: Colors.white,
          shadow: Color(0x33F97316),
        ),
        biologyPalette: const SubjectPalette(
          start: Color(0xFF16A34A),
          end: Color(0xFF4ADE80),
          foreground: Colors.white,
          shadow: Color(0x3316A34A),
        ),
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
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dn0,
      foregroundColor: AppColors.dn900,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
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
        mathematicsPalette: const SubjectPalette(
          start: Color(0xFF1D4ED8),
          end: Color(0xFF38BDF8),
          foreground: Colors.white,
          shadow: Color(0x4D38BDF8),
        ),
        physicsPalette: const SubjectPalette(
          start: Color(0xFF6D28D9),
          end: Color(0xFFC084FC),
          foreground: Colors.white,
          shadow: Color(0x4D8B5CF6),
        ),
        chemistryPalette: const SubjectPalette(
          start: Color(0xFFEA580C),
          end: Color(0xFFF59E0B),
          foreground: Colors.white,
          shadow: Color(0x4DF97316),
        ),
        biologyPalette: const SubjectPalette(
          start: Color(0xFF15803D),
          end: Color(0xFF22C55E),
          foreground: Colors.white,
          shadow: Color(0x4D22C55E),
        ),
      ),
    ],
  );
}

