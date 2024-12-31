import 'package:flutter/material.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';

class UserStreamProvider {
  final UserProvider _userProvider;

  UserStreamProvider(this._userProvider);

  Future<void> initUserStream({
    required BuildContext context,
  }) async {
    //
  }
}
