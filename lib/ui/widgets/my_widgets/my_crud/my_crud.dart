// import 'package:flutter/material.dart';
// import 'products/index.dart';

// class MyCRUD extends StatefulWidget {
//   const MyCRUD({super.key});

//   @override
//   State<MyCRUD> createState() => _MyCRUDState();
// }

// class _MyCRUDState extends State<MyCRUD> {
//   @override
//   Widget build(BuildContext context) {
//     return buildMyCRUDModules(context);
//   }

//   Widget buildMyCRUDModules(context) {
//     return const SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 80),
//           //
//           ProductCreate(),
//           SizedBox(height: 2),
//           ProductReadAll(),
//           SizedBox(height: 40),
//           //
//           ProductCategoryCreate(),
//           SizedBox(height: 2),
//           ProductCategoryReadAll(),
//           SizedBox(height: 40),
//           //
//           ProductSubcategoryCreate(),
//           SizedBox(height: 2),
//           ProductSubcategoryReadAll(),
//           SizedBox(height: 40),
//           //
//           ProductStatusCreate(),
//           SizedBox(height: 2),
//           ProductStatusReadAll(),
//           SizedBox(height: 40),
//         ],
//       ),
//     );
//   }
// }