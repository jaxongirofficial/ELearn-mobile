import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0F766E);
  static const secondary = Color(0xFFF59E0B);
  static const primaryBlue = Color(0xFF0F766E);
  static const primaryTeal = Color(0xFF14B8A6);
  static const primaryAmber = Color(0xFFF59E0B);
  static const primaryPink = Color(0xFFFB7185);
  static const primaryGreen = Color(0xFF22C55E);
  static const primarySky = Color(0xFF2DD4BF);
  static const primaryViolet = Color(0xFFA78BFA);
  static const primaryPurple = Color(0xFF7C3AED);
  static const primaryRose = Color(0xFFFDA4AF);
  static const primaryRed = Color(0xFFE11D48);
  static const primaryTealDark = Color(0xFF0F766E);

  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;
  static const onboardingLightText = Color(0xFF0F172A);
  static const onboardingLightDescription = Color(0xFF4B5563);
  static const onboardingDarkDescription = Color(0xFFD8F3EE);
  static const onboardingOrbitDot = Color(0xFFFFFBEB);

  static const onboardingDarkGradient = [
    Color(0xFF0B1110),
    Color(0xFF111A18),
    Color(0xFF162320),
    Color(0xFF0A100F),
  ];

  static const onboardingLightGradient = [
    Color(0xFFF8FDF8),
    Color(0xFFEEF9F3),
    Color(0xFFF2FBF7),
    Color(0xFFFFFFFF),
  ];

  static const onboardingHeroDarkGradient = [primaryBlue, primarySky];
  static const onboardingHeroLightGradient = [primaryBlue, primarySky];
  static const onboardingBadgeBlueGradient = [primarySky, primaryBlue];
  static const onboardingBadgeAmberGradient = [primaryAmber, primaryPink];
  static const onboardingBadgePurpleGradient = [primaryViolet, primaryPurple];
  static const onboardingBadgeTealGradient = [Color(0xFF2DD4BF), primaryTealDark];
  static const onboardingBadgeRoseGradient = [primaryRose, primaryRed];

  // Light theme
  static const n0 = Color(0xFFFFFFFF);
  static const n100 = Color(0xFFF5F5F5);
  static const n200 = Color(0xFFE0E0E0);
  static const n300 = Color(0xFFBDBDBD);
  static const n400 = Color(0xFF9E9E9E);
  static const n500 = Color(0xFF757575);
  static const n700 = Color(0xFF424242);
  static const n900 = Color(0xFF111111);

  // Dark theme
  static const dn0 = Color(0xFF121212);
  static const dn100 = Color(0xFF1E1E1E);
  static const dn200 = Color(0xFF2C2C2C);
  static const dn300 = Color(0xFF424242);
  static const dn400 = Color(0xFF616161);
  static const dn500 = Color(0xFF757575);
  static const dn700 = Color(0xFFBDBDBD);
  static const dn900 = Color(0xFFFFFFFF);

  // Status ranglar
  static const error = Color(0xFFE53935);
  static const success = Color(0xFF43A047);

  static List<Color> primaryGradientForBrightness(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return const [
        Color(0xFF115E59),
        Color(0xFF0F766E),
        Color(0xFF14B8A6),
      ];
    }

    return const [Color(0xFF0D9488), Color(0xFF14B8A6), Color(0xFF2DD4BF)];
  }

  static Color primaryGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0xFF34D399)
        : primaryBlue;
  }

  static List<Color> onboardingBackgroundGradientForBrightness(
    Brightness brightness,
  ) {
    return brightness == Brightness.dark
        ? onboardingDarkGradient
        : onboardingLightGradient;
  }

  static Color onboardingOrbPrimaryForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x2622C55E)
        : const Color(0x6686EBC4);
  }

  static Color onboardingOrbSecondaryForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x1E14B8A6)
        : const Color(0x5556C9A8);
  }

  static List<Color> onboardingRadialGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? [
            const Color(0x3334D399),
            const Color(0x1A14B8A6),
            white.withOpacity(0.015),
            transparent,
          ]
        : [
            const Color(0x66A8E6C8),
            const Color(0x4456C9A8),
            white.withOpacity(0.35),
            transparent,
          ];
  }

  static Color onboardingTitleColorForBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? white : onboardingLightText;
  }

  static Color onboardingDescriptionColorForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? onboardingDarkDescription
        : onboardingLightDescription;
  }

  static List<Color> onboardingHeroGradientForBrightness(
    Brightness brightness,
  ) {
    return brightness == Brightness.dark
        ? onboardingHeroDarkGradient
        : onboardingHeroLightGradient;
  }

  static Color onboardingHeroGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? primarySky : primaryTeal;
  }

  static Color onboardingInnerRingForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x6634D399)
        : const Color(0x6647D7C6);
  }

  static Color onboardingOuterRingForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x2622C55E)
        : const Color(0x3322C55E);
  }

  static Color onboardingBadgeBorder() => white.withOpacity(0.24);

  static Color onboardingDotGlow() => white.withOpacity(0.18);
}
