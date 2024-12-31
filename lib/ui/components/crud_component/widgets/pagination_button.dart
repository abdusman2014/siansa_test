import 'package:flutter/material.dart';

class PaginationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isDisabled;

  const PaginationButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isDisabled = false, // Default value is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? Colors.grey : Colors.black,
        minimumSize: const Size(120, 50),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
