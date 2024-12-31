import 'package:flutter/material.dart';

class DesktopCommonDemoScreen extends StatelessWidget {
  const DesktopCommonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO Screen'),
      ),
      body: const Center(
        child: Text(
          'Desktop Common Demo Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
