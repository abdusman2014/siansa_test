import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class AppLoginForm extends StatefulWidget {
  final Function()? onClickForgotPassword;
  final Function(dynamic, dynamic)? onSubmit;

  AppLoginForm({
    Key? key,
    this.onClickForgotPassword,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AppLoginForm> createState() => _AppLoginFormState();
}

class _AppLoginFormState extends State<AppLoginForm> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    var validate = Validation();
    setState(() {
      isFormValid = validate.isEmail(emailController.text) == true &&
          validate.isRequiredFieldOk(passwordController.text) == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          MyCustomFormTextInput(
            controller: emailController,
            inputKey: 'email',
            name: 'email',
            hintText: AppLocalizations.of(context)!.emailTXT,
            validator: (value) {
              dynamic emailValidation = Validation().isEmail(value);
              if (emailValidation != true) return emailValidation;
              return null;
            },
            onChanged: (value) {
              _validateForm();
            },
          ),
          const SizedBox(height: 20),
          MyCustomFormTextInput(
            controller: passwordController,
            inputKey: 'password',
            name: 'password',
            hintText: AppLocalizations.of(context)!.passwordTXT,
            validator: (value) {
              dynamic requiredField = Validation().isRequiredFieldOk(value);
              if (requiredField != true) return requiredField;
              return null;
            },
            onChanged: (value) {
              _validateForm();
            },
            shouldHideText: true,
          ),
          InkWell(
            key: const Key('forgotPasswordButton'),
            onTap: widget.onClickForgotPassword,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context)!.forgotPasswordTXT,
                style: const TextStyle(
                  color: Color(0xFF8A8A8E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          MyCustomFormSubmitButton(
            isDisabled: !isFormValid,
            key: const Key('loginButton'),
            onTap: () async {
              if (isFormValid) {
                widget.onSubmit!(
                  emailController.text,
                  passwordController.text,
                );
              }
            },
            text: AppLocalizations.of(context)!.signInTXT,
          ),
        ],
      ),
    );
  }
}
