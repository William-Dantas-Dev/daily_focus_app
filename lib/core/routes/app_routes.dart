import 'package:flutter/material.dart';
import '../../features/splash/splash_page.dart';
import '../../features/home/home_page.dart';
import '../../features/onboarding/onboarding_page.dart';

class AppRoutes {
  static const String start = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
    start: (_) => const SplashPage(),
    onboarding: (_) => const OnboardingPage(),
    home: (_) => const HomePage(),
  };
}
