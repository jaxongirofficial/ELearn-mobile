import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF4CAF50);
  static const secondary = Color(0xFF2196F3);
  static const primaryBlue = Color(0xFF2563EB);
  static const primaryTeal = Color(0xFF14B8A6);
  static const primaryAmber = Color(0xFFF59E0B);
  static const primaryPink = Color(0xFFFB7185);
  static const primaryGreen = Color(0xFF22C55E);
  static const primarySky = Color(0xFF38BDF8);
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
    Color(0xFF020812),
    Color(0xFF06101D),
    Color(0xFF0A1626),
    Color(0xFF040A14),
  ];

  static const onboardingLightGradient = [
    Color(0xFFF7FBFF),
    Color(0xFFEAF4FF),
    Color(0xFFF2FFFB),
    Color(0xFFFFFFFF),
  ];

  static const onboardingHeroDarkGradient = [primaryAmber, primaryPink];
  static const onboardingHeroLightGradient = [primaryGreen, primaryTeal];
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
      return const [Color(0xFF60A5FA), Color(0xFF2563EB)];
    }

    return const [primaryBlue, primaryTeal];
  }

  static Color primaryGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0xFF60A5FA)
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
        ? const Color(0x33438AFE)
        : const Color(0x6678A9FF);
  }

  static Color onboardingOrbSecondaryForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x2238BDF8)
        : const Color(0x5547D7C6);
  }

  static List<Color> onboardingRadialGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? [
            const Color(0x555B8CFF),
            const Color(0x2238BDF8),
            white.withOpacity(0.02),
            transparent,
          ]
        : [
            const Color(0x66A7C7FF),
            const Color(0x4447D7C6),
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
    return brightness == Brightness.dark ? primaryAmber : primaryTeal;
  }

  static Color onboardingInnerRingForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x66FDE68A)
        : const Color(0x6647D7C6);
  }

  static Color onboardingOuterRingForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x332DD4BF)
        : const Color(0x33438AFE);
  }

  static Color onboardingBadgeBorder() => white.withOpacity(0.24);

  static Color onboardingDotGlow() => white.withOpacity(0.18);
}
