import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormRadioGroupInput extends StatelessWidget {
  final String inputKey;
  final String name;
  final List<Map<String, dynamic>> options;
  // final Map<String, dynamic>? initialValue;
  final dynamic initialValue;
  final Function(dynamic)? onChanged; // Change to accept a single value
  final String? Function(String?)? validator;

  final bool isDisabled;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  // Styling properties

  final bool isHorizontal;
  final double radioSize; // Size for the radio button
  final double radioTextSpacing; // Spacing between radio button and text

  final TextStyle? labelStyle;
  final TextStyle? labelStyleDisabled;

  final Color? activeColor;
  final Color? activeColorDisabled;

  final WidgetStateProperty<Color?>? fillColor;
  final WidgetStateProperty<Color?>? fillColorDisabled;

  const MyCustomFormRadioGroupInput({
    Key? key,
    required this.inputKey,
    required this.name,
    required this.options,
    this.initialValue,
    this.onChanged,
    this.validator,
    //
    this.isDisabled = false,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    this.isHorizontal = false,
    this.radioSize = 24.0, // Default size for the radio button
    this.radioTextSpacing = 8.0, // Default value for spacing
    //
    this.labelStyle,
    this.labelStyleDisabled,
    //
    this.activeColor,
    this.activeColorDisabled,
    //
    this.fillColor,
    this.fillColorDisabled,
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
      childWidget: FormBuilderField<String>(
        name: name,
        initialValue: initialValue,
        enabled: enabled,
        validator: validator,
        builder: (field) {
          return isHorizontal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: options.map((option) {
                    return Expanded(
                      child: _buildRadioListTile(
                          context, option, field as FormBuilderFieldState),
                    );
                  }).toList(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((option) {
                    return _buildRadioListTile(
                        context, option, field as FormBuilderFieldState);
                  }).toList(),
                );
        },
      ),
    );
  }

  Widget _buildRadioListTile(
    BuildContext context,
    Map<String, dynamic> option,
    FormBuilderFieldState<dynamic, dynamic> field,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(
        radioTheme: RadioThemeData(
          fillColor: isDisabled
              ? fillColorDisabled ??
                  WidgetStateProperty.all(Colors.grey.shade300)
              : fillColor ?? WidgetStateProperty.all(Colors.grey.shade300),
        ),
      ),
      child: Container(
        width: isHorizontal ? null : double.infinity,
        height: isHorizontal
            ? null
            : (radioSize + 16.0), // Adjust height if vertical
        child: Row(
          children: [
            Transform.scale(
              // Adjust scale based on default radio size
              scale: radioSize / 24.0,
              child: Radio<String>(
                value: option['value'].toString(),
                groupValue: field.value,
                activeColor: isDisabled
                    ? activeColorDisabled ?? Theme.of(context).primaryColor
                    : activeColor ?? Theme.of(context).primaryColor,
                onChanged: (value) {
                  if (isDisabled) return;
                  field.didChange(value);
                  if (onChanged != null) onChanged!(value);
                },
              ),
            ),
            SizedBox(width: radioTextSpacing), // Spacing between radio and text
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

// class MyCustomFormRadioGroupInput extends StatefulWidget {
//   final String inputKey;
//   final String name;
//   final List<Map<String, dynamic>> options;
//   final Map<String, dynamic>? initialValue;
//   final Function(Map<String, dynamic>?)? onChanged;
//   final String? Function(String?)? validator;

//   final bool isDisabled;

//   // Container customization
//   final EdgeInsetsGeometry containerPadding;
//   final BoxDecoration? containerBoxDecoration;
//   final BoxDecoration? containerBoxDecorationDisabled;

//   // Styling properties
//   final bool isHorizontal;
//   final double radioSize;
//   final double radioTextSpacing;

//   final TextStyle? labelStyle;
//   final TextStyle? labelStyleDisabled;

//   final Color? activeColor;
//   final Color? activeColorDisabled;

//   final WidgetStateProperty<Color?>? fillColor;
//   final WidgetStateProperty<Color?>? fillColorDisabled;

//   const MyCustomFormRadioGroupInput({
//     required this.inputKey,
//     Key? key,
//     required this.name,
//     required this.options,
//     this.initialValue,
//     this.onChanged,
//     this.validator,
//     this.isDisabled = false,
//     this.containerPadding = const EdgeInsets.all(0.0),
//     this.containerBoxDecoration,
//     this.containerBoxDecorationDisabled,
//     this.isHorizontal = false,
//     this.radioSize = 24.0,
//     this.radioTextSpacing = 8.0,
//     this.labelStyle,
//     this.labelStyleDisabled,
//     this.activeColor,
//     this.activeColorDisabled,
//     this.fillColor,
//     this.fillColorDisabled,
//   }) : super(key: key);

//   @override
//   _MyCustomFormRadioGroupInputState createState() =>
//       _MyCustomFormRadioGroupInputState();
// }

// class _MyCustomFormRadioGroupInputState
//     extends State<MyCustomFormRadioGroupInput> {
//   late Map<String, dynamic>? selectedOption;

//   @override
//   void initState() {
//     super.initState();
//     selectedOption = widget.initialValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isEnabled = !widget.isDisabled;

//     return MyCustomFormSimpleInputContainer(
//       isDisabled: widget.isDisabled,
//       containerBoxDecoration: widget.containerBoxDecoration,
//       containerBoxDecorationDisabled: widget.containerBoxDecorationDisabled,
//       containerPadding: widget.containerPadding,
//       useBlankContainer: true,
//       childWidget: FormBuilderField<Map<String, dynamic>>(
//         name: widget.name,
//         initialValue: widget.initialValue,
//         enabled: isEnabled,
//         validator: (value) =>
//             widget.validator?.call(value?['value'] as String?),
//         builder: (field) {
//           return widget.isHorizontal
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: widget.options.map((option) {
//                     return Expanded(
//                       child: _buildRadioListTile(
//                         option,
//                         // field,
//                       ),
//                     );
//                   }).toList(),
//                 )
//               : Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: widget.options.map((option) {
//                     return _buildRadioListTile(
//                       option,
//                       // field,
//                     );
//                   }).toList(),
//                 );
//         },
//       ),
//     );
//   }

//   Widget _buildRadioListTile(
//     Map<String, dynamic> option,
//     // FormBuilderFieldState<Map<String, dynamic>> field,
//   ) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         radioTheme: RadioThemeData(
//           fillColor: widget.isDisabled
//               ? widget.fillColorDisabled ??
//                   WidgetStateProperty.all(Colors.grey.shade300)
//               : widget.fillColor ?? WidgetStateProperty.all(Colors.grey),
//         ),
//       ),
//       child: Container(
//         width: widget.isHorizontal ? null : double.infinity,
//         height: widget.isHorizontal
//             ? null
//             : (widget.radioSize + 16.0), // Adjust height if vertical
//         child: Row(
//           children: [
//             Transform.scale(
//               scale: widget.radioSize / 24.0, // Adjust scale based on default
//               child: Radio<Map<String, dynamic>>(
//                 value: option,
//                 groupValue: selectedOption,
//                 activeColor: widget.isDisabled
//                     ? widget.activeColorDisabled ??
//                         Theme.of(context).primaryColor
//                     : widget.activeColor ?? Theme.of(context).primaryColor,
//                 onChanged: !widget.isDisabled
//                     ? (value) {
//                         setState(() {
//                           selectedOption = value;
//                         });
//                         // field.didChange(value);
//                         if (widget.onChanged != null) {
//                           widget.onChanged!(value);
//                         }
//                       }
//                     : null,
//               ),
//             ),
//             SizedBox(width: widget.radioTextSpacing), // Spacing between radio
//             Expanded(
//               child: Text(
//                 option['text'] ?? '',
//                 style: widget.isDisabled
//                     ? widget.labelStyleDisabled ??
//                         const TextStyle(fontSize: 16.0)
//                     : widget.labelStyle ?? const TextStyle(fontSize: 16.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
