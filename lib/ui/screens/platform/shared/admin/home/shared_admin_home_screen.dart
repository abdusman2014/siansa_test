import 'package:flutter/material.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/data/app/app_data.dart';
import 'package:siansa_app/models/app/user_model.dart';
import 'package:siansa_app/resources/assets_manager.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/ui/components/admin_dashboard_component/admin_dashboard_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_equipment_categories_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_equipment_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_equipment_subcategories_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_report_categories_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_report_pdf_templates_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_report_statuses_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_report_subcategories_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_report_templates_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_reports_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_user_permissions_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_user_roles_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/components/crud_users_component.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_confirmation_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SharedAdminHomeScreen extends StatefulWidget {
  const SharedAdminHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SharedAdminHomeScreenState createState() => _SharedAdminHomeScreenState();
}

class _SharedAdminHomeScreenState extends State<SharedAdminHomeScreen> {
  UserModel? _authUser;
  String? _authUserId;
  String? _authUserRoleId;
  Widget? _contentWidget;

  late final Function _signOut;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   // Initialize _authUser and _authUserRoleId from UserProvider
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);

  //   setState(() {
  //     _authUser = userProvider.getAuthUser;
  //     _authUserId = userProvider.getAuthUserId;
  //     _authUserRoleId = userProvider.getAuthUserRoleId;
  //   });

  //   _signOut = () async {
  //     await userProvider.auth.signOut(context);
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    // Providers
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // _authUser = userProvider.getAuthUser;
    // _authUserId = userProvider.getAuthUserId;
    // _authUserRoleId = userProvider.getAuthUserRoleId;

    // debugPrint('SharedAdminHomeScreen ----------------------------->');
    // debugPrint('User ID: $_authUser');
    // debugPrint('UserRole ID: $_authUserId');
    // debugPrint('$_authUserRoleId');

    return AdminDashboardComponent(
      sidebarLogoSrc: ImageAssets.companyLogo,
      sidebarData: AppData.appAdminSidebarData,
      onMenuClick: (String route) async {
        debugPrint('ROUTE: $route');

        if (route == AdminRoutesConstants.HOME_ADMIN_ROUTE) {
          _contentWidget = const Center(child: Text('-'));
        }

        if (route == AdminRoutesConstants.ALL_USERS_ADMIN_ROUTE) {
          _contentWidget = CRUDUsersComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.USER_ROLES_ADMIN_ROUTE) {
          _contentWidget = CRUDUserRolesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.USER_PERMISSIONS_ADMIN_ROUTE) {
          _contentWidget = CRUDUserPermissionsComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }

        if (route == AdminRoutesConstants.ALL_EQUIPMENT_ADMIN_ROUTE) {
          _contentWidget = CRUDEquipmentComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.EQUIPMENT_CATEGORIES_ADMIN_ROUTE) {
          _contentWidget = CRUDEquipmentCategoriesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.EQUIPMENT_SUBCATEGORIES_ADMIN_ROUTE) {
          _contentWidget = CRUDEquipmentSubcategoriesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }

        if (route == AdminRoutesConstants.ALL_REPORTS_ADMIN_ROUTE) {
          _contentWidget = CRUDReportsComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.REPORT_CATEGORIES_ADMIN_ROUTE) {
          _contentWidget = CRUDReportCategoriesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.REPORT_SUBCATEGORIES_ADMIN_ROUTE) {
          _contentWidget = CRUDReportSubcategoriesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.REPORT_STATUSES_ADMIN_ROUTE) {
          _contentWidget = CRUDReportStatusesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.REPORT_TEMPLATES_ADMIN_ROUTE) {
          _contentWidget = CRUDReportTemplatesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }
        if (route == AdminRoutesConstants.REPORT_PDF_TEMPLATES_ADMIN_ROUTE) {
          _contentWidget = CRUDReportPDFTemplatesComponent(
            // authUserRoleId: _authUserRoleId,
            authUserRoleId: userProvider.getAuthUserRoleId,
          );
        }

        if (route == AdminRoutesConstants.SETTINGS_ADMIN_ROUTE) {
          //
        }

        setState(() {
          _contentWidget = _contentWidget;
        });
      },
      contentWidget: _contentWidget ??
          const Center(
            child: Text('No Content Widget Found'),
          ),
      onClickSignOut: () {
        appConfirmationDialog(
          context: context,
          title: AppLocalizations.of(context)!.signOutTXT,
          text: AppLocalizations.of(context)!.areYouSureYouWantToLogOutTXT,
          confirmText: AppLocalizations.of(context)!.yesTXT,
          onConfirm: () async {
            // await _signOut();
            await userProvider.auth.signOut(context);
            context.go('/');
          },
        );
      },
    );
  }
}

// --------------------------------------------------
