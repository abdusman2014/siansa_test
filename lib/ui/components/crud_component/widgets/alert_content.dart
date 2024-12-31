import 'package:flutter/material.dart';

class AlertContent extends StatelessWidget {
  final String titleText;
  final Widget? titleTextWidget;
  final Widget? contentWidget;

  const AlertContent({
    Key? key,
    this.titleText = 'Alert Title',
    this.titleTextWidget,
    this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      title: titleTextWidget ??
          Text(
            titleText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
      content: contentWidget ??
          const Text(
            'NO contentWidget',
            style: TextStyle(color: Colors.red),
          ),
      // actions: [
      //   TextButton(
      //     child: const Text('APPLY'),
      //     onPressed: () {
      //       Navigator.of(context).pop(); // Dismiss the dialog
      //     },
      //   ),
      // ],
    );
  }
}
