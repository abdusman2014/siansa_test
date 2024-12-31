import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class MyCustomFormFilePickerDragAndDropInput extends StatefulWidget {
  final String inputKey;
  final Function(List<PlatformFile>)?
      onChanged; // Returns PlatformFile for cross-platform support
  final bool allowMultiple; // Default is true for multiple file selection
  final List<String>?
      allowedExtensions; // Specify file extensions or allow any by default
  final Color? backgroundColor; // Customizable background color
  final double? borderWidth; // Customizable border width
  final Color? borderColor; // Customizable border color
  final BorderStyle? borderStyle; // Customizable border style
  final double? borderRadius; // Customizable border radius
  final List<BoxShadow>? boxShadow; // Customizable drop shadow
  final Widget? textWidget; // Customizable text widget

  const MyCustomFormFilePickerDragAndDropInput({
    Key? key,
    required this.inputKey,
    this.onChanged,
    this.allowMultiple = true, // Allow multiple files by default
    this.allowedExtensions, // Allow any file type if not specified
    this.backgroundColor = const Color(0xFFF5F5F5), // Default background color
    this.borderWidth = 2.0, // Default border width
    this.borderColor = Colors.grey, // Default border color
    this.borderStyle = BorderStyle.solid, // Default border style
    this.borderRadius = 8.0, // Default border radius
    this.boxShadow, // No shadow by default
    this.textWidget, // Customizable text inside the container
  }) : super(key: key);

  @override
  _MyCustomFormFilePickerDragAndDropInputState createState() =>
      _MyCustomFormFilePickerDragAndDropInputState();
}

class _MyCustomFormFilePickerDragAndDropInputState
    extends State<MyCustomFormFilePickerDragAndDropInput> {
  bool _isHovering = false;

  Future<void> _pickFiles(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: widget.allowMultiple, // Allow multiple files if true
        type: widget.allowedExtensions != null
            ? FileType.custom
            : FileType.any, // Use custom type if extensions are provided
        allowedExtensions: widget.allowedExtensions, // Specify file extensions
      );

      if (result != null && widget.onChanged != null) {
        widget.onChanged!(
            result.files); // PlatformFile contains both path and bytes
      }
    } catch (e) {
      print("Error picking files: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () => _pickFiles(context),
        child: DragTarget<PlatformFile>(
          onWillAccept: (data) {
            setState(() => _isHovering = true);
            return true;
          },
          onLeave: (data) {
            setState(() => _isHovering = false);
          },
          onAccept: (data) {
            setState(() => _isHovering = false);
            // Handle file drop here
            _handleDrop(data);
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              decoration: BoxDecoration(
                color:
                    _isHovering ? Colors.grey.shade200 : widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                border: Border.all(
                  color: widget.borderColor ?? Colors.grey,
                  width: widget.borderWidth ?? 10.0,
                  style: widget.borderStyle ?? BorderStyle.solid,
                ),
                boxShadow: widget.boxShadow ??
                    [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ], // Optional shadow
              ),
              child: Center(
                child: widget.textWidget ??
                    Text(
                      'Drag and drop files here or click to select',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleDrop(PlatformFile file) async {
    // Handle the file drop and call the onChanged callback
    if (widget.onChanged != null) {
      widget.onChanged!([file]); // Wrap the file in a list
    }
  }
}
