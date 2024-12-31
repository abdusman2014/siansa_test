import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';

class GetRouteHelper {
  static String homeScreenRouteByUserRoleId(String? userRoleId) {
    switch (userRoleId) {
      // case UserRoleIdsConstants.GUEST_ROLE_ID:
      //   return RoutesConstants.GUEST_ROUTE;
      case UserRoleIdsConstants.CLIENT_ROLE_ID:
        return RoutesConstants.CLIENT_ROUTE;
      case UserRoleIdsConstants.ENGINEER_ROLE_ID:
        return RoutesConstants.ENGINEER_ROUTE;
      case UserRoleIdsConstants.ADMIN_ROLE_ID:
        return RoutesConstants.ADMIN_ROUTE;
      case UserRoleIdsConstants.DEVELOPER_ROLE_ID:
        return RoutesConstants.ADMIN_ROUTE;
      default:
        return RoutesConstants.NOT_FOUND_404_ROUTE;
    }
  }
}
