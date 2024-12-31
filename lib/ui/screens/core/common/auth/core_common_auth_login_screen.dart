import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/shared/common/auth/shared_common_auth_login_screen.dart';

class CoreCommonAuthLoginScreen extends StatelessWidget {
  const CoreCommonAuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return const SharedCommonAuthLoginScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return MobileCommonAuthLoginScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return TabletCommonAuthLoginScreen();
    // } else {
    //   if (kIsWeb) {
    //     return WebCommonAuthLoginScreen();
    //   } else {
    //     return DesktopCommonAuthLoginScreen();
    //   }
    // }
  }
}
