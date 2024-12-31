// ignore_for_file: constant_identifier_names

class RoutesConstants {
  // INITIAL ROUTES

  static const String ROOT_ROUTE = "/";
  static const String HOME_DEMO_ROUTE = "/home-demo";

  static const String ONBOARDING_ROUTE = "/onboarding";
  static const String LANDING_ROUTE = "/landing";

  // AUTH ROUTES

  static const String REGISTER_ROUTE = "/register";
  static const String LOGIN_ROUTE = "/login";
  static const String FORGOT_PASSWORD_ROUTE = "/forgot-password";

  // USER ROLES ROUTES

  static const String ENGINEER_ROUTE = "/engineer";
  static const String ENGINEER_HOME_ROUTE = "/engineer-home";

  static const String CLIENT_ROUTE = "/client";
  static const String CLIENT_HOME_ROUTE = "/client-home";

  static const String ADMIN_ROUTE = "/admin";
  static const String ADMIN_HOME_ROUTE = "/admin-home";

  // NOT FOUND ROUTES

  static const String NOT_FOUND_404_ROUTE = "/not-found-404";
}

class AdminRoutesConstants {
  static const String HOME_ADMIN_ROUTE = "/admin-home";

  static const String USERS_ADMIN_ROUTE = "/admin-users";
  static const String ALL_USERS_ADMIN_ROUTE = "/admin-all-users";
  static const String USER_PERMISSIONS_ADMIN_ROUTE = "/admin-user-permissions";
  static const String USER_ROLES_ADMIN_ROUTE = "/admin-user-roles";

  static const String EQUIPMENT_ADMIN_ROUTE = "/admin-equipment";
  static const String ALL_EQUIPMENT_ADMIN_ROUTE = "/admin-all-equipment";
  static const String EQUIPMENT_CATEGORIES_ADMIN_ROUTE =
      "/admin-equipment-categories";
  static const String EQUIPMENT_SUBCATEGORIES_ADMIN_ROUTE =
      "/admin-equipment-subcategories";

  static const String REPORTS_ADMIN_ROUTE = "/admin-reports";
  static const String ALL_REPORTS_ADMIN_ROUTE = "/admin-all-reports";
  static const String REPORT_CATEGORIES_ADMIN_ROUTE =
      "/admin-report-categories";
  static const String REPORT_SUBCATEGORIES_ADMIN_ROUTE =
      "/admin-report-subcategories";
  static const String REPORT_STATUSES_ADMIN_ROUTE = "/admin-report-statuses";
  static const String REPORT_TEMPLATES_ADMIN_ROUTE = "/admin-report-templates";
  static const String REPORT_PDF_TEMPLATES_ADMIN_ROUTE =
      "/admin-report-pdf-templates";

  static const String SETTINGS_ADMIN_ROUTE = "/admin-settings";
}
