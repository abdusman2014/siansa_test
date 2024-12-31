import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void prettyPrintMap(Map<String, dynamic> map) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(map);
  print(prettyPrint);
}

String toTitleCase(String text) {
  return text
      .trim()
      .split(' ')
      .map((word) => word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '')
      .join(' ');
}

Widget displayParagraph(String text) {
  // Adding two newlines after every period
  String formattedText = text.replaceAll('. ', '.\n\n');

  return Text(
    formattedText,
    style: const TextStyle(
      fontSize: 13.0, // Adjust the font size as needed
      color: Colors.black,
      height: 1.5, // Adjust line height for better readability
    ),
    textAlign: TextAlign.left, // Align text to the left
  );
}

String sanitizeJson(String jsonString) {
  return jsonString.replaceAll('NaN', 'null');
}

String extractSessionId(String checkoutUrl) {
  Uri uri = Uri.parse(checkoutUrl);
  String path = uri.path;
  RegExp regExp = RegExp(r'cs_test_[\w]+');
  Match? match = regExp.firstMatch(path);

  if (match != null) {
    return match.group(0) ?? '';
  } else {
    return '';
  }
}

Map<String, String?> extractIds(String text) {
  RegExp userIdRegExp = RegExp(r"user_id=([^?]+)");
  RegExp transactionIdRegExp = RegExp(r"transaction_Id=(\d+)");

  String? userId = userIdRegExp.firstMatch(text)?.group(1);
  String? transactionId = transactionIdRegExp.firstMatch(text)?.group(1);

  return {
    'user_id': userId,
    'transaction_Id': transactionId,
  };
}

String formatDate(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat('MMM d, y').format(date);
}

String getFirstChar(String input) {
  if (input.isEmpty) {
    return "#";
  }
  return input[0];
}

bool isWellFormedUrl(String url) {
  return Uri.tryParse(url)?.hasAbsolutePath ?? false;
}

String removeFirstWord(String sentence) {
  List<String> words = sentence.split(' '); // Split the sentence into words
  if (words.isNotEmpty) {
    // Check if there are any words to remove
    words.removeAt(0); // Remove the first word
    return words.join(' '); // Join the remaining words back into a sentence
  }
  return ''; // Return an empty string if there were no words
}

String getFirstWord(String sentence) {
  List<String> words = sentence.split(' '); // Split the sentence into words
  return words.isNotEmpty
      ? words.first
      : ''; // Return the first word or an empty string if none
}
