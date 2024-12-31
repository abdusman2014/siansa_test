import 'package:flutter/material.dart';
import 'package:siansa_app/auth/authentication_wrapper.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/ui/screens/core/admin/home/core_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/core/client/home/core_client_home_screen.dart';
import 'package:siansa_app/ui/screens/core/engineer/home/core_engineer_home_screen.dart';

class GetScreenWidgetHelper {
  static Widget homeScreenWidgetByUserRoleId(String? userRoleId) {
    switch (userRoleId) {
      case UserRoleIdsConstants.CLIENT_ROLE_ID:
        return const CoreClientHomeScreen();
      case UserRoleIdsConstants.ENGINEER_ROLE_ID:
        return const CoreEngineerHomeScreen();
      case UserRoleIdsConstants.ADMIN_ROLE_ID:
        return const CoreAdminHomeScreen();
      case UserRoleIdsConstants.DEVELOPER_ROLE_ID:
        return const CoreAdminHomeScreen();
      default:
        return const DefaultHomeScreen();
      // return const CoreCommonAuthLoginScreen();
    }
  }
}
