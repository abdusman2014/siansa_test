import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyCustomFormTextareaInput extends StatefulWidget {
  final TextEditingController controller;
  final String inputKey;
  final String name;
  final String hintText;
  final Function(dynamic)? onChanged;
  final String? Function(String?)? validator;
  final bool showOutlineOnFocus;
  final String initialValue;
  final bool isDisabled;

  // New properties
  final EdgeInsetsGeometry containerPadding;
  final BoxDecoration? containerBoxDecoration;
  final BoxDecoration? containerBoxDecorationDisabled;
  final InputDecoration? inputDecoration;
  final InputDecoration? inputDecorationDisabled;
  final int? minLines;
  final int? maxLines;

  final TextStyle? textStyle;
  final TextStyle? textStyleDisabled;

  const MyCustomFormTextareaInput({
    Key? key,
    required this.controller,
    required this.inputKey,
    required this.name,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.showOutlineOnFocus = true,
    //
    this.initialValue = '',
    //
    this.isDisabled = false,
    this.containerPadding = const EdgeInsets.all(0),
    this.containerBoxDecoration,
    this.containerBoxDecorationDisabled,
    this.inputDecoration,
    this.inputDecorationDisabled,
    this.minLines = 5,
    this.maxLines = 100,
    //
    this.textStyle,
    this.textStyleDisabled,
  }) : super(key: key);

  @override
  _MyCustomFormTextareaInputState createState() =>
      _MyCustomFormTextareaInputState();
}

class _MyCustomFormTextareaInputState extends State<MyCustomFormTextareaInput> {
  bool _isInitialValueSet = false;

  @override
  void initState() {
    super.initState();
    // if (!widget.isDisabled && widget.controller.text.isEmpty) {
    //   widget.controller.text = widget.initialValue;
    //   _isInitialValueSet = true;
    // }
    widget.controller.text = widget.initialValue;
    _isInitialValueSet = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.isDisabled
          ? widget.containerBoxDecorationDisabled ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.transparent,
              )
          : widget.containerBoxDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.transparent,
              ),
      padding: widget.containerPadding,
      child: AbsorbPointer(
        absorbing: widget.isDisabled,
        child: FormBuilderTextField(
          controller: widget.controller,
          name: widget.name,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          validator: widget.validator,
          style: widget.isDisabled
              ? widget.textStyleDisabled ??
                  TextStyle(
                    fontSize: 13.5,
                    color: Colors.grey.shade400,
                  )
              : widget.textStyle ??
                  TextStyle(
                    fontSize: 13.5,
                    color: Colors.grey.shade600,
                  ),
          decoration: widget.isDisabled
              ? widget.inputDecorationDisabled ??
                  InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade300,
                    ),
                    hintText: widget.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: widget.showOutlineOnFocus
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          )
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  )
              : widget.inputDecoration ??
                  InputDecoration(
                    hintStyle: const TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey,
                    ),
                    hintText: widget.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: widget.showOutlineOnFocus
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          )
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
        ),
      ),
    );
  }
}
