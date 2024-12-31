import 'package:flutter/material.dart';

class MyCustomFormButtonAndIconInputContainer extends StatelessWidget {
  final String? name;

  final bool isDisabled;

  // New parameters for button and dialog customization
  final ButtonStyle? elevatedButtonStyle;
  final ButtonStyle? elevatedButtonStyleDisabled;

  // Properties for text widgets based on enabled/disabled state
  final bool disableButtonText;
  final Widget? elevatedButtonTextWidget;
  final Widget? elevatedButtonTextWidgetDisabled;

  // Icon customization
  final Widget? iconWidget;
  final Widget? iconWidgetDisabled;
  final String iconPosition; // 'start', 'end', 'top', or 'bottom'
  final double iconSpace;

  final Function()? onPressed;

  const MyCustomFormButtonAndIconInputContainer({
    this.name,
    this.isDisabled = false,
    //
    this.elevatedButtonStyle,
    this.elevatedButtonStyleDisabled,
    //
    this.disableButtonText = false,
    this.elevatedButtonTextWidget,
    this.elevatedButtonTextWidgetDisabled,
    //
    this.iconSpace = 5.00,
    this.iconPosition = 'start', // 'start', 'end', 'top', or 'bottom'
    this.iconWidget,
    this.iconWidgetDisabled,
    //
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Widget effectiveTextWidget = isDisabled
        ? (elevatedButtonTextWidgetDisabled ??
            (name != null
                ? Text(name!,
                    style: TextStyle(
                        color: Colors.grey
                            .shade400)) // Removed usage of elevatedButtonTextDisabledStyle
                : const SizedBox.shrink()))
        : (elevatedButtonTextWidget ??
            (name != null
                ? Text(name!,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12))
                : const SizedBox.shrink()));

    return ElevatedButton(
      style: isDisabled
          ? elevatedButtonStyleDisabled ??
              // Default isDisabled color
              ElevatedButton.styleFrom(
                disabledBackgroundColor: Colors.grey.shade500,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ), // Default padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Default border radius
                ),
              )
          : elevatedButtonStyle ??
              ElevatedButton.styleFrom(
                // Default background color
                backgroundColor: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ), // Default padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Default border radius
                ),
              ),
      onPressed: isDisabled ? null : () => onPressed!(),
      child: _buildButtonContent(
        effectiveTextWidget,
        isDisabled ? iconWidgetDisabled : iconWidget,
        iconSpace,
      ),
    );
  }

  Widget _buildButtonContent(
    Widget textWidget,
    Widget? iconWidget,
    double iconSpace, // Explicitly declare the type as double
  ) {
    // If the button is isDisabled and no icon is provided, or text is isDisabled
    // if (isDisabled && iconWidget == null && disableButtonText) {
    //   return const SizedBox.shrink(); // Return an empty widget
    // }

    // Only use icon space when both the icon and text are present
    bool shouldUseIconSpace = iconWidget != null && !disableButtonText;

    switch (iconPosition) {
      case 'start':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconWidget != null) iconWidget!,
            if (shouldUseIconSpace) SizedBox(width: iconSpace),
            // if (!disableButtonText) textWidget,
            if (!disableButtonText || (disableButtonText && iconWidget == null))
              textWidget,
            // show text only if disable text is not false: !disableButtonText
            // and, if icon is not null,
          ],
        );
      case 'end':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (!disableButtonText) textWidget,
            if (!disableButtonText || (disableButtonText && iconWidget == null))
              textWidget,
            if (shouldUseIconSpace) SizedBox(width: iconSpace),
            if (iconWidget != null) iconWidget!,
          ],
        );
      case 'top':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconWidget != null) iconWidget!,
            if (shouldUseIconSpace) SizedBox(height: iconSpace),
            // if (!disableButtonText) textWidget,
            if (!disableButtonText || (disableButtonText && iconWidget == null))
              textWidget,
          ],
        );
      case 'bottom':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (!disableButtonText) textWidget,
            if (!disableButtonText || (disableButtonText && iconWidget == null))
              textWidget,
            if (shouldUseIconSpace) SizedBox(height: iconSpace),
            if (iconWidget != null) iconWidget!,
          ],
        );
      default:
        return textWidget; // Default behavior is just text if no valid iconPosition is provided
    }
  }
}
