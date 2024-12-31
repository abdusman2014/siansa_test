import 'package:flutter/material.dart';

class AppSmallPopButton extends StatelessWidget {
  final double size; // Button size
  final double padding; // Customizable padding
  final Color? backgroundColor; // Customizable background color
  final Color? iconColor; // Customizable icon color
  final double iconSize; // Icon size
  final VoidCallback? onTap; // Function to execute on tap

  const AppSmallPopButton({
    Key? key,
    this.size = 48.0, // Default size for the button
    this.padding = 12, // Default padding
    this.backgroundColor = Colors.orange, // Default background color
    this.iconColor = Colors.white, // Default icon color
    this.iconSize = 24.0, // Default icon size
    this.onTap, // Custom tap action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            print('tapped!');
          },
      child: Material(
        elevation: 4.0, // Button elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size / 2), // Circular shape
        ),
        child: Container(
          width: size, // Button width
          height: size, // Button height
          padding: EdgeInsets.all(padding), // Customizable padding
          decoration: BoxDecoration(
            color: backgroundColor, // Customizable background color
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.close_outlined,
              color: iconColor, // Customizable icon color
              size: iconSize, // Customizable icon size
            ),
          ),
        ),
      ),
    );
  }
}
