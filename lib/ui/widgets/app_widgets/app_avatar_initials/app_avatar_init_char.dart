import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppAvatarInitChar extends StatelessWidget {
  final String char; // The single character to display
  final double size; // Size of the avatar

  const AppAvatarInitChar({
    Key? key,
    required this.char,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure that only a single character is passed
    assert(char.length == 1, 'Provide only a single character.');

    // Function to generate a random color
    Color getRandomColor() {
      final random = Random(); // Random generator
      return Color.fromRGBO(
        random.nextInt(256), // Random Red value (0-255)
        random.nextInt(256), // Random Green value (0-255)
        random.nextInt(256), // Random Blue value (0-255)
        1, // Full opacity
      );
    }

    return Container(
      width: size, // Width of the avatar based on the size parameter
      height: size, // Height of the avatar, ensuring 1:1 aspect ratio
      decoration: BoxDecoration(
        color: getRandomColor(), // Background color is randomly generated
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      alignment: Alignment.center, // Center the character within the box
      child: Text(
        char.toUpperCase(), // Convert character to uppercase
        style: GoogleFonts.montserrat(
          fontSize:
              35 * (size / 50.0), // Responsive font size based on avatar size
          fontWeight: FontWeight.w700, // Bold font weight
          color: Colors.white, // Text color (always white for contrast)
        ),
      ),
    );
  }
}
