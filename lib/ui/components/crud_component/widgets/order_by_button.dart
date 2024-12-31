import 'package:flutter/material.dart';

class OrderByButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OrderByButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.double_arrow_sharp, color: Colors.white),
      label: const Text(
        'Order By',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size(50, 50),
      ),
    );
  }
}
