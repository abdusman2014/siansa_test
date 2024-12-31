import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:unicons/unicons.dart';

class AppDialogUpdateRequired extends StatelessWidget {
  const AppDialogUpdateRequired({
    Key? key,
    required this.url,
    this.title = 'Update Required',
    this.description = 'Click the button to update the app',
    this.backgroundColor = const Color.fromARGB(15, 0, 0, 0),
    this.buttonColor = Colors.blue,
    this.iconSize = 50.0,
    this.iconColor = Colors.grey,
    this.dialogBorderRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.buttonPadding =
        const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    this.buttonTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat',
    ),
    this.actionTextStyle = const TextStyle(color: Colors.white),
  }) : super(key: key);

  final String url;
  final String title;
  final String? description;
  final Color backgroundColor;
  final Color buttonColor;
  final double iconSize;
  final Color iconColor;
  final BorderRadiusGeometry dialogBorderRadius;
  final EdgeInsetsGeometry buttonPadding;
  final TextStyle buttonTextStyle;
  final TextStyle actionTextStyle;

  @override
  Widget build(BuildContext context) {
    String updateRequiredDescriptionText =
        description ?? AppLocalizations.of(context)!.updateRequiredTXT;

    return WillPopScope(
      onWillPop: () async =>
          false, // Prevent dialog from being closed using back button
      child: AlertDialog(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: dialogBorderRadius,
        ),
        actionsAlignment: MainAxisAlignment.center,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                UniconsLine.sync,
                size: iconSize,
                color: iconColor,
              ),
              const SizedBox(height: 20),
              Text(
                updateRequiredDescriptionText,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Launch the app store or exit the app
              if (url.isNotEmpty) {
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding: buttonPadding,
              textStyle: buttonTextStyle,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.updateTXT,
              style: actionTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
