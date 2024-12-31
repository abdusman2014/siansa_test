// import 'package:flutter/material.dart';

// class MyCustomFormSubmitButton extends StatelessWidget {
//   const MyCustomFormSubmitButton({
//     super.key,
//     required this.onTap,
//     required this.text,
//     required this.isDisabled,
//   });

//   final VoidCallback onTap;
//   final String text;
//   final bool isDisabled;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isDisabled ? null : onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 55,
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: isDisabled ? Colors.grey.shade300 : Colors.black,
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.grey.shade200,
//               offset: const Offset(2, 4),
//               blurRadius: 5,
//               spreadRadius: 2,
//             )
//           ],
//         ),
//         child: Text(
//           text.toUpperCase(),
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyCustomFormSubmitButton extends StatelessWidget {
  const MyCustomFormSubmitButton({
    Key? key,
    required this.onTap,
    this.isDisabled = false,
    this.containerWidth,
    this.containerHeight,
    this.boxDecoration,
    this.boxDecorationDisabled,
    this.textWidget,
    this.textWidgetDisabled,
    this.text = 'SUBMIT',
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isDisabled;
  final double? containerWidth;
  final double? containerHeight;
  final BoxDecoration? boxDecoration;
  final BoxDecoration? boxDecorationDisabled;
  final Widget? textWidget;
  final Widget? textWidgetDisabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: containerWidth ?? MediaQuery.of(context).size.width,
        height: containerHeight ?? 55,
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: isDisabled
            ? (boxDecorationDisabled ??
                BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ],
                ))
            : (boxDecoration ??
                BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ],
                )),
        child: isDisabled
            ? (textWidgetDisabled ??
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ))
            : (textWidget ??
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )),
      ),
    );
  }
}
