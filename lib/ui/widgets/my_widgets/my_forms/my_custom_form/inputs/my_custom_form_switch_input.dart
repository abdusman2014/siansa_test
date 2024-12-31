import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormSwitchInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final Function(bool?)? onChanged;
  final bool? initialValue;

  final bool isDisabled; // Determines if the slider is enabled

  final bool dense;
  final bool? isThreeLine;
  final bool? selected;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  final Widget? textWidget;
  final Widget? textWidgetDisabled;

  // Parameters for customization
  final Color? activeTrackColor;
  final Color? activeTrackColorDisabled;

  final Color? activeThumbColor;
  final Color? activeThumbColorDisabled;

  final Color? inactiveTrackColor;
  final Color? inactiveTrackColorDisabled;

  final Color? inactiveThumbColor;
  final Color? inactiveThumbColorDisabled;

  final WidgetStateProperty<Color?>? trackColor;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackOutlineColor;
  final WidgetStateProperty<Color?>? overlayColor;

  const MyCustomFormSwitchInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.onChanged,
    this.initialValue,
    //
    this.isDisabled = false, // Default to enabled
    //
    this.dense = false,
    this.isThreeLine = false,
    this.selected = false,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    this.textWidget,
    this.textWidgetDisabled,
    //
    this.activeTrackColor,
    this.activeTrackColorDisabled,
    //
    this.activeThumbColor,
    this.activeThumbColorDisabled,
    //
    this.inactiveTrackColor,
    this.inactiveTrackColorDisabled,
    //
    this.inactiveThumbColor,
    this.inactiveThumbColorDisabled,
    //
    this.trackColor,
    this.thumbColor,
    this.trackOutlineColor,
    this.overlayColor,
    //
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomFormSimpleInputContainer(
      isDisabled: isDisabled,
      containerBoxDecoration: containerBoxDecoration,
      containerBoxDecorationDisabled: containerBoxDecorationDisabled,
      containerPadding: containerPadding!,
      useBlankContainer: true,
      childWidget: FormBuilderField<bool>(
        name: name,
        initialValue: initialValue ?? false,
        builder: (field) {
          return SwitchListTile(
            contentPadding: EdgeInsets.all(0),
            title: isDisabled
                ? textWidgetDisabled ??
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                : textWidget ??
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            value: field.value ?? initialValue ?? false,
            onChanged: (value) {
              if (isDisabled) return;

              field.didChange(value);
              if (onChanged != null) onChanged!(value);
            },
            //
            dense: dense,
            selected: selected ?? false,
            isThreeLine: isThreeLine ?? false,
            //
            // Default active track color
            activeTrackColor: isDisabled
                ? activeTrackColorDisabled ?? Colors.blue.shade100
                : activeTrackColor ?? Colors.blue.shade500,
            //
            // Default active thumb color
            activeColor: isDisabled
                ? activeThumbColorDisabled ?? Colors.blue.shade300
                : activeThumbColor ?? Colors.blue.shade700,
            //
            // Default inactive track color
            inactiveTrackColor: isDisabled
                ? inactiveTrackColorDisabled ?? Colors.grey.shade100
                : inactiveTrackColor ?? Colors.grey.shade500,
            //
            // Default inactive thumb color
            inactiveThumbColor: isDisabled
                ? inactiveThumbColorDisabled ?? Colors.grey.shade300
                : inactiveThumbColor ?? Colors.grey.shade600,
            //
            // trackColor: trackColor ??
            //     WidgetStateProperty.resolveWith<Color?>(
            //       (Set<WidgetState> states) {
            //         if (states.contains(WidgetState.selected)) {
            //           // Track color when selected
            //           return Colors.orange.shade100;
            //         }
            //         // Track color when not selected
            //         return Colors.red.shade100;
            //       },
            //     ),
            // thumbColor: thumbColor ??
            //     WidgetStateProperty.resolveWith<Color?>(
            //       (Set<WidgetState> states) {
            //         if (states.contains(WidgetState.selected)) {
            //           // Thumb color when selected
            //           return Colors.orange;
            //         }
            //         // Thumb color when not selected
            //         return Colors.red;
            //       },
            //     ),
            trackOutlineColor: trackOutlineColor ??
                WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      // Track outline color when selected
                      // return Colors.purple.shade100;
                      return Colors.transparent;
                    }
                    // Track outline color when selected
                    // return Colors.purple.shade300;
                    return Colors.transparent;
                  },
                ),
            // overlayColor: overlayColor ??
            //     WidgetStateProperty.resolveWith<Color?>(
            //       (Set<WidgetState> states) {
            //         if (states.contains(WidgetState.pressed)) {
            //           // Overlay color when pressed
            //           return Colors.green.shade100;
            //         }
            //         return Colors.green.shade300;
            //       },
            //     ),
          );
        },
      ),
    );
  }
}
