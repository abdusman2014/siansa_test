import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/desktop/admin/home/desktop_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/shared_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/tablet/admin/home/tablet_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/web/admin/home/web_admin_home_screen.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

class CoreAdminHomeScreen extends StatelessWidget {
  const CoreAdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return const SharedAdminHomeScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return const MobileAdminHomeScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return const TabletAdminHomeScreen();
    // } else {
    //   if (kIsWeb) {
    //     return const WebAdminHomeScreen();
    //   } else {
    //     return const DesktopAdminHomeScreen();
    //   }
    // }
  }
}
