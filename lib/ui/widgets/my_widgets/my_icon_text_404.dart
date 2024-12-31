import 'package:flutter/material.dart';

class MyIconText404 extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing; // Space between icon and text

  const MyIconText404({
    Key? key,
    this.icon = Icons.error_outline_outlined,
    this.text = "404 Not Found",
    this.color = Colors.grey, // Default color
    this.iconSize = 50.0, // Default icon size
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.textStyle, // Optional, customizable text style
    this.textAlign = TextAlign.center, // Default to center align
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 8.0, // Default spacing between icon and text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Icon(
              icon,
              color: color,
              size: iconSize,
            ),
            SizedBox(height: spacing), // Space between icon and text
            Text(
              text,
              textAlign: textAlign,
              style: textStyle ??
                  const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: 20.0,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// EXAMPLE USAGE:
// MyIconText404(
//   icon: Icons.error_outline,
//   text: "Page not found",
//   color: Colors.red,
//   iconSize: 60.0,
//   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//   textStyle: const TextStyle(
//     fontSize: 18,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   ),
//   textAlign: TextAlign.center,
//   spacing: 12.0, // Optional: Adjust space between icon and text
// )
