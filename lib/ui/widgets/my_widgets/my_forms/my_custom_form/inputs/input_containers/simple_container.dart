import 'package:flutter/material.dart';

class MyCustomFormSimpleInputContainer extends StatelessWidget {
  final bool isDisabled;

  // Container customization parameters
  final EdgeInsetsGeometry containerPadding;
  final BoxDecoration? containerBoxDecoration;
  final BoxDecoration? containerBoxDecorationDisabled;
  final Widget childWidget;

  final bool useBlankContainer;

  const MyCustomFormSimpleInputContainer({
    this.isDisabled = false,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration,
    this.containerBoxDecorationDisabled,
    this.childWidget = const Text('Child Widget here...'),
    //
    this.useBlankContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    late BoxDecoration effectiveBoxDecoration = isDisabled
        ? (containerBoxDecorationDisabled ??
            BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Colors.transparent, width: 0),
              boxShadow: [], // No shadow when isDisabled
            ))
        : (containerBoxDecoration ??
            BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
              ],
            ));

    if (useBlankContainer) {
      effectiveBoxDecoration = isDisabled
          ? (containerBoxDecorationDisabled ??
              const BoxDecoration(
                  // color: Colors.transparent,
                  // borderRadius: BorderRadius.zero,
                  // border: Border.all(color: Colors.transparent, width: 0),
                  // boxShadow: [], // No shadow when isDisabled
                  ))
          : (containerBoxDecoration ??
              const BoxDecoration(
                  // color: Colors.transparent,
                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                  // ],
                  ));
    }

    return Container(
      padding: containerPadding,
      decoration: effectiveBoxDecoration,
      child: childWidget,
    );
  }
}
