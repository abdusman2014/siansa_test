import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

// bool isIOS() => !kIsWeb && Platform.isIOS;
bool isIOS() {
  if (kIsWeb) {
    return false; // or handle web-specific logic
  }
  // If not web, you can safely use Platform.isIOS
  return Platform.isIOS;
}

// bool isAndroid() => !kIsWeb && Platform.isAndroid;
bool isAndroid() {
  if (kIsWeb) {
    return false; // or handle web-specific logic
  }
  // If not web, you can safely use Platform.isAndroid
  return Platform.isAndroid;
}

bool isWeb() => kIsWeb;

bool isDesktop() =>
    !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

bool isMacOS() => !kIsWeb && Platform.isMacOS;

bool isWindows() => !kIsWeb && Platform.isWindows;
