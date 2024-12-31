import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/navigation/helpers/get_screen_widget_helper.dart';
import 'package:siansa_app/state/providers/app_versions_provider/app_versions_provider.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/ui/screens/core/admin/core_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/core/client/home/core_client_home_screen.dart';
import 'package:siansa_app/ui/screens/core/common/auth/core_common_auth_login_screen.dart';
import 'package:siansa_app/ui/screens/core/engineer/home/core_engineer_home_screen.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({super.key});

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  late UserProvider _userProvider;
  late AppVersionsProvider _appVersionsProvider;

  // Parsed URL
  late Uri uri;

  @override
  void initState() {
    super.initState();

    // Initialize providers
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _appVersionsProvider =
        Provider.of<AppVersionsProvider>(context, listen: false);

    // Parse the current URL
    uri = Uri.base;
  }

  @override
  Widget build(BuildContext context) {
    // Check for app update (non-web)
    if (!kIsWeb) {
      _appVersionsProvider.checkForUpdate(context);
    }

    // Handle user authentication
    if (_userProvider.getAuthUser != null) {
      return _getHomeScreen(_userProvider.getAuthUserRoleId);
    } else {
      return const CoreCommonAuthLoginScreen();
    }
  }

  Widget _getHomeScreen(String? userRoleId) {
    return GetScreenWidgetHelper.homeScreenWidgetByUserRoleId(userRoleId);
  }
}

class DefaultHomeScreen extends StatelessWidget {
  const DefaultHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text(
          'Default Home Screen (Unknown User Role)',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
