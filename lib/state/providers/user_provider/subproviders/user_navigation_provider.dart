import 'package:flutter/material.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';

class UserNavigationProvider {
  final UserProvider _userProvider;

  UserNavigationProvider(this._userProvider);

  Future<void> navigateBasedOnRole({
    required BuildContext context,
  }) async {
    //
  }
}
