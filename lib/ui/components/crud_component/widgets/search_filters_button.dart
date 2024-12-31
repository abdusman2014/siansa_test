import 'package:flutter/material.dart';

class SearchFiltersButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchFiltersButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.filter_list, color: Colors.white),
      label: const Text(
        'Filter',
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
