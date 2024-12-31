import 'package:flutter/material.dart';

class MyCustomFormLabelButton extends StatelessWidget {
  final Text? clickableTextWidget; // Accepts a Text widget
  final Text? nonClickableTextWidget; // Accepts a Text widget

  // Position of the non-clickable text ('top', 'bottom', 'start', 'end')
  final String clickableTextWidgetPosition;

  // Function to be executed when the clickable text is clicked
  final Function()? onClick;

  // Container styling properties
  final BoxDecoration? containerBoxDecoration;
  final EdgeInsets containerPadding;
  final double spacerSize;

  const MyCustomFormLabelButton({
    Key? key,
    this.clickableTextWidget,
    this.nonClickableTextWidget,
    this.clickableTextWidgetPosition = 'end', // Default to 'start'
    this.onClick,
    this.containerBoxDecoration,
    this.containerPadding = const EdgeInsets.all(0.00),
    this.spacerSize = 4.00,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the clickable text widget with gesture detection
    final clickableWidget = GestureDetector(
      onTap: onClick ?? () => print('Clickable text clicked'),
      child: clickableTextWidget ??
          const Text(
            'Clickable text',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
    );

    // Arrange the widgets based on the clickableTextWidgetPosition value
    Widget labelContent;
    if (nonClickableTextWidget != null) {
      switch (clickableTextWidgetPosition) {
        case 'top':
          labelContent = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              clickableWidget,
              SizedBox(height: spacerSize),
              nonClickableTextWidget!,
            ],
          );
          break;
        case 'bottom':
          labelContent = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              nonClickableTextWidget!,
              SizedBox(height: spacerSize),
              clickableWidget,
            ],
          );
          break;
        case 'start':
          labelContent = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              clickableWidget,
              SizedBox(width: spacerSize),
              nonClickableTextWidget!,
            ],
          );
          break;
        case 'end':
        default:
          labelContent = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              nonClickableTextWidget!,
              SizedBox(width: spacerSize),
              clickableWidget,
            ],
          );
          break;
      }
    } else {
      // If there's no non-clickable text, just show the clickable widget
      labelContent = clickableWidget;
    }

    return Container(
      padding: containerPadding,
      decoration: containerBoxDecoration ??
          BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.transparent,
              width: 0.00,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
      child: labelContent,
    );
  }
}
