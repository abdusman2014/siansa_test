import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(4),
        backgroundColor: Colors.white,
        minimumSize: const Size(25, 25),
        side: BorderSide(
          width: 2.0,
          color: Colors.green.shade700,
        ),
        shape: const CircleBorder(),
      ),
      child: Icon(
        Icons.add,
        color: Colors.green.shade700,
      ),
    );
  }
}
