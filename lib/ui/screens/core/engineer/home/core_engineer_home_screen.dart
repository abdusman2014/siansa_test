import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/desktop/engineer/home/desktop_engineer_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/mobile/engineer/home/mobile_engineer_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/engineer/home/shared_engineer_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/tablet/engineer/home/tablet_engineer_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/web/engineer/home/web_engineer_home_screen.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

class CoreEngineerHomeScreen extends StatelessWidget {
  const CoreEngineerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return SharedEngineerHomeScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return MobileEngineerHomeScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return TabletEngineerHomeScreen();
    // } else {
    //   if (kIsWeb) {
    //     return WebEngineerHomeScreen();
    //   } else {
    //     return DesktopEngineerHomeScreen();
    //   }
    // }
  }
}
