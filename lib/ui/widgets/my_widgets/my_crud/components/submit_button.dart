import 'package:flutter/material.dart';

class CRUDSubmitButton extends StatelessWidget {
  String buttonText;
  Function onPress;

  CRUDSubmitButton({
    Key? key,
    this.buttonText = "SUBMIT",
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress,
      style: ElevatedButton.styleFrom(
        // minimumSize: const Size.fromHeight(50), // NEW
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        minimumSize: const Size(300, 50), //////// HERE
      ),
      child: Text(buttonText),
    );
  }
}
