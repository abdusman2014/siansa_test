import 'package:flutter/material.dart';
import 'package:siansa_app/ui/screens/platform/shared/common/route_not_found/shared_common_route_not_found.dart';

class CoreCommonRouteNotFoundScreen extends StatelessWidget {
  const CoreCommonRouteNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform + UserRole + Feature Name + Screen

    // If screen is responsive, then:
    return const SharedCommonRouteNotFoundScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return const MobileCommonRouteNotFoundScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return const TabletCommonRouteNotFoundScreen();
    // } else {
    //   if (kIsWeb) {
    //     return const WebCommonRouteNotFoundScreen();
    //   } else {
    //     return const DesktopCommonRouteNotFoundScreen();
    //   }
    // }
  }
}
