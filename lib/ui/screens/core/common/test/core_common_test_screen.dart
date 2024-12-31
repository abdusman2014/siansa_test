import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/state/providers/crud_provider.dart';

class CoreCommonTestScreen extends StatefulWidget {
  const CoreCommonTestScreen({super.key});

  @override
  _CoreCommonTestScreenState createState() => _CoreCommonTestScreenState();
}

class _CoreCommonTestScreenState extends State<CoreCommonTestScreen> {
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

    String title = "User List";

    return Scaffold(
      appBar: AppBar(title: Text('title')),
      // appBar: MyAppBar(title: 'title'),
      // body: Center(child: Text(bodyText)),
      body: Center(
        child: Column(
          children: [
            Text('Hi'),
            // ---------------------------------------------
            buildSimpleButton(
              text: 'Click Me',
              onTap: () async {
                print('Clicked');
              },
            ),
            // ---------------------------------------------
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

  Widget buildSimpleButton({
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
