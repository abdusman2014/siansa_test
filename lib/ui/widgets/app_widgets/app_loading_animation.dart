import 'package:flutter/material.dart';
import '../my_widgets/my_animation.dart';

class AppLoadingAnimation extends StatelessWidget {
  final double sizedBoxHeight; // Height for the SizedBox
  final TextStyle textStyle; // Text style for the text widget
  final double animationSize; // Size for the animation
  final String loadingText; // Text to display

  const AppLoadingAnimation({
    super.key,
    this.sizedBoxHeight = 25.0, // Default height for the SizedBox
    this.textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ), // Default text style
    this.animationSize = 2.0, // Default animation size
    this.loadingText = '', // Default loading text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: animationSize, // Use the provided animation size
              child: MyAnimation.loadingDots1(repeat: true),
            ),
            SizedBox(
                height: sizedBoxHeight), // Space between animation and text
            if (loadingText.isNotEmpty) // Conditionally render the Text widget
              Text(
                loadingText, // Use the provided loading text
                style: textStyle, // Use the provided text style
              ),
          ],
        ),
      ),
    );
  }
}
