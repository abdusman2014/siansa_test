import '../util/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget2 extends StatelessWidget {
  const HeaderWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // If on desktop
        if (Responsive.isDesktop(context))
          const Text(
            'Admin Panel',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        // If NOT on desktop
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  // color: Responsive.isDesktop(context)
                  //     ? Colors.transparent
                  //     : Colors.grey,
                  size: 25,
                ),
              ),
            ),
          ),
        Row(
          children: [
            // IconButton(
            //   icon: const Icon(
            //     Icons.search_rounded,
            //     color: Colors.blue,
            //     size: 25,
            //   ),
            //   onPressed: () {},
            // ),
            InkWell(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 16, // Adjust the radius as needed
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/user_profile_default.png",
                    width:
                        32, // Use a width that covers the CircleAvatar radius * 2
                    height: 32, // Match the height to keep it square
                    fit: BoxFit
                        .cover, // Ensures the image covers the circle fully
                  ),
                ),
              ),
            ),

            // AssetImage('assets/images/user_profile_default.png'),

            // Image.asset(
            //   "assets/images/user_profile_default.png",
            //   width: 32,
            // ),
          ],
        ),
      ],
    );
  }
}
