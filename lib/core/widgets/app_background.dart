import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool useSafeArea;

  const AppBackground({
    super.key,
    required this.child,
    this.padding,
    this.useSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = padding != null
        ? Padding(
            padding: padding!,
            child: child,
          )
        : child;

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0B0820),
            Color(0xFF1A1440),
            Color(0xFF2A1F70),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: content,
    );
  }
}