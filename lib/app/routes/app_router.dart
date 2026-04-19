import 'package:elearn_mobile/app/routes/route_names.dart';
import 'package:elearn_mobile/core/presentation/main_screen.dart';
import 'package:elearn_mobile/features/home/presentation/models/subject_catalog.dart';
import 'package:elearn_mobile/features/home/presentation/pages/topic_detail_page.dart';
import 'package:elearn_mobile/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboarding:
        return _buildRoute(
          settings: settings,
          child: const OnboardingPage(),
        );
      case RouteNames.main:
        return _buildRoute(
          settings: settings,
          child: const MainScreen(),
        );
      case RouteNames.topicDetail:
        final topic = settings.arguments as SubjectTopic?;
        if (topic == null) {
          return _buildRoute(
            settings: settings,
            child: const _RouteErrorPage(
              message: 'Mavzu topilmadi',
            ),
          );
        }

        return _buildRoute(
          settings: settings,
          child: TopicDetailPage(topic: topic),
        );
      default:
        return _buildRoute(
          settings: settings,
          child: const _RouteErrorPage(
            message: 'Bunday sahifa mavjud emas',
          ),
        );
    }
  }

  static PageRouteBuilder<dynamic> _buildRoute({
    required RouteSettings settings,
    required Widget child,
  }) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}

class _RouteErrorPage extends StatelessWidget {
  const _RouteErrorPage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(message)),
    );
  }
}
