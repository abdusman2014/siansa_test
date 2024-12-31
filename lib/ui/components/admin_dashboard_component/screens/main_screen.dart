import 'package:siansa_app/ui/components/admin_dashboard_component/layouts/layout_1.dart';
import 'package:siansa_app/ui/components/admin_dashboard_component/layouts/layout_2.dart';
import 'package:siansa_app/ui/components/admin_dashboard_component/widgets/header_widget_2.dart';

import '../util/responsive.dart';
import '../widgets/dashboard_widget.dart';
import '../widgets/side_menu_widget.dart';
import '../widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String title;
  final String? sidebarLogoSrc;
  final List<Map<String, dynamic>>? sidebarData;
  final void Function(String)? onMenuClick;
  final Widget? contentWidget;
  final VoidCallback onClickSignOut; // Function to handle sign out

  const MainScreen({
    super.key,
    //
    required this.title,
    this.sidebarLogoSrc,
    this.sidebarData,
    this.onMenuClick,
    this.contentWidget,
    required this.onClickSignOut, // Required parameter
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    Widget _buildDefaultContent() {
      return const Expanded(
        child: Center(
          child: Text(
            'Please provide contentWidget',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    // **************************************************
    // 2 COLUMNS
    // **************************************************

    return Scaffold(
      drawer: !isDesktop
          ? SizedBox(
              width: 300,
              child: SideMenuWidget(
                sidebarLogoSrc: sidebarLogoSrc,
                sidebarData: sidebarData,
                onMenuClick: onMenuClick,
                onClickSignOut: onClickSignOut,
              ),
            )
          : null,
      body: Row(
        children: [
          // Left column with the SideMenuWidget (fixed width)
          if (isDesktop)
            SizedBox(
              width: 300, // Fixed width for the side menu
              child: Container(
                color: Colors
                    .blueGrey, // Optional background color for visualization
                child: SideMenuWidget(
                  sidebarLogoSrc: sidebarLogoSrc,
                  sidebarData: sidebarData,
                  onMenuClick: onMenuClick,
                  onClickSignOut: onClickSignOut,
                ),
              ),
            ),
          // Right column with HeaderWidget2 at the top and contentWidget below
          Expanded(
            child: Column(
              children: [
                // Header widget at the top of the second column
                Container(
                  padding: const EdgeInsets.all(10.0),
                  // color: Colors.red, // Optional color for visualization
                  child: const HeaderWidget2(),
                ),
                // Content widget filling the remaining space
                Expanded(
                  child: Container(
                    color:
                        Colors.grey[100], // Background color for visualization
                    child: contentWidget ??
                        const Center(
                          child: Text(
                            "Please provide 'contentWidget'",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // **************************************************
    // 2 ROWS
    // **************************************************

    return Scaffold(
      drawer: !isDesktop
          ? SizedBox(
              width: 300,
              child: SideMenuWidget(
                sidebarLogoSrc: sidebarLogoSrc,
                sidebarData: sidebarData,
                onMenuClick: onMenuClick,
                onClickSignOut: onClickSignOut,
              ),
            )
          : null,
      body: Container(
        // color: Colors.green,
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.all(10.0),
                    child: const HeaderWidget2(),
                  ),
                ),
              ],
            ),
            Expanded(
              // Ensure the content takes available height
              child: Row(
                children: [
                  // Side menu with fixed width and constrained height
                  if (isDesktop)
                    SizedBox(
                      width: 300, // Fixed width for the side menu
                      child: Container(
                        color: Colors
                            .blueGrey, // Optional background color for visualization
                        child: SideMenuWidget(
                          sidebarLogoSrc: sidebarLogoSrc,
                          sidebarData: sidebarData,
                          onMenuClick: onMenuClick,
                          onClickSignOut: onClickSignOut,
                        ),
                      ),
                    ),
                  // Content area
                  Expanded(
                    child: Container(
                      color: Colors
                          .grey[200], // Background color to help visualize
                      child: contentWidget ??
                          const Center(
                            child: Text(
                              "Please provide 'contentWidget'",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // **************************************************
    // 3 COLUMNS
    // **************************************************

    return Scaffold(
      drawer: !isDesktop
          ? SizedBox(
              width: 300,
              child: SideMenuWidget(
                sidebarLogoSrc: sidebarLogoSrc,
                sidebarData: sidebarData,
                onMenuClick: onMenuClick,
                onClickSignOut: onClickSignOut,
              ),
            )
          : null,
      // endDrawer: Responsive.isMobile(context)
      //     ? SizedBox(
      //         width: MediaQuery.of(context).size.width * 0.8,
      //         child: const SummaryWidget(),
      //       )
      //     : null,
      body: SafeArea(
        child: Row(
          children: [
            // COLUMN #1
            if (isDesktop)
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(
                    sidebarLogoSrc: sidebarLogoSrc,
                    sidebarData: sidebarData,
                    onMenuClick: onMenuClick,
                    onClickSignOut: onClickSignOut,
                  ),
                ),
              ),
            // COLUMN #2
            Expanded(
              flex: 7,
              child: contentWidget ??
                  const Center(
                    child: Text(
                      "Please provide 'contentWidget'",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
            ),
            // // COLUMN #3
            // if (isDesktop)
            //   Expanded(
            //     flex: 3,
            //     child: SummaryWidget(),
            //   ),
          ],
        ),
      ),
    );
  }
}
