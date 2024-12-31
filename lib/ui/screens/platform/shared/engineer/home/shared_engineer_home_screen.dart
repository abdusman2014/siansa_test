import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_confirmation_dialog.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';
import 'package:unicons/unicons.dart';
import 'package:go_router/go_router.dart';

class SharedEngineerHomeScreen extends StatelessWidget {
  const SharedEngineerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Engineer Home Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
          children: [
            const Text(
              'Engineer Home Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '(Pantalla Inicial para el Ingeniero)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Mas contenido aqui proximamente...',
              style: TextStyle(
                fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'User Role: ${userProvider.getAuthUserRoleId}',
              style: const TextStyle(
                fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Phone: ${userProvider.getAuthUserPhoneNumber}',
              style: const TextStyle(
                fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color to red
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                appConfirmationDialog(
                  context: context,
                  // stringsTemplate: '',
                  title: "Cerrar Sesión",
                  text: "¿Estas seguro?",
                  confirmText: "SI",
                  onConfirm: () async {
                    await userProvider.auth.signOut(context);
                    context.go('/');
                  },
                );
              },
              child: Text("SALIR"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color to red
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                context.go(RoutesConstants.SHARED_ENGINEER_QR_CODE_SCAN_SCREEN);
              },
              child: Text("Check Equipment"),
            ),
          ],
        ),
      ),
    );
  }
}
