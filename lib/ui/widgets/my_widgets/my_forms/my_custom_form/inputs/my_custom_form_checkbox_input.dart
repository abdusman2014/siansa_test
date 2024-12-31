import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormCheckboxGroupInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final List<Map<String, dynamic>> options;
  final List<dynamic>? initialValues;
  final Function(List<dynamic>)? onChanged;

  final bool isDisabled;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  // Styling properties

  final bool isHorizontal;
  final double checkboxSize; // Size for the checkbox
  final double checkboxTextSpacing; // Spacing between checkbox and text
  final EdgeInsetsGeometry? checkboxContentPadding;
  final OutlinedBorder? shape;
  final OutlinedBorder? checkboxShape;

  final TextStyle? labelStyle;
  final TextStyle? labelStyleDisabled;
  //
  final Color? checkColor; // active icon color
  final Color? checkColorDisabled;

  final Color? activeColor; // active bg color
  final Color? activeColorDisabled;

  final WidgetStateProperty<Color?>? fillColor; // inactive bg color
  final WidgetStateProperty<Color?>? fillColorDisabled;

  // inactive border color, if active no border color displayed
  final BorderSide? unselectedBorderSide;
  final BorderSide? unselectedBorderSideDisabled;

  const MyCustomFormCheckboxGroupInput({
    Key? key,
    required this.inputKey,
    required this.name,
    required this.options,
    this.initialValues,
    this.onChanged,
    this.isDisabled = false,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    this.isHorizontal = false,
    this.checkboxSize = 24.0, // Default size for the checkbox
    this.checkboxTextSpacing = 8.0, // Default value for spacing
    this.checkboxContentPadding,
    this.shape,
    this.checkboxShape,
    //
    this.labelStyle,
    this.labelStyleDisabled,
    //
    this.checkColor,
    this.checkColorDisabled,
    //
    this.activeColor,
    this.activeColorDisabled,
    //
    this.fillColor,
    this.fillColorDisabled,
    //
    this.unselectedBorderSide,
    this.unselectedBorderSideDisabled,
    //
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enabled = isDisabled ? false : true;

    return MyCustomFormSimpleInputContainer(
      isDisabled: isDisabled,
      containerBoxDecoration: containerBoxDecoration,
      containerBoxDecorationDisabled: containerBoxDecorationDisabled,
      containerPadding: containerPadding!,
      useBlankContainer: true,
      childWidget: FormBuilderField<List<dynamic>>(
        name: name,
        initialValue: initialValues ?? [],
        enabled: enabled,
        builder: (field) {
          return isHorizontal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: options.map((option) {
                    return Expanded(
                      child: _buildCheckboxListTile(
                          context, option, field as FormBuilderFieldState),
                    );
                  }).toList(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((option) {
                    return _buildCheckboxListTile(
                        context, option, field as FormBuilderFieldState);
                  }).toList(),
                );
        },
      ),
    );
  }

  Widget _buildCheckboxListTile(
    BuildContext context,
    Map<String, dynamic> option,
    FormBuilderFieldState<dynamic, dynamic> field,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          fillColor: isDisabled
              ? fillColorDisabled ??
                  WidgetStateProperty.all(Colors.grey.shade300)
              : fillColor ?? WidgetStateProperty.all(Colors.grey.shade300),
          shape: checkboxShape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
          side: isDisabled
              ? unselectedBorderSideDisabled ??
                  const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  )
              : unselectedBorderSide ??
                  const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
        ),
      ),
      child: Container(
        // Set width or height based on orientation
        width: isHorizontal ? null : double.infinity,
        height: isHorizontal
            ? null
            : (checkboxSize + 16.0), // Height should accommodate checkbox size
        child: Row(
          children: [
            Transform.scale(
              scale: checkboxSize /
                  24.0, // Adjust the scale based on the default checkbox size
              child: Checkbox(
                value:
                    field.value?.contains(option['value'].toString()) ?? false,
                activeColor: isDisabled
                    ? activeColorDisabled ?? Colors.grey
                    : activeColor ?? Theme.of(context).primaryColor,
                checkColor: isDisabled
                    ? checkColorDisabled ?? Colors.white
                    : checkColor ?? Colors.white,
                onChanged: (isChecked) {
                  if (isDisabled) return;
                  final newValues = List<dynamic>.from(field.value ?? []);
                  if (isChecked == true) {
                    newValues.add(option['value'].toString());
                  } else {
                    newValues.remove(option['value'].toString());
                  }
                  field.didChange(newValues);
                  if (onChanged != null) onChanged!(newValues);
                },
              ),
            ),
            SizedBox(
                width: checkboxTextSpacing), // Use the new spacing parameter
            Expanded(
              child: Text(
                option['text']!,
                style: isDisabled
                    ? labelStyleDisabled ?? const TextStyle(fontSize: 16.0)
                    : labelStyle ?? const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

// class MyCustomFormCheckboxGroupInput extends StatelessWidget {
//   final String inputKey;
//   final String name;
//   final List<Map<String, dynamic>> options;
//   final List<Map<String, dynamic>>? initialValues;
//   final Function(List<Map<String, dynamic>>)? onChanged;

//   final bool isDisabled;

//   // Container customization
//   final EdgeInsetsGeometry containerPadding; // Padding for the container
//   final BoxDecoration? containerBoxDecoration; // Custom box decoration
//   final BoxDecoration? containerBoxDecorationDisabled;

//   // Styling properties
//   final bool isHorizontal;
//   final double checkboxSize; // Size for the checkbox
//   final double checkboxTextSpacing; // Spacing between checkbox and text
//   final EdgeInsetsGeometry? checkboxContentPadding;
//   final OutlinedBorder? shape;
//   final OutlinedBorder? checkboxShape;

//   final TextStyle? labelStyle;
//   final TextStyle? labelStyleDisabled;

//   final Color? checkColor; // Active icon color
//   final Color? checkColorDisabled;

//   final Color? activeColor; // Active bg color
//   final Color? activeColorDisabled;

//   final WidgetStateProperty<Color?>? fillColor; // Inactive bg color
//   final WidgetStateProperty<Color?>? fillColorDisabled;

//   // Inactive border color, if active no border color displayed
//   final BorderSide? unselectedBorderSide;
//   final BorderSide? unselectedBorderSideDisabled;

//   const MyCustomFormCheckboxGroupInput({
//     Key? key,
//     required this.inputKey,
//     required this.name,
//     required this.options,
//     this.initialValues,
//     this.onChanged,
//     this.isDisabled = false,
//     //
//     this.containerPadding = const EdgeInsets.all(0.00),
//     this.containerBoxDecoration,
//     this.containerBoxDecorationDisabled,
//     //
//     this.isHorizontal = false,
//     this.checkboxSize = 24.0,
//     this.checkboxTextSpacing = 8.0,
//     this.checkboxContentPadding,
//     this.shape,
//     this.checkboxShape,
//     //
//     this.labelStyle,
//     this.labelStyleDisabled,
//     //
//     this.checkColor,
//     this.checkColorDisabled,
//     //
//     this.activeColor,
//     this.activeColorDisabled,
//     //
//     this.fillColor,
//     this.fillColorDisabled,
//     //
//     this.unselectedBorderSide,
//     this.unselectedBorderSideDisabled,
//     //
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool enabled = isDisabled ? false : true;

//     return MyCustomFormSimpleInputContainer(
//       isDisabled: isDisabled,
//       containerBoxDecoration: containerBoxDecoration,
//       containerBoxDecorationDisabled: containerBoxDecorationDisabled,
//       containerPadding: containerPadding!,
//       useBlankContainer: true,
//       childWidget: FormBuilderField<List<Map<String, dynamic>>>(
//         name: name,
//         initialValue: initialValues ?? [],
//         enabled: enabled,
//         builder: (field) {
//           return isHorizontal
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: options.map((option) {
//                     return Expanded(
//                       child: _buildCheckboxListTile(
//                           context, option, field as FormBuilderFieldState),
//                     );
//                   }).toList(),
//                 )
//               : Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: options.map((option) {
//                     return _buildCheckboxListTile(
//                         context, option, field as FormBuilderFieldState);
//                   }).toList(),
//                 );
//         },
//       ),
//     );
//   }

//   Widget _buildCheckboxListTile(
//     BuildContext context,
//     Map<String, dynamic> option,
//     FormBuilderFieldState<dynamic, dynamic> field,
//   ) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         checkboxTheme: CheckboxThemeData(
//           fillColor: isDisabled
//               ? fillColorDisabled ??
//                   WidgetStateProperty.all(Colors.grey.shade300)
//               : fillColor ?? WidgetStateProperty.all(Colors.grey.shade300),
//           shape: checkboxShape ??
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//           side: isDisabled
//               ? unselectedBorderSideDisabled ??
//                   const BorderSide(
//                     color: Colors.grey,
//                     width: 2.0,
//                   )
//               : unselectedBorderSide ??
//                   const BorderSide(
//                     color: Colors.grey,
//                     width: 2.0,
//                   ),
//         ),
//       ),
//       child: Container(
//         width: isHorizontal ? null : double.infinity,
//         height: isHorizontal
//             ? null
//             : (checkboxSize + 16.0), // Height should accommodate checkbox size
//         child: Row(
//           children: [
//             Transform.scale(
//               scale: checkboxSize / 24.0,
//               child: Checkbox(
//                 value: field.value?.any(
//                         (selected) => selected['value'] == option['value']) ??
//                     false,
//                 activeColor: isDisabled
//                     ? activeColorDisabled ?? Colors.grey
//                     : activeColor ?? Theme.of(context).primaryColor,
//                 checkColor: isDisabled
//                     ? checkColorDisabled ?? Colors.white
//                     : checkColor ?? Colors.white,
//                 onChanged: (isChecked) {
//                   if (isDisabled) return;
//                   final newValues =
//                       List<Map<String, dynamic>>.from(field.value ?? []);
//                   if (isChecked == true) {
//                     newValues.add(option);
//                   } else {
//                     newValues.removeWhere(
//                         (selected) => selected['value'] == option['value']);
//                   }
//                   field.didChange(newValues);
//                   if (onChanged != null) onChanged!(newValues);
//                 },
//               ),
//             ),
//             SizedBox(width: checkboxTextSpacing),
//             Expanded(
//               child: Text(
//                 option['text']!,
//                 style: isDisabled
//                     ? labelStyleDisabled ?? const TextStyle(fontSize: 16.0)
//                     : labelStyle ?? const TextStyle(fontSize: 16.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
