// import 'package:flutter/material.dart';
// import './submenu_model.dart';

// class MenuModel {
//   final IconData icon;
//   final String title;
//   final String? route;
//   final List<SubmenuModel>? submenusList;

//   const MenuModel({
//     required this.icon,
//     required this.title,
//     this.route,
//     this.submenusList,
//   });

//   // Factory method to create a MenuModel from a map
//   factory MenuModel.fromMap(Map<String, dynamic> map) {
//     return MenuModel(
//       // Assuming 'icon' is stored as an integer codePoint in map
//       icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
//       title: map['title'] as String,
//       route: map['route'] as String?,
//       submenusList: map['submenusList'] != null
//           ? SubmenuModel.fromList(
//               List<Map<String, dynamic>>.from(map['submenusList']))
//           : null,
//     );
//   }

//   // Static method to convert a list of maps into a list of MenuModel objects
//   static List<MenuModel> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => MenuModel.fromMap(map)).toList();
//   }
// }

// // --------------------------------------------------
// // --------------------------------------------------
// // --------------------------------------------------