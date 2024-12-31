import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/desktop/client/home/desktop_client_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/mobile/client/home/mobile_client_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/client/home/shared_client_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/tablet/client/home/tablet_client_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/web/client/home/web_client_home_screen.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

class CoreClientHomeScreen extends StatelessWidget {
  const CoreClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return SharedClientHomeScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return MobileClientHomeScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return TabletClientHomeScreen();
    // } else {
    //   if (kIsWeb) {
    //     return WebClientHomeScreen();
    //   } else {
    //     return DesktopClientHomeScreen();
    //   }
    // }
  }
}
