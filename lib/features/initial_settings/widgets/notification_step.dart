import 'package:flutter/material.dart';

class NotificationStep extends StatelessWidget {
  const NotificationStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notification Step',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}