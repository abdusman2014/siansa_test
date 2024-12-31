// // /lib/ui/components/admin_dashboard_component.dart
// import 'package:flutter/material.dart';
// import 'screens/main_screen.dart';

// class AdminDashboardComponent extends StatelessWidget {
//   const AdminDashboardComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MainScreen();
//   }
// }

// -----------------------------------

// /lib/ui/components/admin_dashboard_component.dart
import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // Ensure this import path is correct

class AdminDashboardComponent extends StatelessWidget {
  final String title; // Example parameter for the title
  final String? sidebarLogoSrc;
  final List<Map<String, dynamic>>? sidebarData;
  final void Function(String)? onMenuClick;
  final Widget? contentWidget;
  final VoidCallback onClickSignOut; // Function to handle sign out

  // Constructor with default title and required onClickSignOut function
  const AdminDashboardComponent({
    Key? key, // Corrected to be before the other parameters
    this.title = "Admin Dashboard",
    this.sidebarLogoSrc,
    this.sidebarData,
    this.onMenuClick,
    this.contentWidget,
    required this.onClickSignOut,
  }) : super(key: key); // super is called with key after parameters

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      title: title,
      sidebarLogoSrc: sidebarLogoSrc,
      sidebarData: sidebarData,
      onMenuClick: onMenuClick,
      contentWidget: contentWidget,
      onClickSignOut: onClickSignOut, // Pass the function to MainScreen
    );
  }
}
