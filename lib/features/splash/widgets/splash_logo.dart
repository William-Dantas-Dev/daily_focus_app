import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final String iconURL;
  const SplashLogo({super.key, required this.iconURL});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconURL,
      width: 140,
    );
  }
}