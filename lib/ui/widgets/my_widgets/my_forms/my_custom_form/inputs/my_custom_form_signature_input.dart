import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormSignatureInput extends StatefulWidget {
  final String name;
  // final Function(ui.Image?)? onChanged;
  final Function(ui.Image?, List<Offset?>?)? onChanged;
  final ui.Image? initialImageValue;
  final List<Offset?>? initialPointsValue;

  final bool isDisabled;
  final bool isTitleVisible;
  final bool isClearButtonVisible;

  // Container customization
  final EdgeInsetsGeometry containerPadding; // Padding for the container
  final BoxDecoration? containerBoxDecoration; // Custom box decoration
  final BoxDecoration? containerBoxDecorationDisabled;

  final double containerWidth;
  final double containerHeight;

  final CrossAxisAlignment? columnCrossAxisAlignment;

  final Text? titleTextWidget;
  final Text? titleTextWidgetDisabled;

  final Text? buttonTextWidget;
  final Text? buttonTextWidgetDisabled;

  final ButtonStyle? buttonStyle;
  final ButtonStyle? buttonStyleDisabled;

  final Color paintColor;
  final double paintWidth;

  final double topSpacerHeight;
  final double bottomSpacerHeight;

  const MyCustomFormSignatureInput({
    Key? key,
    required this.name,
    this.onChanged,
    this.initialImageValue,
    this.initialPointsValue,
    //
    this.isDisabled = false,
    this.isTitleVisible = true,
    this.isClearButtonVisible = true,
    //
    this.containerPadding = const EdgeInsets.all(0.00),
    this.containerBoxDecoration, // New property for container decoration
    this.containerBoxDecorationDisabled, // New property for isDisabled container decoration
    //
    this.containerWidth = 450,
    this.containerHeight = 200,
    //
    this.columnCrossAxisAlignment,
    //
    this.titleTextWidget,
    this.titleTextWidgetDisabled,
    //
    this.buttonTextWidget,
    this.buttonTextWidgetDisabled,
    //
    this.buttonStyle,
    this.buttonStyleDisabled,
    //
    this.paintColor = Colors.black,
    this.paintWidth = 3.0, // Default paint width for the signature
    //
    this.topSpacerHeight = 15.0,
    this.bottomSpacerHeight = 15.0,
  }) : super(key: key);

  @override
  _MyCustomFormSignatureInputState createState() =>
      _MyCustomFormSignatureInputState();
}

class _MyCustomFormSignatureInputState
    extends State<MyCustomFormSignatureInput> {
  List<Offset?> points = [];

  @override
  void initState() {
    super.initState();
    // Initialize points only if initialPointsValue is not null
    if (widget.initialPointsValue != null) {
      points = List.from(widget.initialPointsValue!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          widget.columnCrossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        if (widget.isTitleVisible)
          widget.isDisabled
              ? widget.titleTextWidgetDisabled ??
                  Text(widget.name.toUpperCase())
              : widget.titleTextWidget ?? Text(widget.name.toUpperCase()),
        if (widget.isTitleVisible) SizedBox(height: widget.topSpacerHeight),
        Container(
          width: widget.containerWidth,
          height: widget.containerHeight,
          decoration: widget.isDisabled
              ? widget.containerBoxDecorationDisabled ??
                  BoxDecoration(
                    color: const ui.Color.fromARGB(226, 237, 230, 230),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const ui.Color.fromARGB(136, 237, 230, 230),
                      width: 6,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  )
              : widget.containerBoxDecoration ??
                  BoxDecoration(
                    color: const ui.Color.fromARGB(226, 237, 230, 230),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const ui.Color.fromARGB(136, 237, 230, 230),
                      width: 6,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
          child: GestureDetector(
            // onPanStart: (details) {
            //   if (widget.isDisabled) return;
            //   setState(() {
            //     RenderBox renderBox = context.findRenderObject() as RenderBox;
            //     Offset localPosition =
            //         renderBox.globalToLocal(details.globalPosition);
            //     if (_isPointWithinBounds(localPosition)) {
            //       points.add(localPosition);
            //     }
            //   });
            // },
            // onPanUpdate: (details) {
            //   if (widget.isDisabled) return;
            //   setState(() {
            //     RenderBox renderBox = context.findRenderObject() as RenderBox;
            //     Offset localPosition =
            //         renderBox.globalToLocal(details.globalPosition);
            //     if (_isPointWithinBounds(localPosition)) {
            //       points.add(localPosition);
            //     }
            //   });
            // },
            onPanStart: (details) {
              if (widget.isDisabled) return;
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                Offset localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                // Offset adjustment (add or subtract based on your testing)
                localPosition =
                    // localPosition.translate(0, -widget.paintWidth / 2);
                    localPosition.translate(0, -37);
                if (_isPointWithinBounds(localPosition)) {
                  points.add(localPosition);
                }
              });
            },
            onPanUpdate: (details) {
              if (widget.isDisabled) return;
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                Offset localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                // Offset adjustment (add or subtract based on your testing)
                localPosition =
                    // localPosition.translate(0, -widget.paintWidth / 2);
                    localPosition.translate(0, -37);
                if (_isPointWithinBounds(localPosition)) {
                  points.add(localPosition);
                }
              });
            },

            onPanEnd: (details) {
              if (widget.isDisabled) return;
              points.add(null); // Add a separator for lines
              _updateImage();
            },
            child: CustomPaint(
              size: Size(widget.containerWidth, widget.containerHeight),
              painter: SignaturePainter(
                points,
                widget.paintColor,
                widget.paintWidth,
              ),
            ),
          ),
        ),
        if (widget.isClearButtonVisible)
          SizedBox(height: widget.bottomSpacerHeight), // Customizable spacer
        if (widget.isClearButtonVisible)
          ElevatedButton(
            onPressed: () {
              if (widget.isDisabled) return;

              setState(() {
                points.clear(); // Clear the signature
                _updateImage(clear: true); // Pass `clear: true` to notify clear
              });
            },
            style: widget.isDisabled
                ? widget.buttonStyleDisabled ??
                    ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                    )
                : widget.buttonStyle ??
                    ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                    ),
            child: widget.isDisabled
                ? widget.buttonTextWidgetDisabled ??
                    const Text(
                      'Clear Signature',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ), // Apply custom button text style
                    )
                : widget.buttonTextWidget ??
                    const Text(
                      'Clear Signature',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ), // Apply custom button text style
                    ),
          ),
      ],
    );
  }

  bool _isPointWithinBounds(Offset point) {
    return point.dx >= 0 &&
        point.dx <= widget.containerWidth &&
        point.dy >= 0 &&
        point.dy <= widget.containerHeight;
  }

  // Updated _updateImage method to return null if signature is cleared
  void _updateImage({bool clear = false}) async {
    if (clear) {
      // Notify parent that the signature is cleared
      // widget.onChanged?.call(null);
      widget.onChanged?.call(null, null);
      return;
    }

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()
      ..color = widget.paintColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = widget.paintWidth; // Customizable paint width

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(
      widget.containerWidth.toInt(),
      widget.containerHeight.toInt(),
    );
    // Call the onChanged function with the image
    // widget.onChanged?.call(img);
    // Call the onChanged function with the image and the points
    widget.onChanged?.call(img, points);
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  final Color paintColor;
  final double paintWidth;

  SignaturePainter(this.points, this.paintColor, this.paintWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = paintColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = paintWidth; // Customizable paint width

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) => true;
}

