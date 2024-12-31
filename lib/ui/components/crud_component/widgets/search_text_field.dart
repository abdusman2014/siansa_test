import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
          // borderSide: const BorderSide(
          //   color: Colors.green,
          //   width: 2.0,
          // ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
