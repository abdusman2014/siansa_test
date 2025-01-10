import 'package:siansa_app/auth/authentication_wrapper.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/models/app/equipment_model.dart';
import 'package:siansa_app/ui/screens/core/admin/home/core_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/core/client/home/core_client_home_screen.dart';
import 'package:siansa_app/ui/screens/core/common/auth/core_common_auth_login_screen.dart';
import 'package:siansa_app/ui/screens/core/common/auth/core_common_auth_register_screen.dart';
import 'package:siansa_app/ui/screens/core/common/auth/core_common_auth_reset_password_screen.dart';
import 'package:siansa_app/ui/screens/core/common/examples/core_common_example_my_custom_form_screen.dart';
import 'package:siansa_app/ui/screens/core/common/examples/core_common_example_my_form_screen.dart';
import 'package:siansa_app/ui/screens/core/common/examples/core_common_example_my_page_slider_screen.dart';
import 'package:siansa_app/ui/screens/core/common/examples/core_common_example_my_timeline_pages_screen.dart';
import 'package:siansa_app/ui/screens/core/common/examples/core_common_example_my_timeline_screen.dart';
import 'package:siansa_app/ui/screens/core/common/examples/core_common_example_pagination_screen.dart';
import 'package:siansa_app/ui/screens/core/common/test/core_common_crud_test_screen.dart';
import 'package:siansa_app/ui/screens/core/common/test/core_common_pagination_test_screen.dart';
import 'package:siansa_app/ui/screens/core/common/test/core_common_test_screen.dart';
import 'package:siansa_app/ui/screens/core/engineer/home/core_engineer_home_screen.dart';
import 'package:siansa_app/ui/screens/core/common/route_not_found/core_common_route_not_found.dart';
import 'package:go_router/go_router.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/shared_admin_home_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/engineer/qr-code-scan/equipment%D9%80%D9%80_detail_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/engineer/qr-code-scan/equipment_id_screen.dart';
import 'package:siansa_app/ui/screens/platform/shared/engineer/qr-code-scan/shared_engineer_qr_code_scan_screen.dart';

final goRouter = GoRouter(
  routes: routes,
  initialLocation: RoutesConstants.LOGIN_ROUTE,
  // Use errorBuilder for non-existing routes
  errorBuilder: (context, state) => const CoreCommonRouteNotFoundScreen(),
);

final routes = [
  // **************************************************
  // Test and Example Screens at root '/'
  GoRoute(
    path: RoutesConstants.ROOT_ROUTE,
    builder: (context, state) =>
        // CoreCommonTestScreen(), // CoreCommonTestScreen()
        // const CoreCommonCRUDTestScreen(),
        // const CoreCommonPaginationTestScreen(),
        // CoreCommonExamplePaginationScreen(), // CoreCommonExamplePaginationScreen()
        CoreCommonExampleMyCustomFormScreen(), // CoreCommonExampleMyCustomFormScreen()
    // CoreCommonExampleMyFormScreen(), // CoreCommonExampleMyFormScreen()
    // CoreCommonExampleMyTimelineScreen(), //CoreCommonExampleMyTimelineScreen()
    // CoreCommonExampleMyTimelinePagesScreen(), //CoreCommonExampleMyTimelinePagesScreen()
    // CoreCommonExampleMyPageSliderScreen(), // CoreCommonExampleMyPageSliderScreen()
    // SharedAdminHomeScreen(), // SharedAdminHomeScreen()
  ),
  // **************************************************

  // ROOT ROUTE '/'

  GoRoute(
    path: RoutesConstants.ROOT_ROUTE,
    builder: (context, state) => const AuthenticationWrapper(),
  ),

  // AUTH ROUTES

  GoRoute(
    path: RoutesConstants.REGISTER_ROUTE,
    builder: (context, state) => const CoreCommonAuthRegisterScreen(),
  ),
  GoRoute(
    path: RoutesConstants.LOGIN_ROUTE,
    builder: (context, state) => const CoreCommonAuthLoginScreen(),
  ),
  GoRoute(
    path: RoutesConstants.FORGOT_PASSWORD_ROUTE,
    builder: (context, state) => const CoreCommonAuthResetPasswordScreen(),
  ),

  // USER ROLES ROUTES

  GoRoute(
    path: RoutesConstants.ENGINEER_ROUTE,
    builder: (context, state) => const CoreEngineerHomeScreen(),
  ),
  
  GoRoute(
    path: RoutesConstants.CLIENT_ROUTE,
    builder: (context, state) => const CoreClientHomeScreen(),
  ),
  GoRoute(
    path: RoutesConstants.ADMIN_ROUTE,
    builder: (context, state) => const CoreAdminHomeScreen(),
  ),

  //Engineer Equipment Routes

GoRoute(
    path: RoutesConstants.SHARED_ENGINEER_QR_CODE_SCAN_SCREEN,
    builder: (context, state) => const SharedEngineerQrCodeScanScreen(),
  ),
  GoRoute(
    path: RoutesConstants.EQUIPMENT_DETAIL_SCREEN,
    builder: (context, state) =>  EquipmentDetailScreen(data: state.extra! as EquipmentModel,),
  ),
  GoRoute(
    path: RoutesConstants.EQUIPMENT_ID_SCREEN,
    builder: (context, state) =>  EquipmentIdScreen(id: state.extra! as String,),
  ),
  // NOT FOUND 404 ROUTES

  GoRoute(
    path: RoutesConstants.ADMIN_ROUTE,
    builder: (context, state) => const CoreCommonRouteNotFoundScreen(),
  ),
];
