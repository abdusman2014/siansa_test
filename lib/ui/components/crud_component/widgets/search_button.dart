import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        minimumSize: const Size(50, 50),
        padding: EdgeInsets.zero,
      ),
      child: const Icon(
        Icons.search,
        color: Colors.white,
      ),
    );
  }
}
