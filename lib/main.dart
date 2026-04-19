import 'package:elearn_mobile/app/routes/app_router.dart';
import 'package:elearn_mobile/app/routes/route_names.dart';
import 'package:elearn_mobile/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: RouteNames.onboarding,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