// **************************************************
// **************************************************
// **************************************************
// **************************************************
// **************************************************

// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';

// class MyCustomFormSignatureInput extends StatefulWidget {
//   final String name;
//   final Function(ui.Image?)? onChanged;
//   final ui.Image? initialValue;
//   final CrossAxisAlignment? columnCrossAxisAlignment;
//   final double borderWidth;
//   final Color backgroundColor;
//   final Color borderColor;
//   final Color paintColor;
//   final double paintWidth;
//   final double topSpacerHeight;
//   final double bottomSpacerHeight;
//   final ButtonStyle? buttonStyle;
//   final Text? titleTextWidget;
//   final Text? buttonTextWidget;

//   const MyCustomFormSignatureInput({
//     Key? key,
//     required this.name,
//     this.onChanged,
//     this.initialValue,
//     this.columnCrossAxisAlignment,
//     this.borderWidth = 6,
//     this.backgroundColor = const ui.Color.fromARGB(226, 237, 230, 230),
//     this.borderColor = const ui.Color.fromARGB(136, 237, 230, 230),
//     this.paintColor = Colors.black,
//     this.paintWidth = 3.0, // Default paint width for the signature
//     this.topSpacerHeight = 15.0,
//     this.bottomSpacerHeight = 15.0,
//     this.buttonStyle, // Customizable button style
//     this.titleTextWidget,
//     this.buttonTextWidget,
//   }) : super(key: key);

//   @override
//   _MyCustomFormSignatureInputState createState() =>
//       _MyCustomFormSignatureInputState();
// }

