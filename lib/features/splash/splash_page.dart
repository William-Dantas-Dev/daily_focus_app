import 'package:flutter/material.dart';
import '../../core/i18n/l10n_extension.dart';
import '../../core/widgets/app_background.dart';
import './widgets/splash_animation_wrapper.dart';
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
      Navigator.pushNamed(context, "/initial-settings");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AppBackground(
        child: Center(
          child: SplashAnimationWrapper(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SplashLogo(iconURL: "assets/icon/icon.png"),
                SizedBox(height: 24),
                SplashTitle(
                  title: context.intl.splashTitle,
                  subtitle: context.intl.splashSubtitle,
                ),
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
