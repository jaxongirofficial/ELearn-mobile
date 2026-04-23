import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_text_theme.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dn0,
    canvasColor: AppColors.dn0,
    cardColor: AppColors.dn100,
    dividerColor: AppColors.dn200,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.dn0,
      surface: AppColors.dn100,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dn0,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.dn500,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.n900,
        disabledBackgroundColor: AppColors.dn200,
        disabledForegroundColor: AppColors.dn500,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        side: const BorderSide(color: AppColors.secondaryLight),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dn100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.dn200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.dn200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.4),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.white,
    ),
    fontFamily: AppFonts.primary,
    textTheme: AppFonts.textTheme(AppTextTheme.dark),
    extensions: [
      AppCustomColors(
        description: AppColors.dn500,
        cardBorder: AppColors.dn300,
        divider: AppColors.dn400,
        placeholder: AppColors.dn500,
        subjectCardBackground: AppColors.dn100,
        subjectCardBorder: AppColors.primaryLight.withOpacity(0.12),
        subjectCardTitle: AppColors.dn900,
        subjectCardDescription: AppColors.dn500,
        mathematicsPalette: const SubjectPalette(
          start: Color(0xFF7D9303),
          end: AppColors.primaryLight,
          foreground: Colors.white,
          shadow: Color(0x4DDBF934),
        ),
        physicsPalette: const SubjectPalette(
          start: AppColors.secondaryDark,
          end: AppColors.secondaryLight,
          foreground: Colors.white,
          shadow: Color(0x4D7B6AFE),
        ),
        chemistryPalette: const SubjectPalette(
          start: Color(0xFF8A7208),
          end: Color(0xFFF0D44E),
          foreground: AppColors.n900,
          shadow: Color(0x4DE0AF00),
        ),
        biologyPalette: const SubjectPalette(
          start: Color(0xFF5C7408),
          end: Color(0xFFA2C411),
          foreground: Colors.white,
          shadow: Color(0x4DA2C411),
        ),
      ),
    ],
  );
}
