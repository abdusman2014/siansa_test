import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormRatingInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final Function(double?)? onChanged;
  final double? initialValue;

  final bool isDisabled;

  final int ratingPoints;

  // New parameters for customization
  final double iconSize;
  final Color iconColor;
  final Color? iconColorDisabled;
  final IconData filledIcon;
  final IconData unfilledIcon;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  const MyCustomFormRatingInput({
    Key? key,
    required this.inputKey,
    required this.name,
    this.onChanged,
    this.initialValue,
    //
    this.isDisabled = false, // Enabled by default
    //
    this.ratingPoints = 5,
    //
    this.iconSize = 24.0, // Default icon size
    this.iconColor = Colors.amber, // Default icon color
    this.iconColorDisabled, // Disabled icon color
    this.filledIcon = Icons.star, // Default filled icon
    this.unfilledIcon = Icons.star_border, // Default unfilled icon
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
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
      childWidget: FormBuilderField<double>(
        name: name,
        initialValue: initialValue,
        builder: (field) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(ratingPoints, (index) {
              return IconButton(
                icon: Icon(
                  index < (field.value ?? initialValue ?? 0)
                      ? filledIcon
                      : unfilledIcon,
                  color: isDisabled
                      ? (iconColorDisabled ??
                          Colors.grey) // Disabled icon color
                      : iconColor, // Enabled icon color
                  size: iconSize, // Icon size
                ),
                onPressed: isDisabled
                    ? null
                    : () {
                        field.didChange(index + 1.0);
                        if (onChanged != null) onChanged!(index + 1.0);
                      }, // Disable interaction when not enabled
              );
            }),
          );
        },
      ),
    );

    // return Container(
    //   decoration: enabled
    //       ? (containerBoxDecoration ??
    //           BoxDecoration(
    //             borderRadius: BorderRadius.circular(0.0),
    //             border: Border.all(color: Colors.transparent),
    //             color: Colors.transparent,
    //           )) // Default or provided box decoration
    //       : (containerBoxDecorationDisabled ??
    //           BoxDecoration(
    //             borderRadius: BorderRadius.circular(8.0),
    //             border: Border.all(color: Colors.transparent),
    //             color: Colors.transparent, // Default isDisabled background
    //           )), // Disabled box decoration
    //   padding: containerPadding, // Default or provided padding
    //   child: FormBuilderField<double>(
    //     name: name,
    //     initialValue: initialValue,
    //     builder: (field) {
    //       return Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: List.generate(ratingPoints, (index) {
    //           return IconButton(
    //             icon: Icon(
    //               index < (field.value ?? initialValue ?? 0)
    //                   ? filledIcon
    //                   : unfilledIcon,
    //               color: enabled
    //                   ? iconColor // Enabled icon color
    //                   : (iconColorDisabled ??
    //                       Colors.grey), // Disabled icon color
    //               size: iconSize, // Icon size
    //             ),
    //             onPressed: enabled
    //                 ? () {
    //                     field.didChange(index + 1.0);
    //                     if (onChanged != null) onChanged!(index + 1.0);
    //                   }
    //                 : null, // Disable interaction when not enabled
    //           );
    //         }),
    //       );
    //     },
    //   ),
    // );
  }
}
