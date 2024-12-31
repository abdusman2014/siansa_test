import 'package:flutter/material.dart';

class AlertConfirm extends StatelessWidget {
  final Function onConfirm;
  final String titleText;
  final String messageText;
  final String cancelText; // Cancel
  final String confirmText; // Confirm
  final Widget? titleTextWidget;
  final Widget? messageTextWidget;
  final Color confirmButtonColor;
  final Color cancelButtonColor;
  final double buttonHeight;
  final double buttonWidth;
  final double borderRadius;
  final TextStyle? titleStyle;
  final TextStyle? contentTextStyle;
  final TextStyle? buttonTextStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry dialogPadding;

  const AlertConfirm({
    Key? key,
    required this.onConfirm,
    this.titleText = "Title",
    this.messageText = "Are you sure you want to proceed?",
    this.cancelText = "No",
    this.confirmText = "Yes",
    this.titleTextWidget,
    this.messageTextWidget,
    this.confirmButtonColor = const Color.fromARGB(255, 216, 216, 216),
    this.cancelButtonColor = Colors.black87,
    this.buttonHeight = 50,
    this.buttonWidth = 300,
    this.borderRadius = 8.0,
    this.titleStyle,
    this.contentTextStyle,
    this.buttonTextStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    this.dialogPadding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      actionsAlignment: MainAxisAlignment.center,
      title: titleTextWidget ??
          Text(
            titleText,
            style: titleStyle ??
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
          ),
      content: Padding(
        padding: dialogPadding,
        child: messageTextWidget ??
            Text(
              messageText,
              style: contentTextStyle ??
                  const TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
            ),
      ),
      actions: <Widget>[
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                onConfirm(); // Trigger the confirm action
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonWidth, buttonHeight),
                backgroundColor: confirmButtonColor,
                padding: padding,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
              ),
              child: Text(
                confirmText,
                style: buttonTextStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonWidth, buttonHeight),
                backgroundColor: cancelButtonColor,
                padding: padding,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
              ),
              child: Text(
                cancelText,
                style: buttonTextStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// void appConfirmationDialog({
//   required BuildContext context,
//   required Function onConfirm,
//   String title = "Title",
//   String text = "Are you sure you want to proceed?",
//   String cancelText = "No", // Cancel
//   String confirmText = "Yes", // Confirm
//   String stringsTemplate = "",
//   Color confirmButtonColor = Colors.red,
//   Color cancelButtonColor = Colors.green,
//   double buttonHeight = 50,
//   double buttonWidth = 300,
//   double borderRadius = 8.0,
//   TextStyle? titleStyle,
//   TextStyle? contentTextStyle,
//   TextStyle? buttonTextStyle,
//   EdgeInsetsGeometry padding =
//       const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//   EdgeInsetsGeometry dialogPadding = const EdgeInsets.all(16.0),
// }) {
//   // Check for string templates and apply localization if necessary
//   if (stringsTemplate == "logout") {
//     title = AppLocalizations.of(context)!.logoutTXT;
//     text = AppLocalizations.of(context)!.areYouSureYouWantToLogOutTXT;
//     cancelText = AppLocalizations.of(context)!.cancelTXT;
//     confirmText = AppLocalizations.of(context)!.yesTXT;
//   } else if (stringsTemplate == "deleteAccount") {
//     title = AppLocalizations.of(context)!.deleteAccountTXT;
//     text =
//         AppLocalizations.of(context)!.areYouSureYouWantToDeleteYourAccountTXT;
//     cancelText = AppLocalizations.of(context)!.cancelTXT;
//     confirmText = AppLocalizations.of(context)!.deleteTXT;
//   }

// }

