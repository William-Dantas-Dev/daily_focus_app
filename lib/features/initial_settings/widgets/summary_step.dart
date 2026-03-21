import 'package:flutter/material.dart';

class SummaryStep extends StatelessWidget {
  const SummaryStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Summary Step',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}