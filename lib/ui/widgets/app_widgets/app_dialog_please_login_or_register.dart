import 'package:flutter/material.dart';
import 'app_login_or_register.dart';

class AppDialogPleaseLoginOrRegister extends StatelessWidget {
  final String title; // Title for the dialog
  final Color backgroundColor; // Background color of the dialog
  final double borderRadius; // Border radius for the dialog
  final Color buttonColor; // Color for the close button
  final Function? onClose; // Action when the close button is pressed
  final Widget? content; // Custom content widget
  final EdgeInsetsGeometry padding; // Padding for the dialog content
  final double buttonRadius; // Radius for the close button

  const AppDialogPleaseLoginOrRegister({
    super.key,
    this.title = 'Please Login', // Default title
    this.backgroundColor = Colors.lightBlueAccent, // Default background color
    this.borderRadius = 32.0, // Default border radius
    this.buttonColor = Colors.red, // Default button color
    this.onClose, // Optional close button action
    this.content, // Optional custom content
    this.padding = const EdgeInsets.all(8.0), // Default padding
    this.buttonRadius = 12.0, // Default radius for the button
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      backgroundColor: backgroundColor,
      child: IntrinsicHeight(
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: FloatingActionButton(
                        backgroundColor: buttonColor,
                        child: const Icon(Icons.close),
                        onPressed: () {
                          // Call the parent onClose function if it's provided
                          onClose?.call() ?? print("Button clicked");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              content ??
                  const AppLoginOrRegister(), // Use custom content or default
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
