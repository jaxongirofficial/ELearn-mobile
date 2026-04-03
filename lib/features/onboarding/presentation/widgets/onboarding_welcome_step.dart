import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/features/onboarding/presentation/widgets/onboarding_blur_orb.dart';
import 'package:elearn_mobile/features/onboarding/presentation/widgets/onboarding_buttons.dart';
import 'package:elearn_mobile/features/onboarding/presentation/widgets/onboarding_orbit_hero.dart';
import 'package:flutter/material.dart';

class OnboardingWelcomeStep extends StatelessWidget {
  const OnboardingWelcomeStep({
    required this.onGetStarted,
    super.key,
  });

  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;
    return Container(
      key: const ValueKey('welcome-step'),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.onboardingBackgroundGradientForBrightness(
            brightness,
          ),
          stops: const [0.0, 0.34, 0.72, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -110,
            left: -30,
            child: OnboardingBlurOrb(
              size: 260,
              color: AppColors.onboardingOrbPrimaryForBrightness(brightness),
            ),
          ),
          Positioned(
            top: -90,
            right: -10,
            child: OnboardingBlurOrb(
              size: 240,
              color: AppColors.onboardingOrbSecondaryForBrightness(brightness),
            ),
          ),
          Positioned(
            top: -170,
            left: -60,
            right: -60,
            child: IgnorePointer(
              child: Container(
                height: 390,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, -1.15),
                    radius: 1.05,
                    colors: AppColors.onboardingRadialGlowForBrightness(
                      brightness,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Center(child: OnboardingOrbitHero(isDark: isDark)),
                          const SizedBox(height: 34),
                          Center(
                            child: Text(
                              'Welcome to eLearn',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                height: 1.12,
                                fontWeight: FontWeight.w900,
                                color:
                                    AppColors.onboardingTitleColorForBrightness(
                                      brightness,
                                    ),
                                letterSpacing: -0.8,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text(
                              'Discover better lessons, stay motivated, and make every study session feel clear and simple.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                fontWeight: FontWeight.w500,
                                color:
                                    AppColors
                                        .onboardingDescriptionColorForBrightness(
                                          brightness,
                                        ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: OnboardingWelcomeActionButton(
                      onPressed: onGetStarted,
                      isDark: isDark,
                      label: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
