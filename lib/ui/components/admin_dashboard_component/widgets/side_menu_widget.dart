import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../const/constant.dart';
import '../data/side_menu_data.dart';
import '../model/menu_model.dart';
import '../model/submenu_model.dart';

const sidebarDataExample = [
  {
    "icon": Icons.home,
    "title": 'Home Demo',
    "route": 'admin-home-demo',
    "submenusList":
        [] // [] or null ? [] for simplification, null will give us more work by checking if not null
  },
  {
    "icon": Icons.group,
    "title": 'Users Demo',
    "route": 'admin-users-demo',
    "submenusList": [
      {
        "icon": Icons.groups_2_rounded,
        "title": 'All Users',
        "route": 'admin-all-users',
      },
      {
        "icon": Icons.accessibility_new_sharp,
        "title": 'User Roles',
        "route": 'admin-user-roles',
      },
      {
        "icon": Icons.perm_identity_sharp,
        "title": 'User Permissions',
        "route": 'admin-user-permissions',
      },
    ]
  },
  {
    "icon": Icons.settings,
    "title": 'Settings Demo',
    "route": 'admin-settings-demo',
  },
];

class SideMenuWidget extends StatefulWidget {
  final String? sidebarLogoSrc;
  final List<Map<String, dynamic>>? sidebarData;
  final void Function(String)? onMenuClick;
  final VoidCallback onClickSignOut;

  const SideMenuWidget({
    super.key,
    this.sidebarLogoSrc,
    this.sidebarData = sidebarDataExample,
    this.onMenuClick,
    required this.onClickSignOut,
  });

  static handleOnMenuClick(String value) {
    String str = 'Sidebar Menu clicked! ROUTE: $value';
    print(str);
  }

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedMenuIndex = -1; // Tracks selected menu item without submenus
  int? selectedSubmenuIndex; // Tracks selected submenu item
  int? expandedMenuIndex; // Tracks expanded menu for items with submenus

  @override
  Widget build(BuildContext context) {
    // dynamic data = SideMenuData();
    List<Map<String, dynamic>> data = widget.sidebarData ?? sidebarDataExample;

    // Assign onMenuClick or default to handleOnMenuClick
    final Function(String) onMenuClick =
        widget.onMenuClick ?? SideMenuWidget.handleOnMenuClick;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: sidebarBgColor,
      child: Column(
        children: [
          // Add the logo image here
          if (widget.sidebarLogoSrc != null)
            Image.asset(
              widget.sidebarLogoSrc!, // replace with your logo path
              height: 80, // set desired height
              width: 80, // set desired width
              fit: BoxFit.contain, // adjust as needed
            ),
          // if (widget.sidebarLogoSrc != null)
          const SizedBox(height: 20), // add spacing between logo and list

          // Expanded widget to make ListView.builder take available space
          Expanded(
            child: ListView.builder(
              // itemCount: data.menu.length + 1, // +1 for sign out button
              itemCount: data!.length + 1, // +1 for sign out button
              itemBuilder: (context, index) {
                if (index == data!.length) {
                  return _buildSignOutEntry();
                }
                return buildMenuEntry(data, index, onMenuClick);
              },
            ),
          ),

          const Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildMenuEntry(SideMenuData data, int index) {
  Widget buildMenuEntry(
    List<Map<String, dynamic>> data,
    int index,
    Function(String) onMenuClick,
  ) {
    final isMenuSelected = selectedMenuIndex == index;
    // final hasSubmenus = data.menu[index].submenusList != null;
    // final hasSubmenus = data[index]['submenusList'] != null;
    final hasSubmenus = data[index]['submenusList'] != null &&
        data[index]['submenusList'].length > 0;
    final isExpanded = expandedMenuIndex == index;

    // Determine background color based on selected states
    Color backgroundColor = Colors.transparent;
    Color textAndIconColor = Colors.black87;
    if (isMenuSelected && !hasSubmenus) {
      backgroundColor = Colors.green; // green
      textAndIconColor = Colors.white;
    } else if (isMenuSelected && hasSubmenus && selectedSubmenuIndex != null) {
      textAndIconColor = Colors.green; // green
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                // Handle menu clicks based on whether submenus exist
                if (hasSubmenus) {
                  // THE MENU HAS SUBMENUS
                  // Expand/collapse menu if it has submenus
                  expandedMenuIndex = isExpanded ? null : index;
                } else {
                  // THE MENU DOES NOT HAVE SUBMENUS

                  selectedMenuIndex = index; // Select menu without submenus
                  selectedSubmenuIndex = null; // Reset submenu index
                  expandedMenuIndex = null; // Collapse other expanded menus

                  // widget.onMenuClick!(data[selectedMenuIndex]['route']);
                  onMenuClick(data[selectedMenuIndex]['route']);
                }
              });
            },
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
                  child: Icon(
                    // data.menu[index].icon,
                    data[index]['icon'],
                    color: textAndIconColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    // data.menu[index].title,
                    data[index]['title'],
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 16,
                      color: textAndIconColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (hasSubmenus)
                  IconButton(
                    icon: Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      // color: Colors.black,
                      color: textAndIconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        // Only toggle expanded state on icon click
                        expandedMenuIndex = isExpanded ? null : index;
                      });
                    },
                  ),
              ],
            ),
          ),
          // Display submenus if they exist and the menu is expanded
          if (hasSubmenus && isExpanded)
            ClipRect(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                // height: (data.menu[index].submenusList!.length * 50.0)
                height: (data[index]['submenusList'].length * 50.0)
                    .clamp(0.0, double.infinity),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // itemCount: data.menu[index].submenusList?.length ?? 0,
                  itemCount: data[index]['submenusList'].length ?? 0,
                  itemBuilder: (context, subIndex) {
                    return buildSubmenuEntry(
                      // data.menu[index].submenusList![subIndex],
                      data[index]['submenusList'][subIndex],
                      index,
                      subIndex,
                      onMenuClick,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Widget buildSubmenuEntry(SubmenuModel submenu, int menuIndex, int subIndex) {
  Widget buildSubmenuEntry(
    Map<String, dynamic> submenu,
    int menuIndex,
    int subIndex,
    Function(String) onMenuClick,
  ) {
    final isSubmenuSelected =
        selectedSubmenuIndex == subIndex && expandedMenuIndex == menuIndex;

    Color backgroundColor = Colors.transparent;
    Color textAndIconColor = Colors.black87;
    if (isSubmenuSelected && selectedMenuIndex == menuIndex) {
      backgroundColor = Colors.green; // green
      textAndIconColor = Colors.white;
    } else {
      backgroundColor = Colors.transparent; // green
      textAndIconColor = Colors.black87;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedMenuIndex =
                menuIndex; // Reset parent menu selection for submenus
            selectedSubmenuIndex = subIndex; // Set submenu selection
            expandedMenuIndex = menuIndex; // Keep track of the expanded menu
          });

          // widget.onMenuClick!(submenu['route']);
          onMenuClick(submenu['route']);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Icon(
                // submenu.icon,
                submenu['icon'],
                color: textAndIconColor,
              ),
              const SizedBox(width: 10),
              Text(
                // submenu.title,
                submenu['title'],
                style: TextStyle(
                  fontSize: 14,
                  color: textAndIconColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignOutEntry() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: () {
          widget.onClickSignOut();
        },
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 17),
              child: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.signOutTXT,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------
