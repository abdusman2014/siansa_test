import 'package:flutter/material.dart';
// import 'package:unicons/unicons.dart'; // UniconsLine.smile

class MyIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize; // Size of the icon
  final bool hasBackground;
  final Color backgroundColor;
  final double padding; // Padding inside the background container
  final double radius; // Border radius for the background container
  final bool hasBorder; // Determines if the background container has a border
  final Color borderColor; // Color of the border around the container
  final double borderWidth; // Width of the border around the container
  final bool isTapEnabled;
  final VoidCallback? onTap; // Function to execute on tap

  const MyIcon({
    Key? key,
    this.icon = Icons.home, // Default icon
    this.iconColor = Colors.black, // Default icon color
    this.iconSize = 20, // Default icon size
    this.hasBackground = false, // No background by default
    this.backgroundColor = Colors.grey, // Default background color
    this.padding = 10.0, // Default padding
    this.radius = 0.0, // No border radius by default
    this.hasBorder = false,
    this.borderColor = Colors.black, // No border color by default
    this.borderWidth = 0.0, // No border by default
    this.isTapEnabled = false, // By default not tappable
    this.onTap, // Optional function to execute on tap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build the core icon widget, with or without background
    final iconWidget = hasBackground
        ? Container(
            padding: EdgeInsets.all(padding), // Padding inside the container
            decoration: BoxDecoration(
              color: backgroundColor, // Set the background color
              // Apply rounded corners
              borderRadius: BorderRadius.circular(radius),
              border: hasBorder // Conditional border
                  ? Border.all(
                      color: borderColor, // Border color
                      width: borderWidth, // Border width
                    )
                  : null, // No border if `hasBorder` is false
            ),
            child: Icon(
              icon, // The icon itself
              color: iconColor, // Icon color
              size: iconSize, // Icon size
            ),
          )
        : Icon(
            icon, // Just the icon without background
            color: iconColor, // Icon color
            size: iconSize, // Icon size
          );

    // Conditionally wrap in GestureDetector if isTapEnabled is true
    if (isTapEnabled) {
      return GestureDetector(
        onTap: onTap ?? () => print("clicked!"), // Default function
        child: iconWidget, // Wrap the icon widget with the detector
      );
    } else {
      return iconWidget; // Render without GestureDetector if not tappable
    }
  }
}

// EXAMPLE USAGE:

// // Example 1: Icon without background
// MyIcon(
//   icon: Icons.home,
//   iconColor: Colors.blue,
//   iconSize: 30.0,
//   isTapEnabled: true,
//   onTap: () {
//     print("Icon tapped!");
//   },
// );

// // Example 2: Icon with background and padding
// MyIcon(
//   icon: Icons.home,
//   iconColor: Colors.white,
//   iconSize: 30.0,
//   hasBackground: true,
//   backgroundColor: Colors.blue,
//   padding: 12.0,
//   radius: 10.0,
//   isTapEnabled: true,
//   onTap: () {
//     print("Icon tapped!");
//   },
// );

// // Example 3: Icon with background and border
// MyIcon(
//   icon: Icons.settings,
//   iconColor: Colors.black,
//   iconSize: 30.0,
//   hasBackground: true,
//   backgroundColor: Colors.transparent,
//   padding: 10.0,
//   radius: 15.0,
//   hasBorder: true,
//   borderColor: Colors.black,
//   borderWidth: 2.0,
//   isTapEnabled: true,
//   onTap: () {
//     print("Icon tapped!");
//   },
// );
