import 'package:daily_focus_app/features/initial_settings/initial_settings_page.dart';
import 'package:flutter/material.dart';
import '../../features/splash/splash_page.dart';
import '../../features/home/home_page.dart';
import '../../features/onboarding/onboarding_page.dart';

class AppRoutes {
  static const String start = '/';
  static const String onboarding = '/onboarding';
  static const String initialSettings = '/initial-settings';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
    start: (_) => const SplashPage(),
    initialSettings: (_) => const InitialSettingsPage(),
    onboarding: (_) => const OnboardingPage(),
    home: (_) => const HomePage(),
  };
}
