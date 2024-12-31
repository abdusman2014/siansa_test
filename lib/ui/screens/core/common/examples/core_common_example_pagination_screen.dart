import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoreCommonExamplePaginationScreen extends StatefulWidget {
  @override
  _CoreCommonExamplePaginationScreenState createState() =>
      _CoreCommonExamplePaginationScreenState();
}

class _CoreCommonExamplePaginationScreenState
    extends State<CoreCommonExamplePaginationScreen> {
  @override
  void initState() {
    super.initState();

    // Call the provider function once when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This ensures the provider function is called after the build method is complete
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).pagination.getFirstPage(context: context);

      // Provider.of<UserPaginationProvider>(context, listen: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('My Stateful Widget')),
      body: Column(
        children: [
          const SizedBox(height: 200),
          Text(
            'Title',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return ListView.builder(
                  itemCount: userProvider.pagination.getPaginationData.length,
                  itemBuilder: (context, index) {
                    final user =
                        userProvider.pagination.getPaginationData[index];
                    // return ListTile(
                    //   title: Text("Mail: ${user['email']}"),
                    //   subtitle: Text(user['email']),
                    //   tileColor: Colors.grey[200], // Background color
                    //   selectedTileColor: Colors.blue[100], // Color when selected
                    //   selected: true, // To see the selectedTileColor
                    // );
                    return Text(
                      // "Mail: ${user['email']}",
                      "Mail: ${user.email}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // if (userProvider.pagination.isLoading)
          //   Center(child: CircularProgressIndicator()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                // onPressed: userProvider.pagination.hasPreviousPage
                //     ? () => userProvider.pagination.readUsersWithPagination(
                //           context: context,
                //           fetchPrevious: true,
                //         )
                //     : null,
                onPressed: () => userProvider.pagination.getPreviousPage(
                  context: context,
                ),
                child: const Text('Previous Page'),
              ),
              ElevatedButton(
                onPressed: () => userProvider.pagination.getNextPage(
                  context: context,
                ),
                child: Text('Next Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class CoreCommonExamplePaginationScreen extends StatelessWidget {
//   const CoreCommonExamplePaginationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Platform + UserRole + Feature Name + Screen

//     // // If screen is responsive, then:
//     // return const SharedCommonTestScreen();

//     // // If the screen requires child screens for different platforms, then:
//     // if (Responsive.isMobile(context)) {
//     //   return const MobileCommonTestScreen();
//     // } else if (Responsive.isTablet(context)) {
//     //   return const TabletCommonTestScreen();
//     // } else {
//     //   if (kIsWeb) {
//     //     return const WebCommonTestScreen();
//     //   } else {
//     //     return const DesktopCommonTestScreen();
//     //   }
//     // }

//     UserProvider userProvider = Provider.of<UserProvider>(context);

//     String title = "User List";

//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Column(
//         children: [
//           const SizedBox(height: 200),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: userProvider.pagination.paginationData.length,
//               itemBuilder: (context, index) {
//                 final user = userProvider.pagination.paginationData[index];
//                 // return ListTile(
//                 //   title: Text("Mail: ${user['email']}"),
//                 //   subtitle: Text(user['email']),
//                 //   tileColor: Colors.grey[200], // Background color
//                 //   selectedTileColor: Colors.blue[100], // Color when selected
//                 //   selected: true, // To see the selectedTileColor
//                 // );
//                 return Text(
//                   "Mail: ${user['email']}",
//                   style: const TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 );
//               },
//             ),
//           ),
//           // if (userProvider.pagination.isLoading)
//           //   Center(child: CircularProgressIndicator()),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 // onPressed: userProvider.pagination.hasPreviousPage
//                 //     ? () => userProvider.pagination.readUsersWithPagination(
//                 //           context: context,
//                 //           fetchPrevious: true,
//                 //         )
//                 //     : null,
//                 onPressed: () =>
//                     userProvider.pagination.readUsersWithPagination(
//                   context: context,
//                   fetchPrevious: true,
//                 ),
//                 child: const Text('Previous Page'),
//               ),
//               ElevatedButton(
//                 onPressed: () =>
//                     userProvider.pagination.readUsersWithPagination(
//                   context: context,
//                 ),
//                 child: Text('Next Page'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(title: Text('title')),
//       // body: Center(child: Text(bodyText)),
//       body: Center(
//         child: Column(
//           children: [
//             buildSimpleButton(
//               text: 'Click Me',
//               onTap: () async {
//                 // userProvider.crud.testFunc();
//                 userProvider.crud.createManyUsers(context, []);
//                 // userProvider.crud.readManyUsersById(context, []);
//                 // userProvider.crud.updateManyUsersById(context, [], {"": ""});
//                 // userProvider.crud.deleteUserById(context, "");
//                 // userProvider.crud.deleteManyUsersById(context, []);
//                 //
//                 // final results = await userProvider.crud.updateUser(
//                 //   context,
//                 //   "XiOO01RTcleazcy1pXbwbEAWA4j2",
//                 //   {"phoneNumber": "1122334455"},
//                 // );
//                 //
//                 // final results = await userProvider.crud.readUser(
//                 //   context,
//                 //   "XiOO01RTcleazcy1pXbwbEAWA4j2",
//                 // );
//                 // print('results');
//                 // print(results);
//                 //
//                 // final results = await userProvider.crud.readUsersWithConditions(
//                 //   context,
//                 //   {
//                 //     "userRoleId": "client",
//                 //     // "phoneNumber": "0000000000",
//                 //     // "lastName": "Lastname",
//                 //   },
//                 // );
//                 // print('results');
//                 // print(results);
//                 //
//               },
//             ),
//             // ---------------------------------------------
//           ],
//         ),
//       ),
//       // body: Center(
//       //   child: RoundButton(),
//       // ),
//     );

//     // return buildSimpleScaffold();
//   }

//   Widget buildSimpleButton({
//     String text = 'Title',
//     Color backgroundColor = Colors.blue,
//     required dynamic onTap,
//   }) {
//     return ElevatedButton(
//       onPressed: () => onTap(),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor, // Button color
//         padding: EdgeInsets.all(16.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }

//   // Function that returns a Scaffold widget
//   Widget buildSimpleScaffold({
//     String title = "Title",
//     String bodyText = "Lorem ipsum...",
//   }) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       // body: Center(child: Text(bodyText)),
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             //
//           },
//         ),
//       ),
//     );
//   }
// }

// class RoundButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Mensaje'),
//               content: const Text('Saludos!!!'),
//               actions: [
//                 TextButton(
//                   child: const Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         shape: CircleBorder(), backgroundColor: Colors.blue,
//         padding: EdgeInsets.all(20), // Color de fondo
//         shadowColor: Colors.black, // Color de la sombra
//         elevation: 10, // Tamaño de la sombra
//       ),
//       child: const Text(
//         'CLICK',
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
