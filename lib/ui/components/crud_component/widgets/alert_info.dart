import 'package:flutter/material.dart';

class AlertInfo extends StatelessWidget {
  final String infoText;
  const AlertInfo({
    Key? key,
    this.infoText = 'Alert info content here',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      content: Text(infoText),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
        ),
      ],
    );
  }
}
