import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/shared/common/auth/shared_common_auth_reset_password_screen.dart';

class CoreCommonAuthResetPasswordScreen extends StatelessWidget {
  const CoreCommonAuthResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return const SharedCommonAuthResetPasswordScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return MobileCommonAuthResetPassword();
    // } else if (Responsive.isTablet(context)) {
    //   return TabletCommonAuthResetPassword();
    // } else {
    //   if (kIsWeb) {
    //     return WebCommonAuthResetPassword();
    //   } else {
    //     return DesktopCommonAuthResetPassword();
    //   }
    // }
  }
}
