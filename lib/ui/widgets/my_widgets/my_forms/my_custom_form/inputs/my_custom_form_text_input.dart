import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyCustomFormTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String inputKey;
  final String name;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(dynamic)? onChanged;
  final String? Function(String?)? validator;
  final bool shouldHideText;
  final bool showOutlineOnFocus;
  final String? initialValue;
  final bool isDisabled;

  // New parameters for customization
  final EdgeInsetsGeometry containerPadding;
  final BoxDecoration? containerBoxDecoration;
  final BoxDecoration? containerBoxDecorationDisabled;
  final InputDecoration? inputDecoration;
  final InputDecoration? inputDecorationDisabled;

  final TextStyle? textStyle;
  final TextStyle? textStyleDisabled;

  const MyCustomFormTextInput({
    Key? key,
    required this.controller,
    required this.inputKey,
    required this.name,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.validator,
    this.shouldHideText = false,
    this.showOutlineOnFocus = true,
    this.initialValue = '',
    this.isDisabled = false,
    //
    this.containerPadding = const EdgeInsets.all(0),
    this.containerBoxDecoration,
    this.containerBoxDecorationDisabled,
    this.inputDecoration,
    this.inputDecorationDisabled,
    //
    this.textStyle,
    this.textStyleDisabled,
  }) : super(key: key);

  @override
  _MyCustomFormTextInputState createState() => _MyCustomFormTextInputState();
}

class _MyCustomFormTextInputState extends State<MyCustomFormTextInput> {
  bool isTextVisible = true;
  bool isInitialValueSet = false;

  @override
  void initState() {
    super.initState();
    isTextVisible = !widget.shouldHideText;

    // Set the initial value only once
    if (widget.initialValue != null && widget.controller.text.isEmpty) {
      widget.controller.text = widget.initialValue!;
      isInitialValueSet = true;
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.containerPadding,
      margin: const EdgeInsets.all(0),
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
      child: AbsorbPointer(
        absorbing:
            widget.isDisabled, // Disable interaction when isDisabled is true
        child: FormBuilderTextField(
          // initialValue: widget.initialValue,
          enabled: !widget.isDisabled, // Ensures no interactivity if isDisabled
          controller: widget.controller,
          key: Key(widget.inputKey),
          name: widget.name,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: widget.shouldHideText && !isTextVisible,
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
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade300,
                    ),
                    // labelText: widget.name,
                    // labelStyle: TextStyle(fontSize: 12.0, color: Colors.red),
                    // floatingLabelStyle: TextStyle(
                    //   color: Colors.grey,
                    //   fontSize: 16.0,
                    //   fontWeight: FontWeight.bold,
                    //   height: 2.00,
                    // ),
                    // floatingLabelBehavior: FloatingLabelBehavior.never,
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
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    suffixIcon: widget.shouldHideText
                        ? GestureDetector(
                            onTap: togglePasswordVisibility,
                            child: Icon(
                              isTextVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          )
                        : null,
                  )
              : widget.inputDecoration ??
                  InputDecoration(
                    hintText: widget.hintText,
                    // labelText: widget.name,
                    hintStyle: const TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey,
                    ),
                    // labelStyle: TextStyle(fontSize: 12.0, color: Colors.red),
                    // floatingLabelStyle: TextStyle(
                    //   color: Colors.black,
                    //   fontSize: 16.0,
                    //   fontWeight: FontWeight.bold,
                    //   height: 2.00,
                    // ),
                    // floatingLabelBehavior: FloatingLabelBehavior.never,
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
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    suffixIcon: widget.shouldHideText
                        ? GestureDetector(
                            onTap: togglePasswordVisibility,
                            child: Icon(
                              isTextVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          )
                        : null,
                  ),
        ),
      ),
    );
  }
}
