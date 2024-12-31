import 'package:flutter/material.dart';

class MyCustomFormLabel extends StatelessWidget {
  final String? labelText;
  final Color? labelColor;
  final Widget? textWidget;
  final Widget? iconWidget;
  final VoidCallback? onTap;
  final VoidCallback onTextTap;
  final VoidCallback onIconTap;
  final BoxDecoration? containerBoxDecoration;
  final EdgeInsets containerPadding;
  final EdgeInsets margin;
  // final MainAxisAlignment alignment;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String iconPosition; // Accepts 'start', 'end', 'top', 'bottom'
  final double iconSpacer; // Spacer width

  const MyCustomFormLabel({
    Key? key,
    this.labelText,
    this.labelColor,
    this.textWidget,
    this.iconWidget,
    this.onTap, // overrides onTextTap & onIconTap
    this.onTextTap = _defaultTextTap,
    this.onIconTap = _defaultIconTap,
    this.containerBoxDecoration,
    this.containerPadding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.symmetric(vertical: 0),
    // this.alignment = MainAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.iconPosition = 'end', // Default to 'end'
    this.iconSpacer = 10.0, // Default spacer value
  }) : super(key: key);

  static void _defaultTextTap() {
    print('Text tapped!');
  }

  static void _defaultIconTap() {
    print('Icon tapped!');
  }

  @override
  Widget build(BuildContext context) {
    // Define the main content based on iconPosition
    return Container(
      padding: containerPadding,
      margin: margin,
      decoration: containerBoxDecoration ??
          BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
      child: iconPosition == 'top' || iconPosition == 'bottom'
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: _buildContent(),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: _buildContent(),
            ),
    );
  }

  List<Widget> _buildContent() {
    final List<Widget> content = [];

    // Add icon if positioned 'start' or 'top'
    if ((iconPosition == 'start' || iconPosition == 'top') &&
        iconWidget != null) {
      content.add(_buildIcon());
      if (iconSpacer > 0) {
        content.add(iconPosition == 'top' || iconPosition == 'bottom'
            ? SizedBox(height: iconSpacer)
            : SizedBox(width: iconSpacer));
      }
    }

    // Add text widget
    content.add(
      GestureDetector(
        onTap: onTap ?? onTextTap,
        child: textWidget ??
            Text(
              labelText ?? 'Custom Form Label',
              style: TextStyle(
                color: labelColor ?? Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );

    // Add icon if positioned 'end' or 'bottom'
    if ((iconPosition == 'end' || iconPosition == 'bottom') &&
        iconWidget != null) {
      if (iconSpacer > 0) {
        content.add(iconPosition == 'top' || iconPosition == 'bottom'
            ? SizedBox(height: iconSpacer)
            : SizedBox(width: iconSpacer));
      }
      content.add(_buildIcon());
    }

    return content;
  }

  Widget _buildIcon() {
    return GestureDetector(
      onTap: onTap ?? onIconTap,
      child:
          iconWidget ?? const Icon(Icons.info, size: 24, color: Colors.black),
    );
  }
}