// class _MyCustomFormSignatureInputState
//     extends State<MyCustomFormSignatureInput> {
//   List<Offset?> points = [];
//   final double containerWidth = 450; // Set the desired width
//   final double containerHeight = 200; // Set the desired height

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment:
//           widget.columnCrossAxisAlignment ?? CrossAxisAlignment.center,
//       children: [
//         widget.titleTextWidget ?? Text(widget.name.toUpperCase()),
//         SizedBox(height: widget.topSpacerHeight),
//         Container(
//           width: containerWidth,
//           height: containerHeight,
//           decoration: BoxDecoration(
//             color: widget.backgroundColor,
//             borderRadius: BorderRadius.circular(4.0),
//             border: Border.all(
//               color: widget.borderColor,
//               width: widget.borderWidth,
//               strokeAlign: BorderSide.strokeAlignOutside,
//             ),
//           ),
//           child: GestureDetector(
//             onPanStart: (details) {
//               setState(() {
//                 RenderBox renderBox = context.findRenderObject() as RenderBox;
//                 Offset localPosition =
//                     renderBox.globalToLocal(details.globalPosition);
//                 if (_isPointWithinBounds(localPosition)) {
//                   points.add(localPosition);
//                 }
//               });
//             },
//             onPanUpdate: (details) {
//               setState(() {
//                 RenderBox renderBox = context.findRenderObject() as RenderBox;
//                 Offset localPosition =
//                     renderBox.globalToLocal(details.globalPosition);
//                 if (_isPointWithinBounds(localPosition)) {
//                   points.add(localPosition);
//                 }
//               });
//             },
//             onPanEnd: (details) {
//               points.add(null); // Add a separator for lines
//               _updateImage();
//             },
//             child: CustomPaint(
//               size: Size(containerWidth, containerHeight),
//               painter: SignaturePainter(
//                   points, widget.paintColor, widget.paintWidth),
//             ),
//           ),
//         ),
//         SizedBox(height: widget.bottomSpacerHeight), // Customizable spacer
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               points.clear(); // Clear the signature
//               _updateImage();
//             });
//           },
//           style: widget.buttonStyle ??
//               ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey.shade200,
//               ),
//           child: widget.buttonTextWidget ??
//               Text(
//                 'Clear Signature',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ), // Apply custom button text style
//               ),
//         ),
//       ],
//     );
//   }

//   bool _isPointWithinBounds(Offset point) {
//     return point.dx >= 0 &&
//         point.dx <= containerWidth &&
//         point.dy >= 0 &&
//         point.dy <= containerHeight;
//   }

//   void _updateImage() async {
//     final recorder = ui.PictureRecorder();
//     final canvas = Canvas(recorder);
//     final paint = Paint()
//       ..color = widget.paintColor
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = widget.paintWidth; // Customizable paint width

//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i]!, points[i + 1]!, paint);
//       }
//     }

//     final picture = recorder.endRecording();
//     final img =
//         await picture.toImage(containerWidth.toInt(), containerHeight.toInt());
//     widget.onChanged?.call(img); // Call the onChanged function with the image
//   }
// }

// class SignaturePainter extends CustomPainter {
//   final List<Offset?> points;
//   final Color paintColor;
//   final double paintWidth;

//   SignaturePainter(this.points, this.paintColor, this.paintWidth);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = paintColor
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = paintWidth; // Customizable paint width

//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i]!, points[i + 1]!, paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(SignaturePainter oldDelegate) => true;
// }

/** ************************************************** **************************************************
 The widget `MyCustomFormSignatureInput` allows users to draw a signature on the screen, and it uses a `CustomPainter` to render the drawing based on touch input. When the drawing is updated, the widget calls the `onChanged` callback with an `ui.Image` instance representing the signature.

### What is Returned from the Widget

1. **Type of Return Value**: The widget returns an instance of `ui.Image` through the `onChanged` callback whenever the signature is drawn or updated.
2. **Data Structure**: This `ui.Image` can be serialized and converted to a format suitable for storage.

### Storing the Returned Value

When considering how to store the returned signature image in a database, you have a few options:

#### 1. Store as an Image in Firebase Storage
- **Advantages**:
  - Efficient for images, as Firebase Storage is optimized for handling files.
  - Can retrieve the image easily through a URL for displaying in your app.
  - Useful if you need to maintain the original quality of the image.

- **Steps to Store**:
  1. Convert the `ui.Image` to a `ByteData`.
  2. Convert the `ByteData` to a `Uint8List`.
  3. Upload the `Uint8List` to Firebase Storage.
  4. Store the download URL in your Firestore database for easy retrieval.

```dart
void _uploadImage(ui.Image image) async {
  // Convert ui.Image to ByteData
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();

  // Upload to Firebase Storage
  Reference ref = FirebaseStorage.instance.ref().child("signatures/${DateTime.now().millisecondsSinceEpoch}.png");
  await ref.putData(pngBytes);

  // Get the download URL
  String downloadUrl = await ref.getDownloadURL();
  
  // Store the URL in Firestore or your database
  // Firestore.instance.collection('signatures').add({'url': downloadUrl});
}
```

#### 2. Render Using Flutter Paint Feature
- **Advantages**:
  - You can recreate the drawing using the saved points rather than storing a bitmap.
  - This approach can reduce storage needs if the signature is simple and can be represented as vector data.

- **Steps to Store**:
  1. Store the list of points (`List<Offset?> points`) instead of an image.
  2. Convert these points to a format suitable for storage (e.g., JSON).

```dart
void _storePoints() {
  // Convert points to a list of positions
  List<Map<String, double?>> pointsData = points.map((point) {
    return {
      'dx': point?.dx,
      'dy': point?.dy,
    };
  }).toList();

  // Store points in Firestore or your database
  // Firestore.instance.collection('signatures').add({'points': pointsData});
}
```

### Conclusion
- **Image Storage**: If maintaining the original signature's appearance is essential, storing it as an image in Firebase Storage is recommended.
- **Points Storage**: If you wish to reconstruct the signature later and want to minimize storage usage, you can store the points and recreate the drawing in the app using Flutter's painting capabilities.

Choose the option that best fits your application's requirements!
************************************************** ************************************************** */
