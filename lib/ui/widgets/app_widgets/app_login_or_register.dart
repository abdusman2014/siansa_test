import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLoginOrRegister extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color textColor;
  final Color textHighlightColor;
  final TextStyle? textStyle; // Style for normal text
  final TextStyle? textHighlightStyle; // Style for highlighted text
  final VoidCallback? onLoginTap; // Function executed when "Login" is tapped
  final VoidCallback? onSignupTap; // Function executed when "Signup" is tapped

  const AppLoginOrRegister({
    Key? key,
    this.icon = Icons.account_box, // Default icon
    this.iconSize = 100.0, // Default icon size
    this.iconColor = Colors.grey, // Default icon color
    this.textColor = Colors.grey, // Default text color
    this.textHighlightColor = Colors.green, // Default highlight color
    this.textStyle, // Optional style for normal text
    this.textHighlightStyle, // Optional style for highlighted text
    this.onLoginTap, // Function executed when "Login" is tapped
    this.onSignupTap, // Function executed when "Signup" is tapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon, // Customizable icon
              color: iconColor, // Customizable icon color
              size: iconSize, // Customizable icon size
            ),
            const SizedBox(height: 10.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textStyle ??
                    TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: textColor, // Customizable text color
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${AppLocalizations.of(context)!.pleaseTXT} ',
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!.loginTXT,
                    style: textHighlightStyle ??
                        TextStyle(
                          color:
                              textHighlightColor, // Highlight color for login
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = onLoginTap ??
                          () {
                            // Default action if not provided
                            print('Login tapped!');
                          },
                  ),
                  TextSpan(
                    text: ' ${AppLocalizations.of(context)!.orTXT} ',
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!.registerTXT,
                    style: textHighlightStyle ??
                        TextStyle(
                          // Highlight color for signup
                          color: textHighlightColor,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = onSignupTap ??
                          () {
                            // Default action if not provided
                            print('Signup tapped!');
                          },
                  ),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .toContinueOrAccessThisContentTXT,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
