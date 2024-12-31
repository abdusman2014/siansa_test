import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading; // Controls whether to show a leading icon or not
  final IconData? leadingIcon; // Custom icon if different from arrow_back
  final VoidCallback? leadingAction; // Custom action for leading icon
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color iconThemeColor;
  final TextStyle? titleTextStyle; // Customizable text style for title
  final double toolbarHeight; // Configurable toolbar height
  final double elevation;
  final Border? border; // Allow custom border

  MyAppBar({
    Key? key,
    this.title = "Title",
    this.showLeading = true, // Default value for showing the leading icon
    this.leadingIcon, // Optional custom icon
    this.leadingAction, // Optional custom action for leading icon
    this.actions,
    Color? backgroundColor, // Nullable background color with a default fallback
    Color? iconThemeColor, // Nullable icon theme color
    this.titleTextStyle = const TextStyle(
        color: Colors.black,
        fontFamily: "Montserrat",
        fontSize: 24,
        fontWeight: FontWeight.bold), // Customizable text style
    this.toolbarHeight = 100.0, // Default toolbar height
    this.elevation = 0.0, // Default elevation
    this.border = const Border(
      bottom: BorderSide(width: 2, color: Color.fromARGB(15, 0, 0, 0)),
    ), // Default border style
  })  : backgroundColor = backgroundColor ?? Colors.white,
        iconThemeColor = iconThemeColor ?? Colors.black,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Leading icon configuration
      leading: showLeading
          ? IconButton(
              icon: Icon(leadingIcon ??
                  Icons.arrow_back), // Custom icon or default back arrow
              onPressed: leadingAction ??
                  () => Navigator.pop(
                      context), // Custom action or default back navigation
            )
          : null,
      actions: actions,
      toolbarHeight: toolbarHeight, // Configurable height
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: border, // Configurable border
      iconTheme: IconThemeData(
        color: iconThemeColor, // Customizable icon color
      ),
      centerTitle: true,
      title: Text(
        title,
        style: titleTextStyle,
      ), // Allow for custom text styling or fallback to default
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

// EXAMPLE USAGE:
// MyAppBar(
//   title: "Home",
//   showLeading: true, // You can hide/show the leading icon
//   leadingIcon: Icons.send_outlined,
//   leadingAction: () => print('leading action clicked from parent...'),
//   backgroundColor: Colors.white.withOpacity(1.0),
//   iconThemeColor: Colors.green,
//   titleTextStyle: const TextStyle(
//     fontSize: 22,
//     color: Colors.green,
//     fontWeight: FontWeight.bold,
//   ),
//   toolbarHeight: 80.0, // Custom height
//   elevation: 0.0, // 0.0 - Removes border and fixes white background color
//   border: const Border(
//       bottom: BorderSide(
//     width: 0, // 0 - Removes border
//     color: Colors.transparent, // Colors.transparent - Removes border
//   )),
//   actions: [
//     IconButton(
//       icon: const Icon(Icons.message_outlined),
//       onPressed: () {},
//     ),
//     IconButton(
//       icon: const Icon(Icons.notifications),
//       onPressed: () {},
//     ),
//     IconButton(
//       icon: const Icon(Icons.settings),
//       onPressed: () {},
//     ),
//   ],
// )

// NOTES:
// If setting AppBar background color to white make sure to set elevation to 0.00:
// Elevation Set to 0: This removes the shadow and overlay, allowing the background color to be shown fully and clearly.