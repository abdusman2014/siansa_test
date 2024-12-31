import 'package:flutter/material.dart';

class WebCommonDemoScreen extends StatelessWidget {
  const WebCommonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO Screen'),
      ),
      body: const Center(
        child: Text(
          'Web Common Demo Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
