import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'dart:math' as math;

import 'package:elearn_mobile/features/onboarding/presentation/widgets/onboarding_orbit_badge.dart';
import 'package:flutter/material.dart';

class OnboardingOrbitHero extends StatefulWidget {
  const OnboardingOrbitHero({required this.isDark, super.key});

  final bool isDark;

  @override
  State<OnboardingOrbitHero> createState() => _OnboardingOrbitHeroState();
}

class _OnboardingOrbitHeroState extends State<OnboardingOrbitHero>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = widget.isDark ? Brightness.dark : Brightness.light;

    return SizedBox(
      height: 325,
      width: 325,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppColors.onboardingHeroGradientForBrightness(
                      brightness,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.onboardingHeroGlowForBrightness(
                        brightness,
                      ).withOpacity(0.30),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.rocket_launch_rounded,
                  color: AppColors.white,
                  size: 48,
                ),
              ),
              Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.onboardingInnerRingForBrightness(
                      brightness,
                    ),
                    width: 1.2,
                  ),
                ),
              ),
              Container(
                height: 268,
                width: 268,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.onboardingOuterRingForBrightness(
                      brightness,
                    ),
                    width: 1.1,
                  ),
                ),
              ),
              ..._orbitDots(),
              ...const [
                (
                  radius: 134.0,
                  angle: -math.pi / 2,
                  icon: Icons.psychology_alt_rounded,
                  colors: AppColors.onboardingBadgeBlueGradient,
                ),
                (
                  radius: 83.0,
                  angle: -0.45,
                  icon: Icons.menu_book_rounded,
                  colors: AppColors.onboardingBadgeAmberGradient,
                ),
                (
                  radius: 134.0,
                  angle: 0.95,
                  icon: Icons.bolt_rounded,
                  colors: AppColors.onboardingBadgePurpleGradient,
                ),
                (
                  radius: 83.0,
                  angle: 2.2,
                  icon: Icons.auto_stories_rounded,
                  colors: AppColors.onboardingBadgeTealGradient,
                ),
                (
                  radius: 134.0,
                  angle: 3.45,
                  icon: Icons.calculate_rounded,
                  colors: AppColors.onboardingBadgeRoseGradient,
                ),
              ].map(
                (item) => Transform.translate(
                  offset: Offset(
                    item.radius * math.cos(item.angle),
                    item.radius * math.sin(item.angle),
                  ),
                  child: OnboardingOrbitBadge(
                    icon: item.icon,
                    colors: item.colors,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _orbitDots() {
    const orbitConfigs = [
      (radius: 78.0, size: 14.0, speed: 1.0, phase: 4.5),
      (radius: 78.0, size: 10.0, speed: 1.0, phase: 6.1),
      (radius: 132.0, size: 18.0, speed: -0.8, phase: 0.7),
      (radius: 132.0, size: 12.0, speed: -0.8, phase: 3.0),
    ];
    const orbitPeriod = 18.0;
    final elapsedSeconds =
        (_controller.lastElapsedDuration?.inMilliseconds ?? 0) / 1000;

    return orbitConfigs.map((item) {
      final turns = elapsedSeconds / orbitPeriod;
      final angle = ((turns * item.speed) * 2 * math.pi) + item.phase;
      return Transform.translate(
        offset: Offset(
          item.radius * math.cos(angle),
          item.radius * math.sin(angle),
        ),
        child: Container(
          height: item.size,
          width: item.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.onboardingOrbitDot,
            boxShadow: [
              BoxShadow(color: AppColors.onboardingDotGlow(), blurRadius: 12),
            ],
          ),
        ),
      );
    }).toList();
  }
}
