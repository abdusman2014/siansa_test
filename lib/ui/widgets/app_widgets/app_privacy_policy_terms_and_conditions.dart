import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/resources/styles/index.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_open_web_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class AppPrivacyPolicyTermsAndConditions extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextStyle? dialogTitleStyle;
  final TextStyle? linkTextStyle;
  final Color dialogBackgroundColor;
  final EdgeInsetsGeometry dialogPadding;
  final BorderRadiusGeometry
      buttonBorderRadius; // New parameter for button border radius
  final BorderRadiusGeometry
      dialogBorderRadius; // New parameter for dialog border radius

  const AppPrivacyPolicyTermsAndConditions({
    Key? key,
    this.buttonText = 'Privacy and Terms',
    this.buttonColor = ThemeColors.grey2ThemeColor,
    this.textColor = const Color.fromRGBO(189, 189, 189, 1),
    this.fontSize = 20,
    this.fontWeight = FontWeight.w900,
    this.dialogTitleStyle,
    this.linkTextStyle,
    this.dialogBackgroundColor = Colors.white,
    this.dialogPadding = const EdgeInsets.all(20),
    this.buttonBorderRadius = const BorderRadius.all(
        Radius.circular(8)), // Default border radius for button
    this.dialogBorderRadius = const BorderRadius.all(
        Radius.circular(12)), // Default border radius for dialog
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showPrivacyDialog(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: buttonBorderRadius), // Set button border radius
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: dialogBackgroundColor,
          title: Text(
            AppLocalizations.of(context)!.privacyAndTermsTXT,
            style: dialogTitleStyle ??
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLinkButton(
                  context,
                  url: 'https://example.com/app-privacy-policy',
                  text: AppLocalizations.of(context)!.privacyPolicyTXT,
                ),
                const SizedBox(height: 5),
                _buildLinkButton(
                  context,
                  url: 'https://example.com/app-terms-of-service',
                  text: AppLocalizations.of(context)!.termsOfServiceTXT,
                ),
                const SizedBox(height: 5),
                _buildLinkButton(
                  context,
                  url: 'https://www.example.com/app-eula/',
                  text: 'EULA',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: dialogBorderRadius), // Set dialog border radius
        );
      },
    );
  }

  Widget _buildLinkButton(BuildContext context,
      {required String url, required String text}) {
    return TextButton(
      onPressed: () {
        if (kIsWeb) {
          // Open in web browser
          launchUrl(url);
        } else {
          // Open in AppOpenWebView
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AppOpenWebView(url: url),
          ));
        }
      },
      child: Text(
        text,
        style: linkTextStyle ??
            TextStyle(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  void launchUrl(String url) async {
    launchUrl(url);
    // final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri)) {
    //   launchUrl(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}

// EXAMPLE USAGE:
// AppPrivacyPolicyTermsAndConditions(
//   buttonText: 'View Privacy & Terms',
//   buttonColor: Colors.red,
//   textColor: Colors.black,
//   fontSize: 18,
//   fontWeight: FontWeight.bold,
//   dialogTitleStyle: TextStyle(
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//       color: Colors.blue),
//   linkTextStyle: TextStyle(color: Colors.blue, fontSize: 16),
//   dialogBackgroundColor: Colors.white,
//   dialogPadding: EdgeInsets.all(24),
// )
