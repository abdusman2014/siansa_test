import 'package:flutter/material.dart';

class SharedCommonTestScreen extends StatelessWidget {
  const SharedCommonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST Screen'),
      ),
      body: const Center(
        child: Text(
          'Shared Common Test Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
