import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFC4DE27);
  static const primaryLight = Color(0xFFDBF934);
  static const primaryDark = Color(0xFF586800);
  static const primarySoft = Color(0xFFF5FBCF);

  static const secondary = Color(0xFF7B6AFE);
  static const secondaryLight = Color(0xFFA79CFE);
  static const secondaryDark = Color(0xFF261D6B);
  static const secondarySoft = Color(0xFFEDEAFF);

  static const accentLime = Color(0xFFA0BC0C);
  static const accentIndigo = Color(0xFF6150E8);
  static const accentDeepIndigo = Color(0xFF33268F);
  static const accentLavender = Color(0xFFC8C1FF);

  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;
  static const onboardingLightText = Color(0xFF161A10);
  static const onboardingLightDescription = Color(0xFF5C6248);
  static const onboardingDarkDescription = Color(0xFFD9DCF4);
  static const onboardingOrbitDotDark = Color(0xFFF6F9E8);
  static const onboardingOrbitDotLight = Color(0xFFC9CFDD);

  static const onboardingDarkGradient = [
    Color(0xFF0C0E19),
    Color(0xFF12162A),
    Color(0xFF181E34),
    Color(0xFF0D101B),
  ];

  static const onboardingLightGradient = [
    Color(0xFFFFFEF7),
    Color(0xFFF7F8E8),
    Color(0xFFF3F0FF),
    Color(0xFFFFFFFF),
  ];

  static const onboardingHeroDarkGradient = [secondaryDark, secondary];
  static const onboardingHeroLightGradient = [secondaryLight, secondary];
  static const onboardingBadgeBlueGradient = [secondaryLight, accentIndigo];
  static const onboardingBadgeAmberGradient = [primaryLight, accentLime];
  static const onboardingBadgePurpleGradient = [accentLavender, secondary];
  static const onboardingBadgeTealGradient = [primary, accentLime];
  static const onboardingBadgeRoseGradient = [accentLavender, accentIndigo];

  // Light theme
  static const n0 = Color(0xFFFFFFFF);
  static const n100 = Color(0xFFF8F9F1);
  static const n200 = Color(0xFFE7E9DA);
  static const n300 = Color(0xFFD2D6C1);
  static const n400 = Color(0xFFA2A78E);
  static const n500 = Color(0xFF747A61);
  static const n700 = Color(0xFF3B402E);
  static const n900 = Color(0xFF14170F);

  // Dark theme
  static const dn0 = Color(0xFF0C0F18);
  static const dn100 = Color(0xFF151929);
  static const dn200 = Color(0xFF22273B);
  static const dn300 = Color(0xFF353C58);
  static const dn400 = Color(0xFF606988);
  static const dn500 = Color(0xFF8A93B0);
  static const dn700 = Color(0xFFD4D8E8);
  static const dn900 = Color(0xFFFBFCFF);

  // Status ranglar
  static const success = Color(0xFF1FA971);
  static const error = Color(0xFFE34972);
  static const warning = Color(0xFFE0AF00);
  static const info = Color(0xFF3F7CFF);

  static List<Color> primaryGradientForBrightness(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return const [secondaryDark, accentDeepIndigo, primaryDark];
    }

    return const [primaryDark, primary, primaryLight];
  }

  static Color primaryGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? secondary : primary;
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
        ? const Color(0x267B6AFE)
        : const Color(0x66DBF934);
  }

  static Color onboardingOrbSecondaryForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x20586800)
        : const Color(0x447B6AFE);
  }

  static List<Color> onboardingRadialGlowForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? [
            const Color(0x337B6AFE),
            const Color(0x20586800),
            white.withOpacity(0.015),
            transparent,
          ]
        : [
            const Color(0x66DBF934),
            const Color(0x447B6AFE),
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
    return brightness == Brightness.dark ? secondary : primary;
  }

  static Color onboardingInnerRingForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x667B6AFE)
        : const Color(0x66C8C1FF);
  }

  static Color onboardingOuterRingForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? const Color(0x66A79CFE)
        : const Color(0x33A79CFE);
  }

  static Color onboardingOrbitDotForBrightness(Brightness brightness) {
    return brightness == Brightness.dark
        ? onboardingOrbitDotDark
        : onboardingOrbitDotLight;
  }

  static Color onboardingBadgeBorder() => white.withOpacity(0.45);

  static Color onboardingDotGlow() => secondary.withOpacity(0.22);
}
