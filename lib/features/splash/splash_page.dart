import 'package:flutter/material.dart';
import './widgets/splash_animation_wrapper.dart';
import './widgets/splash_background.dart';
import './widgets/splash_loader.dart';
import './widgets/splash_logo.dart';
import './widgets/splash_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      // TODO NAVIGATE -> HOME PAGE
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBackground(
        child: Center(
          child: SplashAnimationWrapper(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SplashLogo(iconURL: "assets/icon/icon.png"),
                SizedBox(height: 24),
                SplashTitle(title: "Daily Focus", subtitle: "Clareza. Consistência. Resultado.",),
                SizedBox(height: 40),
                SplashLoader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}