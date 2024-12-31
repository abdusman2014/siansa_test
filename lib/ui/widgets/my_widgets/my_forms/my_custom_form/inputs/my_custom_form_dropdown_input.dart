import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormDropdownInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final List<Map<String, dynamic>> options; // Ensure value is explicitly String
  final String? Function(String?)? validator;
  final Function(dynamic)? onChanged;
  final dynamic initialValue;

  final bool isDisabled;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  // New properties for customization
  final InputDecoration? inputDecoration;
  final InputDecoration? inputDecorationDisabled;

  final AlignmentGeometry dropdownItemsAlignment;
  final TextStyle? dropdownTextStyle;

  const MyCustomFormDropdownInput({
    Key? key,
    required this.inputKey,
    required this.name,
    required this.options,
    this.validator,
    this.onChanged,
    this.initialValue,
    //
    this.isDisabled = false,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    // Default or customizable styles
    this.inputDecoration,
    this.inputDecorationDisabled,
    //
    this.dropdownItemsAlignment = AlignmentDirectional.centerStart,
    this.dropdownTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enabled = isDisabled ? false : true;

    return MyCustomFormSimpleInputContainer(
        isDisabled: isDisabled,
        containerPadding: containerPadding!,
        containerBoxDecoration: containerBoxDecoration,
        containerBoxDecorationDisabled: containerBoxDecorationDisabled,
        useBlankContainer: true,
        childWidget: FormBuilderDropdown<String>(
          enabled: enabled,
          name: name,
          items: options
              .map((option) => DropdownMenuItem<String>(
                    alignment: dropdownItemsAlignment,
                    value:
                        option['value'] as String, // Cast the value as String
                    child: Text(
                      option['text'] as String, // Cast the text as String
                      style: dropdownTextStyle, // Text style for dropdown items
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,
          decoration: isDisabled
              ? inputDecorationDisabled ??
                  const InputDecoration(
                    border: OutlineInputBorder(), // Default border styling
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ), // Default input padding
                  )
              : inputDecoration ??
                  const InputDecoration(
                    border: OutlineInputBorder(), // Default border styling
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ), // Default input padding
                  ),
        ));
  }
}

/*
Code below returns a map instead of just a string of the value
*/

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

// class MyCustomFormDropdownInput extends StatelessWidget {
//   final String inputKey;
//   final String name;
//   final List<Map<String, dynamic>> options; // Ensure value is explicitly a map
//   final Map<String, dynamic>? initialValue;
//   final String? Function(Map<String, dynamic>?)? validator;
//   final Function(Map<String, dynamic>?)? onChanged;

//   final bool isDisabled;

//   // Container customization
//   final EdgeInsetsGeometry containerPadding; // Padding for the container
//   final BoxDecoration? containerBoxDecoration; // Custom box decoration
//   final BoxDecoration? containerBoxDecorationDisabled;

//   // New properties for customization
//   final InputDecoration? inputDecoration;
//   final InputDecoration? inputDecorationDisabled;

//   final AlignmentGeometry dropdownItemsAlignment;
//   final TextStyle? dropdownTextStyle;

//   const MyCustomFormDropdownInput({
//     Key? key,
//     required this.inputKey,
//     required this.name,
//     required this.options,
//     this.initialValue,
//     this.validator,
//     this.onChanged,
//     //
//     this.isDisabled = false,
//     //
//     this.containerPadding = const EdgeInsets.all(0.00),
//     this.containerBoxDecoration, // New property for container decoration
//     this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
//     //
//     // Default or customizable styles
//     this.inputDecoration,
//     this.inputDecorationDisabled,
//     //
//     this.dropdownItemsAlignment = AlignmentDirectional.centerStart,
//     this.dropdownTextStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool enabled = !isDisabled;

//     return MyCustomFormSimpleInputContainer(
//       isDisabled: isDisabled,
//       containerPadding: containerPadding!,
//       containerBoxDecoration: containerBoxDecoration,
//       containerBoxDecorationDisabled: containerBoxDecorationDisabled,
//       useBlankContainer: true,
//       childWidget: FormBuilderDropdown<Map<String, dynamic>>(
//         enabled: enabled,
//         name: name,
//         items: options
//             .map((option) => DropdownMenuItem<Map<String, dynamic>>(
//                   alignment: dropdownItemsAlignment,
//                   value: option, // Pass the entire map as the value
//                   child: Text(
//                     option['text'] as String, // Display text
//                     style: dropdownTextStyle, // Text style for dropdown items
//                   ),
//                 ))
//             .toList(),
//         onChanged: onChanged, // Return the whole option map
//         validator: validator,
//         initialValue: initialValue,
//         decoration: isDisabled
//             ? inputDecorationDisabled ??
//                 const InputDecoration(
//                   border: OutlineInputBorder(), // Default border styling
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 12.0,
//                     vertical: 8.0,
//                   ), // Default input padding
//                 )
//             : inputDecoration ??
//                 const InputDecoration(
//                   border: OutlineInputBorder(), // Default border styling
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 12.0,
//                     vertical: 8.0,
//                   ), // Default input padding
//                 ),
//       ),
//     );
//   }
// }

/*
  Later analyze the code below, to make sure we display a default option Text widget
  when no option has been selected.
 */

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

// class MyCustomFormDropdownInput extends StatefulWidget {
//   final String inputKey;
//   final String name;
//   final List<Map<String, dynamic>> options;
//   final String? Function(String?)? validator;
//   final Function(String?)? onChanged;
//   final String? initialValue;

//   final bool isDisabled;

//   // Container customization
//   final EdgeInsetsGeometry containerPadding;
//   final BoxDecoration? containerBoxDecoration;
//   final BoxDecoration? containerBoxDecorationDisabled;

//   // New properties for customization
//   final InputDecoration? inputDecoration;
//   final InputDecoration? inputDecorationDisabled;

//   final AlignmentGeometry dropdownItemsAlignment;
//   final TextStyle? dropdownTextStyle;

//   // Optional default label widget
//   final Widget? defaultOptionTextWidget;

//   const MyCustomFormDropdownInput({
//     Key? key,
//     required this.inputKey,
//     required this.name,
//     required this.options,
//     this.validator,
//     this.onChanged,
//     this.initialValue,
//     this.isDisabled = false,
//     this.containerPadding = const EdgeInsets.all(0.00),
//     this.containerBoxDecoration,
//     this.containerBoxDecorationDisabled,
//     this.inputDecoration,
//     this.inputDecorationDisabled,
//     this.dropdownItemsAlignment = AlignmentDirectional.centerStart,
//     this.dropdownTextStyle,
//     this.defaultOptionTextWidget, // Optional default label widget
//   }) : super(key: key);

//   @override
//   _MyCustomFormDropdownInputState createState() =>
//       _MyCustomFormDropdownInputState();
// }

// class _MyCustomFormDropdownInputState extends State<MyCustomFormDropdownInput> {
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     bool enabled = widget.isDisabled ? false : true;

//     return MyCustomFormSimpleInputContainer(
//       isDisabled: widget.isDisabled,
//       containerPadding: widget.containerPadding,
//       containerBoxDecoration: widget.containerBoxDecoration,
//       containerBoxDecorationDisabled: widget.containerBoxDecorationDisabled,
//       useBlankContainer: true,
//       childWidget: FormBuilderDropdown<String>(
//         enabled: enabled,
//         name: widget.name,
//         items: [
//           // If defaultOptionTextWidget is provided, add it as the first option
//           if (widget.defaultOptionTextWidget != null && selectedValue == null)
//             DropdownMenuItem<String>(
//               value: '',
//               child: widget.defaultOptionTextWidget ?? Text('Select an option'),
//             ),
//           // Add the actual options
//           ...widget.options
//               .map(
//                 (option) => DropdownMenuItem<String>(
//                   alignment: widget.dropdownItemsAlignment,
//                   value: option['value'] as String,
//                   child: Text(
//                     option['text'] as String,
//                     style: widget.dropdownTextStyle,
//                   ),
//                 ),
//               )
//               .toList(),
//         ],
//         onChanged: (value) {
//           setState(() {
//             selectedValue = value; // Save the selected value
//           });
//           widget.onChanged?.call(value); // Call the parent callback if provided
//         },
//         validator: widget.validator,
//         initialValue: widget.initialValue,
//         decoration: widget.isDisabled
//             ? widget.inputDecorationDisabled ??
//                 const InputDecoration(
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                 )
//             : widget.inputDecoration ??
//                 const InputDecoration(
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                 ),
//       ),
//     );
//   }
// }
