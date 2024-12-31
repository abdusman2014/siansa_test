import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siansa_app/constants/routes_constants.dart';

import 'app_company_logo.dart';
import 'app_login_or_register.dart';

class AppPleaseLogin extends StatelessWidget {
  final String? logoAssetPath; // Custom logo asset path
  final String promptText; // Text prompt for login/register
  final String loginText; // Text for login
  final String registerText; // Text for register
  final Color textColor; // Color for the text
  final double fontSize; // Font size for the text
  final VoidCallback? onLogin; // Custom login action
  final VoidCallback? onRegister; // Custom register action

  const AppPleaseLogin({
    super.key,
    this.logoAssetPath, // Allow custom logo asset path
    this.promptText = 'Please ', // Default prompt text
    this.loginText = 'Login', // Default login text
    this.registerText = 'Register', // Default register text
    this.textColor = Colors.black, // Default text color
    this.fontSize = 16.0, // Default font size
    this.onLogin, // Optional custom login action
    this.onRegister, // Optional custom register action
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Company Logo
          logoAssetPath != null
              ? Image.asset(logoAssetPath!) // Use custom logo if provided
              : const AppCompanyLogo(), // Default logo
          const SizedBox(height: 30.0),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
              children: <TextSpan>[
                TextSpan(text: promptText),
                TextSpan(
                    text: loginText,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Default logic for login
                        if (onLogin != null) {
                          onLogin!(); // Call parent function if provided
                        } else {
                          // Default navigation
                          context.go(RoutesConstants.LOGIN_ROUTE);
                        }
                      }),
                const TextSpan(text: ' or '),
                TextSpan(
                    text: registerText,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Default logic for register
                        if (onRegister != null) {
                          onRegister!(); // Call parent function if provided
                        } else {
                          // Default navigation
                          context.go(RoutesConstants.REGISTER_ROUTE);
                        }
                      }),
                const TextSpan(text: ' to perform this action.'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
