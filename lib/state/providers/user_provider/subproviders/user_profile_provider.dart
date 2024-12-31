import 'package:flutter/foundation.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';

class UserProfileProvider with ChangeNotifier {
  final UserProvider userProvider;

  UserProfileProvider(this.userProvider);

  String get currentUserRoleId =>
      userProvider.getAuthUserRoleId!; // Accessing userRole directly

  // **************************************************

  // Example method to read user profile
  Future<void> read() async {
    // Implement read logic
    notifyListeners(); // Notify any listeners after a change
  }

  // Add more profile-related methods as needed
}
