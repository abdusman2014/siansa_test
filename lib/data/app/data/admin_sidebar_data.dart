import 'package:flutter/material.dart';
import 'package:siansa_app/constants/routes_constants.dart';

class AdminData {
  static List<Map<String, dynamic>> sidebar = [
    {
      "icon": Icons.home,
      "title": 'Home',
      // "title": 'Inicio',
      "route": AdminRoutesConstants.HOME_ADMIN_ROUTE,
      // "submenusList": null // [] or null ?
    },
    {
      "icon": Icons.group,
      "title": 'Users',
      // "title": 'Usuarios',
      "route": AdminRoutesConstants.USERS_ADMIN_ROUTE,
      "submenusList": [
        {
          "icon": Icons.groups_2_rounded,
          "title": 'All Users',
          // "title": 'Todo',
          "route": AdminRoutesConstants.ALL_USERS_ADMIN_ROUTE,
        },
        {
          "icon": Icons.accessibility_new_sharp,
          "title": 'User Roles',
          // "title": 'Roles de Usuario',
          "route": AdminRoutesConstants.USER_ROLES_ADMIN_ROUTE,
        },
        {
          "icon": Icons.perm_identity_sharp,
          "title": 'User Permissions',
          // "title": 'Permisos de Usuario',
          "route": AdminRoutesConstants.USER_PERMISSIONS_ADMIN_ROUTE,
        },
      ]
    },
    {
      "icon": Icons.fire_hydrant,
      "title": 'Equipment',
      // "title": 'Equipo',
      "route": AdminRoutesConstants.EQUIPMENT_ADMIN_ROUTE,
      "submenusList": [
        {
          "icon": Icons.fire_hydrant,
          "title": 'All Equipment',
          // "title": 'Todo',
          "route": AdminRoutesConstants.ALL_EQUIPMENT_ADMIN_ROUTE,
        },
        {
          "icon": Icons.fire_hydrant,
          "title": 'Equipment Categories',
          // "title": 'Categorías de Equipo',
          "route": AdminRoutesConstants.EQUIPMENT_CATEGORIES_ADMIN_ROUTE,
        },
        {
          "icon": Icons.fire_hydrant,
          "title": 'Equipment Subcategories',
          // "title": 'Subcategorías de Equipo',
          "route": AdminRoutesConstants.EQUIPMENT_SUBCATEGORIES_ADMIN_ROUTE,
        },
      ]
    },
    {
      "icon": Icons.file_present,
      "title": 'Reports',
      // "title": 'Reportes',
      "route": AdminRoutesConstants.REPORTS_ADMIN_ROUTE,
      "submenusList": [
        {
          "icon": Icons.file_present_rounded,
          "title": 'All Reports',
          // "title": 'Todo',
          "route": AdminRoutesConstants.ALL_REPORTS_ADMIN_ROUTE,
        },
        {
          "icon": Icons.file_present_rounded,
          "title": 'Report Categories',
          // "title": 'Categorías de Reporte',
          "route": AdminRoutesConstants.REPORT_CATEGORIES_ADMIN_ROUTE,
        },
        {
          "icon": Icons.file_present_rounded,
          "title": 'Report Subcategories',
          // "title": 'Subcategorías de Reporte',
          "route": AdminRoutesConstants.REPORT_SUBCATEGORIES_ADMIN_ROUTE,
        },
        {
          "icon": Icons.file_present_rounded,
          "title": 'Report Statuses',
          // "title": 'Estatuses de Reporte',
          "route": AdminRoutesConstants.REPORT_STATUSES_ADMIN_ROUTE,
        },
        {
          "icon": Icons.file_present_rounded,
          "title": 'Report Templates',
          // "title": 'Plantillas de Reporte',
          "route": AdminRoutesConstants.REPORT_TEMPLATES_ADMIN_ROUTE,
        },
        {
          "icon": Icons.file_present_rounded,
          "title": 'Report PDF Templates',
          // "title": 'Plantillas PDF de Reporte',
          "route": AdminRoutesConstants.REPORT_PDF_TEMPLATES_ADMIN_ROUTE,
        },
      ]
    },
    {
      "icon": Icons.settings,
      "title": 'Settings',
      // "title": 'Configuración',
      "route": AdminRoutesConstants.SETTINGS_ADMIN_ROUTE,
      "submenusList": [] // [] or null ?
    },
  ];
}
