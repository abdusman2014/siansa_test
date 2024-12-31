import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormSliderInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final double minValue;
  final double maxValue;
  final double? initialValue;
  final Function(double?)? onChanged;

  final bool isDisabled; // Determines if the slider is enabled
  final bool shouldIncludeDecimals;

  final bool showValueText; // Determines if the text is visible
  final String valueTextPosition;
  // 'bottomtopStart' 'topCenter' 'topEnd'
  // 'bottomStart' 'bottomCenter' 'bottomEnd'

  final TextStyle? valueTextStyle;
  final TextStyle? valueTextStyleDisabled;

  // New parameters for customization
  final Color? inactiveTrackColor;
  final Color? inactiveTrackColorDisabled;
  final Color? activeTrackColor;
  final Color? activeTrackColorDisabled;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  final SliderThemeData? sliderTheme;

  const MyCustomFormSliderInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.minValue = 0,
    this.maxValue = 100,
    this.initialValue,
    this.onChanged,
    //
    this.isDisabled = false, // Default to enabled
    this.shouldIncludeDecimals = false,
    //
    this.showValueText = true, // Default to show the text
    this.valueTextPosition = 'bottomCenter', // Default position of the text
    //
    this.valueTextStyle,
    this.valueTextStyleDisabled,
    //
    this.inactiveTrackColor,
    this.inactiveTrackColorDisabled,
    this.activeTrackColor,
    this.activeTrackColorDisabled,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    this.sliderTheme,
  }) : super(key: key);

  getInactiveTrackColor() {
    if (isDisabled && inactiveTrackColorDisabled != null) {
      return inactiveTrackColorDisabled;
    } else if (isDisabled && inactiveTrackColorDisabled == null) {
      return Colors.grey.shade600;
    }
    if (!isDisabled && inactiveTrackColor != null) {
      return inactiveTrackColor;
    } else {
      return Colors.grey;
    }
  }

  getActiveTrackColor() {
    if (isDisabled && activeTrackColorDisabled != null) {
      return activeTrackColorDisabled;
    } else if (isDisabled && activeTrackColorDisabled == null) {
      return Colors.grey.shade300;
    }
    if (!isDisabled && activeTrackColor != null) {
      return activeTrackColor;
    } else {
      return Colors.blue;
    }
  }

  Widget getTextWidget(dynamic? value) {
    if (!showValueText)
      return Container(); // Hide the text if showValueText is false
    return Text(
      '$value',
      style: isDisabled
          ? valueTextStyleDisabled ?? TextStyle(fontSize: 16)
          : valueTextStyle ?? TextStyle(fontSize: 16),
    );
  }

  Widget positionTextWidget(dynamic? value) {
    // Build the text widget with proper alignment in Column based on rangesTextPosition
    switch (valueTextPosition) {
      case 'topStart':
        return Align(
          alignment: Alignment.topLeft,
          child: getTextWidget(value),
        );
      case 'topCenter':
        return Align(
          alignment: Alignment.topCenter,
          child: getTextWidget(value),
        );
      case 'topEnd':
        return Align(
          alignment: Alignment.topRight,
          child: getTextWidget(value),
        );
      case 'bottomStart':
        return Align(
          alignment: Alignment.bottomLeft,
          child: getTextWidget(value),
        );
      case 'bottomCenter':
        return Align(
          alignment: Alignment.bottomCenter,
          child: getTextWidget(value),
        );
      case 'bottomEnd':
        return Align(
          alignment: Alignment.bottomRight,
          child: getTextWidget(value),
        );
      default:
        return Align(
          alignment: Alignment.bottomCenter,
          child: getTextWidget(value),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTopPosition = valueTextPosition.startsWith('top');

    return MyCustomFormSimpleInputContainer(
      isDisabled: isDisabled,
      containerBoxDecoration: containerBoxDecoration,
      containerBoxDecorationDisabled: containerBoxDecorationDisabled,
      containerPadding: containerPadding!,
      useBlankContainer: true,
      childWidget: FormBuilderField<double>(
        name: name,
        initialValue: initialValue ?? minValue,
        builder: (field) {
          return Column(
            children: [
              if (isTopPosition) positionTextWidget(field.value),
              SliderTheme(
                data: sliderTheme ??
                    SliderThemeData(), // Use provided or default theme
                child: Slider(
                  min: minValue,
                  max: maxValue,
                  value: field.value ?? initialValue ?? minValue,
                  activeColor: getActiveTrackColor(),
                  inactiveColor: getInactiveTrackColor(),
                  onChanged: (value) {
                    if (isDisabled) return;

                    // Format value with two decimal places if shouldIncludeDecimals is true
                    double formattedValue = shouldIncludeDecimals
                        ? double.parse(value.toStringAsFixed(2))
                        : value.roundToDouble();
                    value = formattedValue;

                    field.didChange(value);
                    if (onChanged != null) onChanged!(value);
                  },
                ),
              ),
              if (!isTopPosition) positionTextWidget(field.value),
            ],
          );
        },
      ),
    );
  }
}
