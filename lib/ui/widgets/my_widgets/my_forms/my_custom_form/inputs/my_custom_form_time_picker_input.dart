import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/button_icon_container.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormTimePickerInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final Function(TimeOfDay?)? onChanged;
  final TimeOfDay? initialValue;

  final bool isDisabled; // Determines if the button is enabled

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  // Button and dialog customization
  final ButtonStyle? elevatedButtonStyle;
  final ButtonStyle? elevatedButtonStyleDisabled; // Style for isDisabled button

  // Button text customization
  final bool disableButtonText; // Controls whether to display text
  final Widget? elevatedButtonTextWidget; // Text widget for enabled state
  final Widget? elevatedButtonTextWidgetDisabled; // Widget for isDisabled state

  // Icon customization
  final double iconSpace; // Space between the icon and text
  final String iconPosition; // ('start', 'end', 'top', 'bottom')
  final Widget? iconWidget; // Icon widget
  final Widget? iconWidgetDisabled; // Icon for the isDisabled state

  final TimePickerThemeData? timePickerTheme;

  const MyCustomFormTimePickerInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.onChanged,
    this.initialValue,
    //
    this.isDisabled = false, // Default to enabled
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    this.elevatedButtonStyle,
    this.elevatedButtonStyleDisabled, // New property for isDisabled button style
    //
    this.disableButtonText = false, // Default to false
    this.elevatedButtonTextWidget, // New property for enabled button text
    this.elevatedButtonTextWidgetDisabled, // New property for isDisabled button text
    //
    this.iconSpace = 5.00,
    this.iconPosition = 'start', // 'start', 'end', 'top', or 'bottom'
    this.iconWidget, // Icon widget
    this.iconWidgetDisabled, // Icon for the isDisabled state
    //
    this.timePickerTheme,
  }) : super(key: key);

  Future<void> _selectTime(BuildContext context) async {
    if (isDisabled) return; // Do nothing if the button is isDisabled

    final ThemeData timePickerThemeData = timePickerTheme != null
        ? ThemeData.light().copyWith(timePickerTheme: timePickerTheme)
        : ThemeData.light();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialValue ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(data: timePickerThemeData, child: child!);
      },
    );

    if (picked != null) {
      if (onChanged != null) onChanged!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomFormSimpleInputContainer(
      isDisabled: isDisabled,
      containerBoxDecoration: containerBoxDecoration,
      containerBoxDecorationDisabled: containerBoxDecorationDisabled,
      containerPadding: containerPadding!,
      childWidget: MyCustomFormButtonAndIconInputContainer(
        name: name,
        isDisabled: isDisabled,
        elevatedButtonStyle: elevatedButtonStyle,
        elevatedButtonStyleDisabled: elevatedButtonStyleDisabled,
        disableButtonText: disableButtonText,
        elevatedButtonTextWidget: elevatedButtonTextWidget,
        elevatedButtonTextWidgetDisabled: elevatedButtonTextWidgetDisabled,
        iconSpace: iconSpace,
        iconPosition: iconPosition,
        iconWidget: iconWidget,
        iconWidgetDisabled: iconWidgetDisabled,
        onPressed: isDisabled
            ? null
            : () => _selectTime(context), // Disable interaction
      ),
    );
  }
}
