import 'package:flutter/material.dart';
import 'package:siansa_app/utilities/helpers/app_version.dart';

class AppVersionDisplay extends StatelessWidget {
  final String versionTitle;
  final String logoAssetPath; // Path for the logo asset
  final TextStyle textStyle; // Text style for the version text
  final double imageWidth; // Width of the logo image
  final EdgeInsetsGeometry padding; // Padding for the container
  final double sizedBoxHeight; // Height of the SizedBox

  const AppVersionDisplay({
    super.key,
    this.versionTitle = 'VERSION',
    this.logoAssetPath = "assets/images/logo.png", // Default logo asset path
    this.textStyle = const TextStyle(
      fontFamily: 'Montserrat',
      color: Color(0xFFB0B0B0), // Use a default color here
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.bold,
    ), // Default text style without referencing non-constant
    this.imageWidth = 35.0, // Default image width
    this.padding = const EdgeInsets.all(1.0), // Default padding
    this.sizedBoxHeight = 8.0, // Default height for the SizedBox
  });

  @override
  Widget build(BuildContext context) {
    // Set the app version here, defaulting to AppVersionHelper().get() if not provided
    final appVersion = AppVersionHelper().get();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: padding, // Use the provided padding
            child: Image.asset(
              logoAssetPath, // Use the provided logo asset path
              fit: BoxFit.contain,
              width: imageWidth, // Use the provided image width
            ),
          ),
          // SizedBox between the container and the text
          SizedBox(height: sizedBoxHeight),
          Text(
            "$versionTitle $appVersion", // Use the app version set in the build method
            style: textStyle, // Use the provided text style
          ),
        ],
      ),
    );
  }
}
