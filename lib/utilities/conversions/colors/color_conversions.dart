import 'package:flutter/material.dart';

class ColorConversionsUtilities {
  // Detect the color type: MaterialColor, HEX, or RGBA
  static String detectColorType(dynamic value) {
    if (value is Color) {
      return 'materialColor';
    } else if (value is String) {
      // Check if it's HEX format
      final hexRegex = RegExp(r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{8})$');
      if (hexRegex.hasMatch(value)) {
        return 'hex';
      }
      // Check if it's RGBA format
      final rgbaRegex =
          RegExp(r'^rgba?\(\s*\d+\s*,\s*\d+\s*,\s*\d+\s*,\s*[\d.]+\s*\)$');
      if (rgbaRegex.hasMatch(value)) {
        return 'rgba';
      }
    }
    throw FormatException("Unknown color format");
  }

  // Convert MaterialColor to HEX
  // static String materialColorToHEX(Color color) {
  //   return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  // }
  static String materialColorToHEX(Color color, {int totalChars = 6}) {
    String hex = color.value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return '#${totalChars == 6 ? hex.substring(2) : hex}';
  }

  // Convert MaterialColor to RGBA
  static String materialColorToRGBA(Color color) {
    return 'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
  }

  // Convert HEX to MaterialColor
  static Color hexToMaterialColor(String hex) {
    hex = hex.replaceFirst('#', ''); // Remove # if present
    int colorValue = int.parse(hex, radix: 16);
    return Color(colorValue).withOpacity(1.0);
  }

  // Convert RGBA to MaterialColor
  static Color rgbaToMaterialColor(String rgba) {
    final regex = RegExp(r'rgba?\((\d+),\s*(\d+),\s*(\d+),\s*([\d.]+)\)');
    final match = regex.firstMatch(rgba);
    if (match != null) {
      final red = int.parse(match.group(1)!);
      final green = int.parse(match.group(2)!);
      final blue = int.parse(match.group(3)!);
      final opacity = double.parse(match.group(4)!);
      return Color.fromRGBO(red, green, blue, opacity);
    }
    throw FormatException("Invalid RGBA format");
  }

  // Convert HEX to RGBA
  static String hexToRGBA(String hex) {
    Color color = hexToMaterialColor(hex);
    return 'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
  }

  // Convert RGBA to HEX
  static String rgbaToHEX(String rgba) {
    Color color = rgbaToMaterialColor(rgba);
    return materialColorToHEX(color);
  }
}


// // Color Conversions
// Color color = Colors.red;
// print('>>>>> materialColor');
// print(color);
// print('>>>>> materialColorToHEX');
// String rgba = ColorConversionsUtilities.materialColorToRGBA(color!);
// print(rgba);
// print('>>>>> materialColorToHEX');
// String hex = ColorConversionsUtilities.materialColorToHEX(color);
// print(hex);
// print('>>>>> rgbaToHEX');
// print(ColorConversionsUtilities.rgbaToHEX(rgba));
// print('>>>>> hexToRGBA');
// print(ColorConversionsUtilities.hexToRGBA(hex));
// print('>>>>> hexToMaterialColor');
// print(ColorConversionsUtilities.hexToMaterialColor(hex));
// print('>>>>> rgbaToMaterialColor');
// print(ColorConversionsUtilities.rgbaToMaterialColor(rgba));
// print('>>>>> detect MaterialColor');
// print(ColorConversionsUtilities.detectColorType(color));
// print('>>>>> detect RGBA');
// print(ColorConversionsUtilities.detectColorType(rgba));
// print('>>>>> detect HEX');
// print(ColorConversionsUtilities.detectColorType(hex));