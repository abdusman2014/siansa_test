import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetLocalizedStr {
  static String home(BuildContext context) =>
      AppLocalizations.of(context)!.homeTXT;

  static String yes(BuildContext context) =>
      AppLocalizations.of(context)!.yesTXT;

  static String no(BuildContext context) => AppLocalizations.of(context)!.noTXT;
}

// USAGE:
// Text(GetLocalizedStr.home(context)),