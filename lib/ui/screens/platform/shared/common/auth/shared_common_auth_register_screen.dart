import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_company_logo.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/ui_utils/responsive/make_responsive_web.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_forms/app_register_form.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label_button.dart';

class SharedCommonAuthRegisterScreen extends StatefulWidget {
  const SharedCommonAuthRegisterScreen({super.key});

  @override
  State<SharedCommonAuthRegisterScreen> createState() =>
      _SharedCommonAuthRegisterScreenState();
}

class _SharedCommonAuthRegisterScreenState
    extends State<SharedCommonAuthRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    UserProvider userProvider = Provider.of<UserProvider>(context);

    // Determine the background color based on screen width
    Color screenBackgroundColor;
    if (screenWidth < 600) {
      screenBackgroundColor = Colors.white; // Small screens
    } else if (screenWidth < 1200) {
      screenBackgroundColor = Colors.green; // Medium screens
    } else {
      screenBackgroundColor = Colors.green; // Large screens
    }

    // Determine the form container box shadow color based on screen width
    Color formContainerBoxShadowColor;
    if (screenWidth < 600) {
      formContainerBoxShadowColor = Colors.white; // Small screens
    } else if (screenWidth < 1200) {
      formContainerBoxShadowColor = Colors.black26; // Medium screens
    } else {
      formContainerBoxShadowColor = Colors.black26; // Large screens
    }

    // **************************************************
    // Login Form Theme 1
    // **************************************************

    return Scaffold(
      body: Container(
        color: screenBackgroundColor, // Full-screen green background
        child: Center(
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.8,  // Adjust width as needed
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width,
            constraints: const BoxConstraints(
              maxWidth: 450, // Set your desired maximum width here
            ),
            padding:
                const EdgeInsets.all(50), // Padding inside the white container
            decoration: BoxDecoration(
              color: Colors.white, // White background for the form container
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  // Adds subtle shadow for elevation effect
                  color: formContainerBoxShadowColor,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(height: height * .125),
                  const AppCompanyLogo(),
                  const SizedBox(height: 50),
                  AppRegisterForm(
                    onClickForgotPassword: () {
                      context.push(RoutesConstants.FORGOT_PASSWORD_ROUTE);
                    },
                    onSubmit: (name, lastName, email, password) async {
                      await userProvider.auth.registerWithEmail(
                        context: context,
                        name: name,
                        lastName: lastName,
                        email: email,
                        password: password,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  // MyCustomFormLabelButton(
                  //   onTap: () {
                  //     context.push(RoutesConstants.LOGIN_ROUTE);
                  //   },
                  //   title:
                  //       AppLocalizations.of(context)!.alreadyHaveAnAccountTXT,
                  //   subtitle: AppLocalizations.of(context)!.signInTXT,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // **************************************************
    // Register Form Theme 2
    // **************************************************

    return Scaffold(
      body: MakeResponsiveWeb(
        image: const AssetImage('assets/images/company_logo.png'),
        child: Center(
          child: SizedBox(
            height: height,
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .125),
                        const AppCompanyLogo(),
                        const SizedBox(height: 30),
                        // AppRegisterForm(
                        //   onSubmit: (email, password) async {
                        //     await userProvider.auth.signInWithEmail(
                        //       context: context,
                        //       email: email,
                        //       password: password,
                        //       // chatProvider: chatProvider,
                        //     );
                        //   },
                        // ),
                        const SizedBox(height: 10),
                        // MyCustomFormLabelButton(
                        //   onTap: () {
                        //     context.go('/register');
                        //   },
                        //   title: AppLocalizations.of(context)!
                        //       .dontHaveAnAccountTXT,
                        //   subtitle: AppLocalizations.of(context)!.registerTXT,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
