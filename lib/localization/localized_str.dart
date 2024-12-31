import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizedStr {
  static String get(context, String stringText) {
    final localizations = AppLocalizations.of(context);

    // If localizations is null, return the original stringText
    if (localizations == null) return stringText;

    // Try to get the string dynamically using reflection
    final localizedString = _getLocalizedString(localizations, stringText);

    // Return the localized string if found, otherwise return the original stringText
    return localizedString ?? stringText;
  }

  // Helper method to dynamically access localized strings
  static String? _getLocalizedString(
      AppLocalizations localizations, String key) {
    // Using reflection to call the appropriate getter method based on the key
    switch (key) {
      case 'home':
        return localizations.homeTXT;
      case 'yes':
        return localizations.yesTXT;
      case 'no':
        return localizations.noTXT;
      case 'monthly':
        return localizations.monthlyTXT;
      case 'biweekly':
        return localizations.biweeklyTXT;
      case 'weekly':
        return localizations.weeklyTXT;
      // Add more cases for other keys as needed
      default:
        return null; // Return null if the key is not found
    }
  }
}

// USAGE:
// Text(LocalizedStr.get(context, 'home')),