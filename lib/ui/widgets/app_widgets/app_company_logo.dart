import 'package:flutter/material.dart';
import 'package:siansa_app/resources/assets_manager.dart';

class AppCompanyLogo extends StatelessWidget {
  final String assetPath; // Path for the image asset
  final double width; // Width of the logo
  final double? height; // Height of the logo (optional)
  final Alignment alignment; // Alignment of the logo within the parent
  final BoxFit fit; // How to fit the image in the given space
  final Color? backgroundColor; // Background color of the container
  final double padding; // Padding for the container
  final double margin; // Margin for the container
  final Color? borderColor; // Border color for the container
  final double borderWidth; // Border width for the container

  const AppCompanyLogo({
    super.key,
    this.assetPath = ImageAssets.companyLogo, // Default asset path
    this.width = 150.0, // Default width
    this.height, // Height is optional
    this.alignment = Alignment.center, // Default alignment
    this.fit = BoxFit.contain, // Default fit option
    this.backgroundColor, // Background color
    this.padding = 0.00, // Default padding
    this.margin = 0.00, // Default margin
    this.borderColor, // Border color
    this.borderWidth = 0.0, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment, // Use the provided alignment
      padding: EdgeInsets.all(padding), // Use the provided padding
      margin: EdgeInsets.all(margin), // Use the provided margin
      decoration: BoxDecoration(
        color: backgroundColor, // Background color
        border: borderColor != null && borderWidth > 0
            ? Border.all(
                color: borderColor!, width: borderWidth) // Conditional border
            : null,
      ),
      child: Image.asset(
        assetPath, // Use the provided asset path
        width: width, // Use the provided width
        height: height, // Use the provided height (or null if not provided)
        fit: fit, // Use the provided fit option
      ),
    );
  }
}
