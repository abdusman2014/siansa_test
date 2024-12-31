import 'dart:io';

import 'package:siansa_app/state/repositories/app_versions_repository/app_versions_repository.dart';
import 'package:siansa_app/utilities/helpers/app_version.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_dialog_update_required.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pub_semver/pub_semver.dart';

class AppVersionsProvider with ChangeNotifier {
  String? _latestVersion;
  String? _androidUrl;
  String? _iOSUrl;
  bool? _shouldUpdate;

  String? get latestVersion => _latestVersion;
  String? get androidUrl => _androidUrl;
  String? get iOSUrl => _iOSUrl;
  bool? get shouldUpdate => _shouldUpdate;

  Future<bool?> _shouldUpdateApp() async {
    // bool shouldShowUpdateDialog = false;

    _latestVersion = '';
    _androidUrl = '';
    _iOSUrl = '';
    _shouldUpdate = false;

    Map shouldUpdateApp = await AppVersionsRepository().shouldUpdateApp();
    _latestVersion = shouldUpdateApp['version'] ?? "";

    String currentAppVersion = AppVersionHelper().get();

    if (shouldUpdateApp.containsKey('version') &&
        _latestVersion != "" &&
        Version.parse(_latestVersion!) > Version.parse(currentAppVersion)) {
      // print('versions are not the same');
      // print('current version: $currentAppVersion');
      // print('latest version: ' + shouldUpdateApp["version"]);

      _shouldUpdate = true;
      _iOSUrl = shouldUpdateApp['iOSUrl'];
      _androidUrl = shouldUpdateApp['androidUrl'];
      _latestVersion = shouldUpdateApp['version'];
    }

    return _shouldUpdate;
  }

  void checkForUpdate(BuildContext context) {
    if (!kIsWeb) {
      //_latestversion ==null means the update never checked before since the app is open
      // if (_latestVersion == null) {
      _shouldUpdateApp().then((value) {
        print("update: ${value!}");
        if (value) {
          showDialog(
            context: context,
            barrierDismissible:
                false, // Dialog cannot be dismissed by tapping outside
            builder: (BuildContext context) {
              return AppDialogUpdateRequired(
                url: Platform.isAndroid ? _androidUrl ?? "" : _iOSUrl ?? "",
              );
            },
          );
        }
      });
      // }
    }
  }

  void notifyListners() {
    notifyListeners();
  }
}
