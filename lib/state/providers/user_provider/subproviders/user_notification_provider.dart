import 'package:flutter/material.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';

class UserNotificationProvider {
  final UserProvider _userProvider;

  UserNotificationProvider(this._userProvider);

  Future<void> loadUserNotifications({
    required BuildContext context,
  }) async {
    //
  }
}
