import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/button_icon_container.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormDatePickerInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final Function(DateTime?)? onChanged;
  final DateTime? initialValue;

  final bool isDisabled; // Whether the widget is enabled

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

  final DatePickerThemeData? datePickerTheme;

  const MyCustomFormDatePickerInput({
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
    this.datePickerTheme,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    // Apply date picker theme if provided
    final ThemeData datePickerThemeData = datePickerTheme != null
        ? ThemeData.light().copyWith(datePickerTheme: datePickerTheme)
        : ThemeData.light();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialValue ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(data: datePickerThemeData, child: child!);
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
            : () => _selectDate(context), // Disable interaction
      ),
    );
  }
}
