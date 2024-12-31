// IMPROVEMENTS:
// - Align the button and the colorBox to the start, center or end.. from parent.
// - In displaying button and colorBox, be able to set their positions,
//    - colorBox on top, button on bottom
//    - button on top, colorBox on bottom
//    - colorBox on the left, button on the right
//    - button on the left, colorBox on the right
// **************************************************
// **************************************************
// let the widget know in which format it will work (MaterialColor, RGBA, HEX)
// by default it works with MaterialColor
// input / output
// Know the input color type, and the input output type... by default MaterialColor
// the initialValue should always become transformed into MaterialColor if it is HEX or RGBA
// and for the output, perhaps return a Map with 3 keys: materialColor, rgba and hex
// By default return MaterialColor value, add an optional property called shouldReturnColorFormats
// which if true, should return a map with the 3 color type (materialColor, rgba and hex).
// **************************************************
// **************************************************

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/button_icon_container.dart';

class MyCustomFormColorPickerInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final Color? initialValue;
  final String colorType;
  final Function(Color?)? onChanged;
  //
  final bool isDisabled;
  //
  final bool showButton;
  final bool showColorBox;
  final bool disableButtonText;
  //
  // Container customization
  final EdgeInsetsGeometry containerPadding;
  final BoxDecoration? containerBoxDecoration;
  final BoxDecoration? containerBoxDecorationDisabled;
  //

  // New parameters for styles
  final ButtonStyle? elevatedButtonStyle;
  final ButtonStyle? elevatedButtonStyleDisabled;

  final Widget? elevatedButtonTextWidget;
  final Widget? elevatedButtonTextWidgetDisabled;

  final Widget? elevatedButtonTextWidgetIFSelectedColor;
  final Widget? elevatedButtonTextWidgetDisabledIFSelectedColor;

  final double? selectedColorContainerWidth;
  final double? selectedColorContainerHeight;

  final BoxDecoration? selectedColorContainerBoxDecoration;
  final BoxDecoration? selectedColorContainerBoxDecorationDisabled;

  final Border? selectedColorContainerBorder;
  final Border? selectedColorContainerBorderDisabled;

  final BorderRadius? selectedColorContainerBorderRadius;

  // Icon

  final double iconSpace;
  final String iconPosition;
  final Widget? iconWidget;
  final Widget? iconWidgetDisabled;

  // Alert Dialog

  final AlertDialogStyle? alertDialogStyle;
  final TextStyle? alertDialogSelectButtonTextStyle;
  final Widget? alertDialogSelectButtonTextWidget;

  const MyCustomFormColorPickerInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.initialValue,
    this.colorType = "MaterialColor",
    this.onChanged,
    //
    this.isDisabled = false,
    //
    this.showButton = true, // Defaults to true to show the button
    this.showColorBox = true, // Defaults to true to show the color box
    this.disableButtonText = false,
    //
    // Container
    this.containerPadding = const EdgeInsets.all(0), // Default padding
    this.containerBoxDecoration,
    this.containerBoxDecorationDisabled,
    //
    // Elevated Button Style
    this.elevatedButtonStyle,
    this.elevatedButtonStyleDisabled,
    //
    // Elevated Button Text Widget
    this.elevatedButtonTextWidget,
    this.elevatedButtonTextWidgetDisabled,
    //
    this.elevatedButtonTextWidgetIFSelectedColor,
    this.elevatedButtonTextWidgetDisabledIFSelectedColor,
    //
    // Selected Color Container
    this.selectedColorContainerWidth = 32,
    this.selectedColorContainerHeight = 32,
    //
    this.selectedColorContainerBoxDecoration,
    this.selectedColorContainerBoxDecorationDisabled,
    //
    // //
    this.selectedColorContainerBorder,
    this.selectedColorContainerBorderDisabled,
    //
    this.selectedColorContainerBorderRadius,
    //
    // Icon
    this.iconSpace = 4,
    this.iconPosition = 'start', // 'start', 'end', 'top', 'bottom'
    this.iconWidget,
    this.iconWidgetDisabled,
    //
    // Alert Dialog
    this.alertDialogStyle,
    this.alertDialogSelectButtonTextStyle,
    this.alertDialogSelectButtonTextWidget,
    //
  }) : super(key: key);

  // TODO: Working on this...
  // Helper to detect and convert initialValue to MaterialColor if needed
  MaterialColor _detectColorType(Color? color) {
    if (colorType == "HEX" || colorType == "RGBA") {
      return _convertToMaterialColor(color);
    }
    return color as MaterialColor;
  }

  // TODO: Working on this...
  // Helper to convert color formats
  MaterialColor _convertToMaterialColor(Color? color) {
    // Add logic to convert from HEX or RGBA to MaterialColor
    // Placeholder example below
    return Colors.blue; // Default fallback color
  }

  // TODO: Working on this...
  Map<String, String> _convertMaterialColorToHEXAndRGBA(Color color) {
    // Add logic for converting MaterialColor to HEX and RGBA
    String hexColor = '#${color.value.toRadixString(16).padLeft(8, '0')}';
    String rgbaColor =
        'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
    return {
      "materialColor": color.toString(),
      "hex": hexColor,
      "rgba": rgbaColor,
    };
  }

  // Function to show the color picker dialog
  Future<void> _showColorPickerDialog(BuildContext context) async {
    Color? selectedColor = await showDialog<Color>(
      context: context,
      builder: (context) {
        Color tempColor = initialValue ?? Colors.blue;

        return AlertDialog(
          backgroundColor: alertDialogStyle?.backgroundColor ??
              Colors.white, // Custom or default background
          shape: RoundedRectangleBorder(
            borderRadius: alertDialogStyle?.borderRadius ??
                BorderRadius.circular(8.0), // Custom or default border radius
          ),
          title: const Text('Select a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              onColorChanged: (color) {
                tempColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.7,
            ),
          ),
          actions: [
            TextButton(
              child: alertDialogSelectButtonTextWidget ??
                  Text(
                    'SELECT',
                    style: alertDialogSelectButtonTextStyle ??
                        const TextStyle(color: Colors.blue),
                  ),
              onPressed: () {
                Navigator.of(context).pop(tempColor);
              },
            ),
          ],
        );
      },
    );
    if (selectedColor != null && onChanged != null) {
      onChanged!(selectedColor);
      // onChanged!(_convertMaterialColorToHEXAndRGBA(selectedColor) as Color?);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final convertedInitialColor = _detectColorType(initialValue);
    Color color = initialValue ?? Colors.transparent;

    return Container(
      padding: containerPadding, // Use passed or default padding
      decoration: isDisabled
          ? containerBoxDecorationDisabled ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.transparent,
              )
          : containerBoxDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.transparent,
              ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showButton)
            MyCustomFormButtonAndIconInputContainer(
              name: name,
              isDisabled: isDisabled,
              elevatedButtonStyle: elevatedButtonStyle,
              elevatedButtonStyleDisabled: elevatedButtonStyleDisabled,
              disableButtonText: disableButtonText,
              elevatedButtonTextWidget: initialValue == null
                  ? elevatedButtonTextWidget
                  : elevatedButtonTextWidgetIFSelectedColor,
              elevatedButtonTextWidgetDisabled: initialValue == null
                  ? elevatedButtonTextWidgetDisabled
                  : elevatedButtonTextWidgetDisabledIFSelectedColor,
              iconSpace: iconSpace,
              iconPosition: iconPosition,
              iconWidget: iconWidget,
              iconWidgetDisabled: iconWidgetDisabled,
              onPressed: () => _showColorPickerDialog(context),
            ),

          // Conditionally display SizedBox to separate the button and color box
          if (showButton && showColorBox) const SizedBox(width: 10),

          // Conditionally display Container (selected color box)
          if (showColorBox)
            GestureDetector(
              // Show the color picker when the box is tapped
              onTap: () => {
                if (!isDisabled) {_showColorPickerDialog(context)}
              },
              child: Container(
                width: selectedColorContainerWidth,
                height: selectedColorContainerHeight,
                decoration: isDisabled
                    ? BoxDecoration(
                        color: color,
                        borderRadius: selectedColorContainerBorderRadius ??
                            BorderRadius.circular(4.0),
                        border: selectedColorContainerBorderDisabled ??
                            Border.all(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                      )
                    : BoxDecoration(
                        color: color,
                        borderRadius: selectedColorContainerBorderRadius ??
                            BorderRadius.circular(4.0),
                        border: selectedColorContainerBorder ??
                            Border.all(
                              color: Colors.grey.shade300,
                              width: 2.0,
                            ),
                      ),
              ),
            ),
        ],
      ),
    );
  }
}

// Custom class for AlertDialog style properties
class AlertDialogStyle {
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  AlertDialogStyle({this.backgroundColor, this.borderRadius});
}
