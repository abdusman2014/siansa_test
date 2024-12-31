import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProviderUtils {
  // **************************************************
  // LOADING FEEDBACK
  // **************************************************

  // Function to handle loading states
  static void showLoading(
    BuildContext context, {
    String text = '',
  }) {
    EasyLoading.show(
      status: text,
      maskType: EasyLoadingMaskType.black,
    );
  }

  // Function to hide loading states
  static void hideLoading() {
    EasyLoading.dismiss();
  }

  // **************************************************
  // ERROR FEEDBACK
  // **************************************************

  // Function to handle error messages
  static void showError(BuildContext context, String message) {
    EasyLoading.dismiss();
    EasyLoading.showError(
      message.toString(),
      duration: const Duration(seconds: 3),
    );
  }

  // **************************************************
  // ALERTS FEEDBACK
  // **************************************************

  static void showAlertDialogMessage({
    required BuildContext context,
    Widget? titleIconWidget,
    Widget? contentIconWidget,
    String title = 'Title',
    String content = 'Message here...',
    String buttonText = 'OK',
    bool shouldShowTitle = true,
    bool shouldShowMessage = true,
    bool shouldShowButton = true,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding: const EdgeInsets.only(top: 30, bottom: 30),
          title: !shouldShowTitle
              ? null
              : Row(
                  children: [
                    if (titleIconWidget != null) ...[
                      titleIconWidget,
                      const SizedBox(width: 8),
                    ],
                    Text(title),
                  ],
                ),
          content: !shouldShowMessage
              ? null
              : IntrinsicHeight(
                  // Wrap Column with IntrinsicHeight
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Prevents it from expanding
                    children: [
                      if (contentIconWidget != null) ...[
                        contentIconWidget,
                        const SizedBox(height: 8),
                      ],
                      Text(
                        content,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
          actions: !shouldShowButton
              ? null
              : [
                  Center(
                    child: TextButton(
                      child: Text(buttonText),
                      onPressed: () {
                        Navigator.of(context).pop(); // Dismiss the dialog
                      },
                    ),
                  ),
                ],
        );
      },
    );
  }

  static void showNoResultsAlert(BuildContext context) {
    showAlertDialogMessage(
      context: context,
      // titleIconWidget:
      //     const Icon(Icons.info_outline_rounded, color: Colors.black, size: 40),
      contentIconWidget:
          const Icon(Icons.info_outline_rounded, color: Colors.grey, size: 40),
      title: 'No Results',
      content: 'No results were found',
      // buttonText: 'Accept',
      shouldShowTitle: false,
      shouldShowMessage: true,
      shouldShowButton: true,
    );
  }

  // **************************************************
  // CONVERSIONS
  // **************************************************

  List<T> convertMapsListToModelsList<T>(
    List<Map<String, dynamic>> mapList,
    T Function(Map<String, dynamic>) fromMapFunction,
  ) {
    return mapList.map((map) => fromMapFunction(map)).toList();
  }

  List<Map<String, dynamic>> convertModelsListToMapsList<T>(
    List<T> models,
    Map<String, dynamic> Function(T) toMapFunction,
  ) {
    return models.map((model) => toMapFunction(model)).toList();
  }
}
