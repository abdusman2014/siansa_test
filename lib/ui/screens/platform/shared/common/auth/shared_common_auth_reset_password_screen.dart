// import 'package:siansa_app/providers/user_provider_parts/user_provider.dart';
// import 'package:siansa_app/ui/shared/widgets/index.dart';
// import 'package:siansa_app/ui/utils/responsive/responsive.dart';
// import 'package:siansa_app/ui/utils/styles/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';

// import '../../../widgets/forms/elements/submit_button.dart';

// class SharedCommonAuthResetPasswordScreen extends StatefulWidget {
//   const SharedCommonAuthResetPasswordScreen({super.key});

//   @override
//   State<SharedCommonAuthResetPasswordScreen> createState() =>
//       _SharedCommonAuthResetPasswordScreenState();
// }

// class _SharedCommonAuthResetPasswordScreenState extends State<SharedCommonAuthResetPasswordScreen> {
//   TextEditingController emailController = TextEditingController();

//   isFormComplete() {
//     return emailController.text.isNotEmpty;
//   }

//   @override
//   Widget build(BuildContext context) {
//     UserProvider up = Provider.of<UserProvider>(context);
//     return Scaffold(
//       appBar: MyAppBar(
//         title: AppLocalizations.of(context)!.resetPassword,
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           width: Responsive.isDesktop(context)
//               ? MediaQuery.of(context).size.width * 0.5
//               : MediaQuery.of(context).size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // AppCompanyLogo(),
//               const SizedBox(height: 20),
//               Text(
//                 AppLocalizations.of(context)!.resetPasswordDescription,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: ThemeColors.grey1ThemeColor,
//                 ),
//               ),
//               const SizedBox(height: 50),
//               _buildEmailField(),
//               const SizedBox(height: 50),
//               _buildResetButton(context, up),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEmailField() {
//     return TextFormField(
//       controller: emailController,
//       decoration: InputDecoration(
//         labelText: AppLocalizations.of(context)!.email,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       ),
//       onChanged: (value) {
//         setState(() {
//           isFormComplete();
//         });
//       },
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return AppLocalizations.of(context)!.pleaseEnterYourEmail;
//         }
//         // You can add additional email validation logic here if needed
//         return null;
//       },
//       // Handle email input
//       // onChanged: (value) {
//       //   // Store the email value in a variable or state if needed
//       // },
//     );
//   }

//   Widget _buildResetButton(context, up) {
//     return SubmitButton(
//       isDisabled: !isFormComplete(),
//       onTap: () {
//         if (isFormComplete()) {
//           up.resetPassword(context, emailController.text);
//         }
//       },
//       text: AppLocalizations.of(context)!.resetPassword,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_company_logo.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_forms/app_reset_password_form.dart';
import 'package:siansa_app/ui/ui_utils/responsive/make_responsive_web.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_app_bar.dart';

class SharedCommonAuthResetPasswordScreen extends StatefulWidget {
  const SharedCommonAuthResetPasswordScreen({super.key});

  @override
  State<SharedCommonAuthResetPasswordScreen> createState() =>
      _SharedCommonAuthResetPasswordScreenState();
}

class _SharedCommonAuthResetPasswordScreenState
    extends State<SharedCommonAuthResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

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

    // Determine the appBar content color based on screen width
    Color appBarContentColor;
    if (screenWidth < 600) {
      appBarContentColor = Colors.green; // Small screens
    } else if (screenWidth < 1200) {
      appBarContentColor = Colors.white; // Medium screens
    } else {
      appBarContentColor = Colors.white; // Large screens
    }

    // **************************************************
    // Login Form Theme 1
    // **************************************************

    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.resetPasswordTXT,
        backgroundColor: screenBackgroundColor,
        iconThemeColor: appBarContentColor,
      ),
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
                  // const AppCompanyLogo(),
                  const Text("Enter your email"),
                  const SizedBox(height: 20),
                  AppResetPasswordForm(
                    onSubmit: (email) {
                      userProvider.auth.resetPassword(
                        context: context,
                        email: email,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // **************************************************
    // Login Form Theme 2
    // **************************************************

    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.resetPasswordTXT,
      ),
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
                        AppResetPasswordForm(
                          onSubmit: (email) {
                            userProvider.auth.resetPassword(
                              context: context,
                              email: email,
                            );
                          },
                        ),
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

    // return Scaffold(
    //   appBar: MyAppBar(
    //     title: AppLocalizations.of(context)!.resetPassword,
    //   ),
    //   body: Center(
    //     child: Container(
    //       padding: const EdgeInsets.all(20),
    //       width: Responsive.isDesktop(context)
    //           ? MediaQuery.of(context).size.width * 0.5
    //           : MediaQuery.of(context).size.width,
    //       // child: AppResetPasswordForm(
    //       //   emailController: emailController,
    //       //   onResetPassword: (email) {
    //       //     userProvider.resetUserModelPassword(context: context, email: email);
    //       //   },
    //       // ),
    //       child: AppResetPasswordForm(
    //         onSubmit: (email) {
    //           userProvider.resetUserModelPassword(
    //             context: context,
    //             email: email,
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
