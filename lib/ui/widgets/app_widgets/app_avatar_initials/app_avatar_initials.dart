import 'package:flutter/material.dart';
import 'package:siansa_app/utilities/misc/misc_utilities.dart'; // Utility to check URL validity
import 'app_avatar_init_char.dart'; // Fallback widget for initials
import 'package:siansa_app/ui/widgets/app_widgets/app_animations/app_loading_animation.dart'; // Loading animation

class AppAvatarInitials extends StatelessWidget {
  final String imageUrl; // The URL of the avatar image
  final double size; // Size of the avatar
  final String firstChar; // First character to display when there's no image

  const AppAvatarInitials({
    Key? key,
    required this.imageUrl,
    required this.firstChar,
    this.size = 50.0, // Default size is 50.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size, // Set width based on the size parameter
        height: size, // Set height to ensure a 1:1 aspect ratio
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.2), // Shadow color
          //     spreadRadius: 2, // How much the shadow spreads
          //     blurRadius: 10, // How blurry the shadow is
          //     offset: const Offset(0, 5), // Position of the shadow
          //   ),
          // ],
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            10.0,
          ), // Ensure the image has rounded corners
          // Check if the image URL is valid
          child: isWellFormedUrl(imageUrl)
              ? Image.network(
                  imageUrl, // Load the avatar from the URL
                  fit: BoxFit.cover, // Cover the entire box
                  loadingBuilder: (context, child, loadingProgress) {
                    // Show a loading animation while the image is loading
                    if (loadingProgress == null) return child;
                    return Center(child: AppLoadingAnimation());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to showing the first character if the image fails to load
                    return AppAvatarInitChar(
                      char: firstChar,
                      size: size,
                    );
                  },
                )
              : AppAvatarInitChar(
                  // Fallback when the URL is invalid
                  char: firstChar, // Display the first character
                  size: size, // Same size as the container
                ),
        ),
      ),
    );
  }
}
