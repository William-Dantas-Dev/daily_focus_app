import 'package:flutter/material.dart';

class MessageCategoriesStep extends StatelessWidget {
  const MessageCategoriesStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Message Categories Step',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}