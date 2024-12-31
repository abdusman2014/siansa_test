import 'package:flutter/material.dart';

class MobileCommonDemoScreen extends StatelessWidget {
  const MobileCommonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO Screen'),
      ),
      body: const Center(
        child: Text(
          'Mobile Common Demo Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
