import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormRangeInput extends StatelessWidget {
  final String inputKey;
  final String name;

  final double minValue;
  final double maxValue;

  final double? minInitValue;
  final double? maxInitValue;

  final Function(RangeValues)? onChanged;

  final bool isDisabled; // Determines if the slider is enabled
  final bool shouldIncludeDecimals;

  final bool showRangesText; // Determines if the text is visible
  final String rangesTextPosition;
  // 'bottomtopStart' 'topCenter' 'topEnd'
  // 'bottomStart' 'bottomCenter' 'bottomEnd'

  final String rangesSeparator;
  final TextStyle? rangesTextStyle;
  final TextStyle? rangesTextStyleDisabled;

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

  const MyCustomFormRangeInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.minValue = 0,
    this.maxValue = 100,
    this.minInitValue,
    this.maxInitValue,
    //
    this.onChanged,
    //
    this.isDisabled = false, // Default to enabled
    this.shouldIncludeDecimals = false,
    //
    this.showRangesText = true, // Default to show the text
    this.rangesTextPosition = 'bottomCenter', // Default position of the text
    //
    this.rangesSeparator = '-',
    this.rangesTextStyle,
    this.rangesTextStyleDisabled,
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

  Widget getTextWidget(RangeValues? rangeValues) {
    if (!showRangesText)
      return Container(); // Hide the text if showRangesText is false
    // return Text(
    //   '${rangeValues?.start.toStringAsFixed(1)} $rangesSeparator ${rangeValues?.end.toStringAsFixed(1)}',
    return Text(
      shouldIncludeDecimals
          ? '${rangeValues?.start.toStringAsFixed(2)} $rangesSeparator ${rangeValues?.end.toStringAsFixed(2)}'
          : '${rangeValues?.start.toStringAsFixed(0)} $rangesSeparator ${rangeValues?.end.toStringAsFixed(0)}',
      style: isDisabled
          ? rangesTextStyleDisabled ?? TextStyle(fontSize: 16)
          : rangesTextStyle ?? TextStyle(fontSize: 16),
    );
  }

  Widget positionTextWidget(RangeValues? rangeValues) {
    // Build the text widget with proper alignment in Column based on rangesTextPosition
    switch (rangesTextPosition) {
      case 'topStart':
        return Align(
          alignment: Alignment.topLeft,
          child: getTextWidget(rangeValues),
        );
      case 'topCenter':
        return Align(
          alignment: Alignment.topCenter,
          child: getTextWidget(rangeValues),
        );
      case 'topEnd':
        return Align(
          alignment: Alignment.topRight,
          child: getTextWidget(rangeValues),
        );
      case 'bottomStart':
        return Align(
          alignment: Alignment.bottomLeft,
          child: getTextWidget(rangeValues),
        );
      case 'bottomCenter':
        return Align(
          alignment: Alignment.bottomCenter,
          child: getTextWidget(rangeValues),
        );
      case 'bottomEnd':
        return Align(
          alignment: Alignment.bottomRight,
          child: getTextWidget(rangeValues),
        );
      default:
        return Align(
          alignment: Alignment.bottomCenter,
          child: getTextWidget(rangeValues),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTopPosition = rangesTextPosition.startsWith('top');

    return MyCustomFormSimpleInputContainer(
      isDisabled: isDisabled,
      containerBoxDecoration: containerBoxDecoration,
      containerBoxDecorationDisabled: containerBoxDecorationDisabled,
      containerPadding: containerPadding!,
      useBlankContainer: true,
      childWidget: FormBuilderField<RangeValues>(
        name: name,
        initialValue: minInitValue != null && maxInitValue != null
            ? RangeValues(
                minInitValue!,
                maxInitValue!,
              )
            : RangeValues(
                minValue,
                maxValue,
              ),
        builder: (field) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // If rangesTextPosition is top, display the text widget first
              if (isTopPosition) positionTextWidget(field.value),
              SliderTheme(
                data: sliderTheme ??
                    const SliderThemeData(), // Use provided or default theme
                child: RangeSlider(
                  min: minValue,
                  max: maxValue,
                  values: field.value ?? RangeValues(minValue, maxValue),
                  onChanged: (value) {
                    if (isDisabled) return;
                    field.didChange(value);
                    if (onChanged != null) onChanged!(value);
                  },
                  inactiveColor: getInactiveTrackColor(),
                  activeColor: getActiveTrackColor(),
                  // divisions: (maxValue - minValue).toInt(),
                  divisions: shouldIncludeDecimals
                      ? null
                      : (maxValue - minValue).toInt(),
                ),
              ),
              // If rangesTextPosition is bottom, display the text widget after the slider
              if (!isTopPosition) positionTextWidget(field.value),
            ],
          );
        },
      ),
    );
  }
}
