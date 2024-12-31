import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/desktop/common/demo/desktop_common_demo_screen.dart';
import 'package:siansa_app/ui/screens/platform/mobile/common/demo/mobile_common_demo_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/common/demo/shared_common_demo_screen.dart';
import 'package:siansa_app/ui/screens/platform/tablet/common/demo/tablet_common_demo_screen.dart';
import 'package:siansa_app/ui/screens/platform/web/common/demo/web_common_demo_screen.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

class CoreCommonDemoScreen extends StatelessWidget {
  const CoreCommonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return const SharedCommonDemoScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return const MobileCommonDemoScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return const TabletCommonDemoScreen();
    // } else {
    //   if (kIsWeb) {
    //     return const WebCommonDemoScreen();
    //   } else {
    //     return const DesktopCommonDemoScreen();
    //   }
    // }
  }
}
