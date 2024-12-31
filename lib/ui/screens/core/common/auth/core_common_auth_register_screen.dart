import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/shared/common/auth/shared_common_auth_register_screen.dart';

class CoreCommonAuthRegisterScreen extends StatelessWidget {
  const CoreCommonAuthRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return const SharedCommonAuthRegisterScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return MobileCommonAuthRegister();
    // } else if (Responsive.isTablet(context)) {
    //   return TabletCommonAuthRegister();
    // } else {
    //   if (kIsWeb) {
    //     return WebCommonAuthRegister();
    //   } else {
    //     return DesktopCommonAuthRegister();
    //   }
    // }
  }
}
