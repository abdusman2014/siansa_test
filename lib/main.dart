import 'package:siansa_app/firebase_options.dart';
import 'package:siansa_app/l10n/l10n.dart';
import 'package:siansa_app/state/providers/app_versions_provider/app_versions_provider.dart';
import 'package:siansa_app/state/providers/crud_provider.dart';
import 'package:siansa_app/state/providers/crud_sub_provider.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/equipment_category_provider.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/subproviders/equipment_category_crud_provider.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/subproviders/equipment_category_pagination_provider.dart';
import 'package:siansa_app/state/providers/equipment_provider/equipment_provider.dart';
import 'package:siansa_app/state/providers/equipment_provider/subproviders/equipment_crud_provider.dart';
import 'package:siansa_app/state/providers/equipment_provider/subproviders/equipment_pagination_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/equipment_subcategory_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/subproviders/equipment_subcategory_crud_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/subproviders/equipment_subcategory_pagination_provider.dart';
import 'package:siansa_app/state/providers/pagination_provider.dart';
import 'package:siansa_app/state/providers/pagination_sub_provider.dart';
import 'package:siansa_app/state/providers/report_category_provider/subproviders/report_category_crud_provider.dart';
import 'package:siansa_app/state/providers/report_category_provider/subproviders/report_category_pagination_provider.dart';
import 'package:siansa_app/state/providers/report_category_provider/report_category_provider.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/subproviders/report_pdf_template_crud_provider.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/subproviders/report_pdf_template_pagination_provider.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/report_pdf_template_provider.dart';
import 'package:siansa_app/state/providers/report_provider/subproviders/report_crud_provider.dart';
import 'package:siansa_app/state/providers/report_provider/subproviders/report_pagination_provider.dart';
import 'package:siansa_app/state/providers/report_provider/report_provider.dart';
import 'package:siansa_app/state/providers/report_status_provider/subproviders/report_status_crud_provider.dart';
import 'package:siansa_app/state/providers/report_status_provider/subproviders/report_status_pagination_provider.dart';
import 'package:siansa_app/state/providers/report_status_provider/report_status_provider.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/subproviders/report_subcategory_crud_provider.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/subproviders/report_subcategory_pagination_provider.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/report_subcategory_provider.dart';
import 'package:siansa_app/state/providers/report_template_provider/subproviders/report_template_crud_provider.dart';
import 'package:siansa_app/state/providers/report_template_provider/subproviders/report_template_pagination_provider.dart';
import 'package:siansa_app/state/providers/report_template_provider/report_template_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/subproviders/user_permission_crud_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/subproviders/user_permission_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/user_permission_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_auth_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_crud_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_profile_provider.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/resources/theme_manager.dart';
import 'package:siansa_app/navigation/generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/subproviders/user_role_crud_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/subproviders/user_role_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/user_role_provider.dart';
import 'package:siansa_app/ui/screens/core/common/test/core_common_test_screen.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setPathUrlStrategy();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final appcastURL =
    //     'https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml';
    // final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android']);

    return MultiProvider(
      providers: [
        // --------------------------------------------------
        ChangeNotifierProvider(create: (context) => CRUDProvider()),
        ChangeNotifierProvider(
          // create: (context) => CRUDSubProvider(CRUDProvider()),
          // create: (context) => CRUDSubProvider(
          //   Provider.of<CRUDProvider>(context, listen: false),
          // ),
          create: (context) => CRUDSubProvider(context.read<CRUDProvider>()),
        ),

        // ChangeNotifierProvider(
        //   create: (context) => CRUDSubProvider(Provider.of<CRUDProvider>(
        //     context,
        //     listen: false,
        //   )),
        // ),

        // // - ChangeNotifierProxyProvider ensures that the child has the updated instance of the parent provider.
        // ChangeNotifierProxyProvider<CRUDProvider, CRUDSubProvider>(
        //   create: (_) =>
        //       CRUDSubProvider(Provider.of<CRUDProvider>(_, listen: false)),
        //   update: (_, crudProvider, crudSubProvider) =>
        //       CRUDSubProvider(crudProvider),
        // ),

        // --------------------------------------------------
        // PAGINATION PROVIDER
        ChangeNotifierProvider(create: (context) => PaginationProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                PaginationSubProvider(context.read<PaginationProvider>())),
        // --------------------------------------------------
        // USER PROVIDER
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(
          create: (context) => UserAuthProvider(Provider.of<UserProvider>(
            context,
            listen: false,
          )),
        ),
        ChangeNotifierProvider(
          create: (context) => UserCRUDProvider(Provider.of<UserProvider>(
            context,
            listen: false,
          )),
        ),
        ChangeNotifierProvider(
          // create: (context) => UserPaginationProvider(Provider.of<UserProvider>(
          //   context,
          //   listen: false,
          // )),
          create: (context) =>
              UserPaginationProvider(context.read<UserProvider>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProfileProvider(Provider.of<UserProvider>(
            context,
            listen: false,
          )),
        ),
        //
        // // - ChangeNotifierProxyProvider ensures that the child has the updated instance of the parent provider.
        // ChangeNotifierProxyProvider<UserProvider, UserAuthProvider>(
        //   create: (_) =>
        //       UserAuthProvider(Provider.of<UserProvider>(_, listen: false)),
        //   update: (_, userProvider, userAuthProvider) =>
        //       UserAuthProvider(userProvider),
        // ),
        // --------------------------------------------------
        // USER ROLE PROVIDER
        ChangeNotifierProvider(create: (context) => UserRoleProvider()),
        ChangeNotifierProvider(
          create: (context) => UserRoleCRUDProvider(
              Provider.of<UserRoleProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              UserRolePaginationProvider(context.read<UserRoleProvider>()),
        ),
        // --------------------------------------------------
        // USER PERMISSION PROVIDER
        ChangeNotifierProvider(create: (context) => UserPermissionProvider()),
        ChangeNotifierProvider(
          create: (context) => UserPermissionCRUDProvider(
              Provider.of<UserPermissionProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => UserPermissionPaginationProvider(
              context.read<UserPermissionProvider>()),
        ),
        // --------------------------------------------------
        // EQUIPMENT PROVIDER
        ChangeNotifierProvider(create: (context) => EquipmentProvider()),
        ChangeNotifierProvider(
          create: (context) => EquipmentCRUDProvider(
              Provider.of<EquipmentProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              EquipmentPaginationProvider(context.read<EquipmentProvider>()),
        ),
        // --------------------------------------------------
        // EQUIPMENT CATEGORY PROVIDER
        ChangeNotifierProvider(
            create: (context) => EquipmentCategoryProvider()),
        ChangeNotifierProvider(
          create: (context) => EquipmentCategoryCRUDProvider(
              Provider.of<EquipmentCategoryProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => EquipmentCategoryPaginationProvider(
              context.read<EquipmentCategoryProvider>()),
        ),
        // --------------------------------------------------
        // EQUIPMENT SUBCATEGORY PROVIDER
        ChangeNotifierProvider(
            create: (context) => EquipmentSubcategoryProvider()),
        ChangeNotifierProvider(
          create: (context) => EquipmentSubcategoryCRUDProvider(
              Provider.of<EquipmentSubcategoryProvider>(context,
                  listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => EquipmentSubcategoryPaginationProvider(
              context.read<EquipmentSubcategoryProvider>()),
        ),
        // --------------------------------------------------
        // REPORT PROVIDER
        ChangeNotifierProvider(create: (context) => ReportProvider()),
        ChangeNotifierProvider(
          create: (context) => ReportCRUDProvider(
              Provider.of<ReportProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ReportPaginationProvider(context.read<ReportProvider>()),
        ),
        // --------------------------------------------------
        // REPORT CATEGORY PROVIDER
        ChangeNotifierProvider(create: (context) => ReportCategoryProvider()),
        ChangeNotifierProvider(
          create: (context) => ReportCategoryCRUDProvider(
              Provider.of<ReportCategoryProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportCategoryPaginationProvider(
              context.read<ReportCategoryProvider>()),
        ),
        // --------------------------------------------------
        // REPORT SUBCATEGORY PROVIDER
        ChangeNotifierProvider(
            create: (context) => ReportSubcategoryProvider()),
        ChangeNotifierProvider(
          create: (context) => ReportSubcategoryCRUDProvider(
              Provider.of<ReportSubcategoryProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportSubcategoryPaginationProvider(
              context.read<ReportSubcategoryProvider>()),
        ),
        // --------------------------------------------------
        // REPORT STATUS PROVIDER
        ChangeNotifierProvider(create: (context) => ReportStatusProvider()),
        ChangeNotifierProvider(
          create: (context) => ReportStatusCRUDProvider(
              Provider.of<ReportStatusProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportStatusPaginationProvider(
              context.read<ReportStatusProvider>()),
        ),
        // --------------------------------------------------
        // REPORT TEMPLATE PROVIDER
        ChangeNotifierProvider(create: (context) => ReportTemplateProvider()),
        ChangeNotifierProvider(
          create: (context) => ReportTemplateCRUDProvider(
              Provider.of<ReportTemplateProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportTemplatePaginationProvider(
              context.read<ReportTemplateProvider>()),
        ),
        // --------------------------------------------------
        // REPORT PDF TEMPLATE PROVIDER
        ChangeNotifierProvider(
            create: (context) => ReportPDFTemplateProvider()),
        ChangeNotifierProvider(
          create: (context) => ReportPDFTemplateCRUDProvider(
              Provider.of<ReportPDFTemplateProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportPDFTemplatePaginationProvider(
              context.read<ReportPDFTemplateProvider>()),
        ),
        // --------------------------------------------------
        // APP VERSIONS PROVIDER
        ChangeNotifierProvider(create: (context) => AppVersionsProvider()),
      ],
      child: UpgradeAlert(
        upgrader: Upgrader(
          // durationUntilAlertAgain: Duration(seconds: 2),
          // debugDisplayAlways: true,
          // debugLogging: true,
          showIgnore: false,
          showLater: false,
        ),
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: "Siansa",
              debugShowCheckedModeBanner: false,
              // LOCALIZATION
              // - Manually set a locale:
              // locale: const Locale('es'),
              // - supportedLocales, if they match the phone's locale,
              // flutter automatically use the language for the given delegates.
              // If they don't match the phone's locale, default locale will be 'en'.
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              //
              builder: EasyLoading.init(),
              theme: getApplicationTheme(),
              routerConfig: goRouter,
              // home: AuthenticationWrapper(),
              // onGenerateRoute: generateRoute,
              //  initialRoute: "/",
              // navigatorKey: navigatorKey,
            );
          },
        ),
      ),
    );
  }
}
