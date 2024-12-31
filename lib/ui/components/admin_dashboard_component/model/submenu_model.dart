// // --------------------------------------------------

// import 'package:flutter/material.dart';

// class SubmenuModel {
//   final IconData icon;
//   final String title;
//   final String? route;

//   const SubmenuModel({
//     required this.icon,
//     required this.title,
//     this.route,
//   });

//   // Factory method to create a SubmenuModel from a map
//   factory SubmenuModel.fromMap(Map<String, dynamic> map) {
//     return SubmenuModel(
//       icon: map['icon'] as IconData,
//       title: map['title'] as String,
//       route: map['route'] as String?,
//     );
//   }

//   // Static method to convert a list of maps into a list of SubmenuModel objects
//   static List<SubmenuModel> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => SubmenuModel.fromMap(map)).toList();
//   }
// }

// // --------------------------------------------------
// // --------------------------------------------------
// // --------------------------------------------------