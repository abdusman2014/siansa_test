import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/button_icon_container.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormTimeRangePickerInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final Function(TimeOfDayRange?)? onChanged;
  final TimeOfDayRange? initialValue;
  final TimeOfDay? startTimeInitValue;
  final TimeOfDay? endTimeInitValue;

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

  final TimePickerThemeData? timePickerTheme;

  const MyCustomFormTimeRangePickerInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.onChanged,
    this.initialValue,
    this.startTimeInitValue,
    this.endTimeInitValue,
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

  Future<void> _selectTimeRange(BuildContext context) async {
    if (isDisabled) return; // Prevent interaction if isDisabled

    // Apply time picker theme if provided
    final ThemeData timePickerThemeData = timePickerTheme != null
        ? ThemeData.light().copyWith(timePickerTheme: timePickerTheme)
        : ThemeData.light();

    final TimeOfDay? startTime = await showTimePicker(
      context: context,
      // initialTime: initialValue?.start ?? TimeOfDay.now(),
      initialTime: startTimeInitValue ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(data: timePickerThemeData, child: child!);
      },
    );

    if (startTime != null) {
      final TimeOfDay? endTime = await showTimePicker(
        context: context,
        // initialTime: initialValue?.end ?? TimeOfDay.now(),
        initialTime: endTimeInitValue ?? TimeOfDay.now(),
        builder: (context, child) {
          return Theme(data: timePickerThemeData, child: child!);
        },
      );

      if (endTime != null) {
        final TimeOfDayRange selectedTimeRange = TimeOfDayRange(
          start: startTime,
          end: endTime,
        );
        if (onChanged != null) onChanged!(selectedTimeRange);
      }
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
            : () => _selectTimeRange(context), // Disable interaction
      ),
    );
  }
}

// A simple class to hold a range of TimeOfDay
class TimeOfDayRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeOfDayRange({required this.start, required this.end});
}
