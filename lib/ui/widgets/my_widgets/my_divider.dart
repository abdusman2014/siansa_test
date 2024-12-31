import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  // thickness of the line (height)
  final double thickness;
  // empty space to the leading edge of divider (left side).
  final double indent;
  // empty space to the trailing edge of the divider (right side).
  final double endIndent;
  // The color to use when painting the line.
  final Color color;
  // The divider's height extent (some sort of height and bottom margins).
  final double height;

  const MyDivider({
    Key? key,
    this.thickness = 2.0,
    this.indent = 10.0,
    this.endIndent = 10.0,
    this.color = const Color.fromARGB(15, 0, 0, 0),
    this.height = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
      height: height,
    );
  }
}
