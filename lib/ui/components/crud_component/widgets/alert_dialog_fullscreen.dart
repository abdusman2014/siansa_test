import 'package:flutter/material.dart';

class AlertDialogFullscreen extends StatelessWidget {
  final String titleText;
  final Widget? titleTextWidget;
  final Widget? contentWidget;

  const AlertDialogFullscreen({
    Key? key,
    this.titleText = 'Full Screen Alert Dialog Title',
    this.titleTextWidget,
    this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero, // Remove padding around the dialog
      child: Container(
        // padding: EdgeInsets.all(10),
        color: Colors.grey.shade200,
        width: MediaQuery.of(context).size.width, // Full width
        height: MediaQuery.of(context).size.height, // Full height
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: titleTextWidget ??
                Text(
                  titleText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
            automaticallyImplyLeading: false, // Hides the default back button
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
            ],
          ),
          body: contentWidget ??
              const Center(
                child: Text("Full-screen alert dialog content here"),
              ),
        ),
      ),
    );

    //     return AlertDialog(
    //       contentPadding: EdgeInsets.all(0),
    //       actionsPadding: EdgeInsets.only(bottom: 10, right: 10),
    //       backgroundColor: Colors.grey.shade200,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(4),
    //       ),
    //       // title: const Text('Filter Search'),
    //       content: const CrudCreateComponent(
    //         title: "Create",
    //       ),
    //       // actions: [
    //       //   TextButton(
    //       //     child: Text('APPLY'),
    //       //     onPressed: () {
    //       //       Navigator.of(context).pop(); // Dismiss the dialog
    //       //     },
    //       //   ),
    //       // ],
    //     );
  }
}
