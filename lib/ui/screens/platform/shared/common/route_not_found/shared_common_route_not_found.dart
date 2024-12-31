import 'package:flutter/material.dart';

class SharedCommonRouteNotFoundScreen extends StatelessWidget {
  const SharedCommonRouteNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: const Center(
        child: Text(
          '404 - Page Not Found',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
