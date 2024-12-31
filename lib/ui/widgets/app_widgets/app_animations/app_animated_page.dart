import 'package:flutter/material.dart';

class AppAnimatedPage extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const AppAnimatedPage({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 2), // Default duration
  }) : super(key: key);

  @override
  _AppAnimatedPageState createState() => _AppAnimatedPageState();
}

class _AppAnimatedPageState extends State<AppAnimatedPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      ),
    );
  }
}

// EXAMPLE USAGE:
// AppAnimatedPage(
//   duration: const Duration(seconds: 3), // Custom animation duration
//   child: Center(
//     child: Text(
//       'Welcome to Animated Page!',
//       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     ),
//   ),
// )