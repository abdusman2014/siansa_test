import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/main.dart';
import 'package:siansa_app/models/app/user_model.dart';
import 'package:siansa_app/models/app/user_permission_model.dart';
import 'package:siansa_app/state/providers/crud_provider.dart';
import 'package:siansa_app/state/providers/crud_sub_provider.dart';
import 'package:siansa_app/state/providers/pagination_provider.dart';
import 'package:siansa_app/state/providers/pagination_sub_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/user_permission_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/user_role_provider.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_animations/app_animated_page.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_animations/app_fade_in_out.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_company_logo.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_open_web_view.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_avatar_initials/app_avatar_initials.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_login_or_register.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_loading_animation.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_version_display.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_dialog_please_login_or_register.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_please_login.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_confirmation_dialog.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_divider.dart';

import 'package:siansa_app/ui/widgets/my_widgets/my_animation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_app_bar.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_1.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_2.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_icon.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_privacy_policy_terms_and_conditions.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_small_pop_button.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_dialog_update_required.dart';
import 'package:unicons/unicons.dart';

class CoreCommonPaginationTestScreen extends StatefulWidget {
  const CoreCommonPaginationTestScreen({super.key});

  @override
  _CoreCommonPaginationTestScreenState createState() =>
      _CoreCommonPaginationTestScreenState();
}

class _CoreCommonPaginationTestScreenState
    extends State<CoreCommonPaginationTestScreen> {
  @override
  void initState() {
    super.initState();

    // Call the provider function once when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This ensures the provider function is called after the build method is complete
      // Provider.of<CRUDProvider>(
      //   context,
      //   listen: false,
      // ).pagination.getFirstPage(context: context);

      Provider.of<CRUDProvider>(context, listen: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // Platform + UserRole + Feature Name + Screen

    // // If screen is responsive, then:
    // return const SharedCommonTestScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return const MobileCommonTestScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return const TabletCommonTestScreen();
    // } else {
    //   if (kIsWeb) {
    //     return const WebCommonTestScreen();
    //   } else {
    //     return const DesktopCommonTestScreen();
    //   }
    // }
    // // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    final userProvider = Provider.of<UserProvider>(context);
    final userPaginationProvider = Provider.of<UserPaginationProvider>(context);

    final paginationProvider = Provider.of<PaginationProvider>(context);
    final paginationSubProvider = Provider.of<PaginationSubProvider>(context);

    String title = "PAGINATION";

    printDebugLogs() async {
      debugPrint('\n --------------------------------->>>>> \n');

      // working
      // debugPrint('\n 1.0 >> userProvider.pagination.getPaginationData <<');
      // debugPrint('${userProvider.pagination.getPaginationData}');

      // working
      debugPrint('\n 1.1 >> userProvider.pagination.paginationData <<');
      debugPrint('${userProvider.pagination.paginationData.length}');
      debugPrint('${paginationProvider.paginationData.runtimeType}');
      debugPrint('${userProvider.pagination.paginationData}');

      // NOT working
      // debugPrint('\n 1.2 >> userPaginationProvider.getPaginationData <<');
      // debugPrint('${userPaginationProvider.getPaginationData}');

      // working
      debugPrint('\n 1.3 >> paginationProvider.paginationData <<');
      debugPrint('${paginationProvider.paginationData.length}');
      debugPrint('${paginationProvider.paginationData.runtimeType}');
      debugPrint('${paginationProvider.paginationData}');

      // NOT working
      // debugPrint('\n 1.4 >> paginationProvider.subProvider.paginationData <<');
      // debugPrint('${paginationProvider.subProvider.paginationData}');

      // NOT working
      // debugPrint('\n 1.5 >> paginationSubProvider.paginationData <<');
      // debugPrint('${paginationSubProvider.paginationData}');
    }

    getFirstPage() async {
      await userProvider.pagination.getFirstPage(
        context: context,
        // docsPerPage: 2,
      );
      printDebugLogs();
    }

    getNextPage() async {
      await userProvider.pagination.getNextPage(
        context: context,
        // docsPerPage: 2,
      );
      printDebugLogs();
    }

    getPreviousPage() async {
      await userProvider.pagination.getPreviousPage(
        context: context,
        // docsPerPage: 2,
      );
      printDebugLogs();
    }

    return Scaffold(
      appBar: AppBar(title: Text('title')),
      // appBar: MyAppBar(title: 'title'),
      // body: Center(child: Text(bodyText)),
      body: Center(
        child: Column(
          children: [
            // ---------------------------------------------
            Text('hi'),
            // ---------------------------------------------
            _buildSimpleButton(
              text: 'First Page',
              onTap: () async {
                getFirstPage();
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSimpleButton(
                  text: 'Next Page',
                  onTap: () async {
                    getNextPage();
                  },
                ),
                const SizedBox(width: 10),
                _buildSimpleButton(
                  text: 'Previous Page',
                  onTap: () async {
                    getPreviousPage();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            // ---------------------------------------------
            _buildListOfItems(context, paginationProvider.paginationData),
            // ---------------------------------------------
            const SizedBox(height: 10),
            // MyCustomFormExampleLoginForm(
            //     onSubmit: (email, password) => print('$email - $password'))
            // ---------------------------------------------
          ],
        ),
      ),
      // body: Center(
      //   child: RoundButton(),
      // ),
    );

    // return buildSimpleScaffold();
  }

  Widget _buildSimpleButton({
    String text = 'Title',
    Color backgroundColor = Colors.blue,
    dynamic onTap,
  }) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Button color
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  _buildListOfItems(BuildContext context, List<dynamic> data) {
    // Ensure the widget is scrollable and resizable in the Column
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text('ID: ${item.id}'),
          );
        },
      ),
    );
  }

  // Function that returns a Scaffold widget
  Widget buildSimpleScaffold({
    String title = "Title",
    String bodyText = "Lorem ipsum...",
  }) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // body: Center(child: Text(bodyText)),
      body: Center(
        child: InkWell(
          onTap: () {
            //
          },
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Mensaje'),
              content: const Text('Saludos!!!'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), backgroundColor: Colors.blue,
        padding: EdgeInsets.all(20), // Color de fondo
        shadowColor: Colors.black, // Color de sombra
        elevation: 5,
      ),
      child: Icon(Icons.access_alarm),
    );
  }
}
