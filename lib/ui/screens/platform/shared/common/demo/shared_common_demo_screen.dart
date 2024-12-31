import 'package:flutter/material.dart';

class SharedCommonDemoScreen extends StatelessWidget {
  const SharedCommonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO Screen'),
      ),
      body: const Center(
        child: Text(
          'Shared Common Demo Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
