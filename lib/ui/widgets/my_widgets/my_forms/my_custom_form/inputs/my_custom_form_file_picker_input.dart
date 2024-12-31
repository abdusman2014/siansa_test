import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/button_icon_container.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormFilePickerInput extends StatelessWidget {
  final String inputKey;
  final String? name;
  // Returns PlatformFile for cross-platform support
  final Function(List<PlatformFile>)? onChanged;
  final bool allowMultiple; // Default is true for multiple file selection
  // Specify file extensions or allow any by default
  final List<String>? allowedExtensions;

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

  const MyCustomFormFilePickerInput({
    Key? key,
    required this.inputKey,
    this.name = "File Picker",
    this.onChanged,
    this.allowMultiple = true, // Allow multiple files by default
    this.allowedExtensions, // Allow any file type if not specified
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
  }) : super(key: key);

  Future<void> _pickFiles(BuildContext context) async {
    try {
      EasyLoading.show();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple, // Allow multiple files if true
        type: allowedExtensions != null
            ? FileType.custom
            : FileType.any, // Use custom type if extensions are provided
        allowedExtensions: allowedExtensions, // Specify file extensions
      );

      if (result != null && onChanged != null) {
        EasyLoading.dismiss();
        // Pass the picked files to the parent
        onChanged!(result.files); // PlatformFile contains both path and bytes
      }

      EasyLoading.dismiss();
    } catch (e) {
      // Handle any exceptions or errors
      print("Error picking files: $e");
      EasyLoading.dismiss();
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
            : () => _pickFiles(context), // Disable interaction
      ),
    );
  }
}
