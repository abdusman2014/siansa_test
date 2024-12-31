import 'package:flutter/material.dart';
import 'style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading;
  // final Widget? leading;
  final List<Widget>? actions;

  MyAppBar({
    required this.title,
    this.showLeading = true,
    // this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text(title),
      leading: showLeading == true
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: actions,
      //
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
      shape: const Border(
        bottom: BorderSide(
          width: 2,
          color: appBarBorderBottomColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: appBarIconColor,
      ),
      centerTitle: true,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: appBarThemeTextStyle,
            ),
          ],
        ),
      ),
      //
    );
  }

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => const Size.fromHeight(appBarContainerHeight);
}
