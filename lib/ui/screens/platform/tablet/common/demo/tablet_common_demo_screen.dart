import 'package:flutter/material.dart';

class TabletCommonDemoScreen extends StatelessWidget {
  const TabletCommonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO Screen'),
      ),
      body: const Center(
        child: Text(
          'Tablet Common Demo Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
