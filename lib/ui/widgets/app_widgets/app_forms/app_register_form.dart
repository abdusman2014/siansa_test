import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class AppRegisterForm extends StatefulWidget {
  final Function()? onClickForgotPassword;
  final Function(dynamic, dynamic, dynamic, dynamic)? onSubmit;

  AppRegisterForm({
    Key? key,
    this.onClickForgotPassword,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AppRegisterForm> createState() => _AppRegisterFormState();
}

class _AppRegisterFormState extends State<AppRegisterForm> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  late final TextEditingController nameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    var validate = Validation();
    setState(() {
      _isFormValid = validate.isRequiredFieldOk(nameController.text) == true &&
          validate.isRequiredFieldOk(lastNameController.text) == true &&
          validate.isEmail(emailController.text) == true &&
          validate.isRequiredFieldOk(passwordController.text) == true &&
          // Password match validation
          confirmPasswordController.text == passwordController.text;
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
            controller: nameController,
            inputKey: 'name',
            name: 'name',
            hintText: AppLocalizations.of(context)!.nameTXT,
            validator: (value) {
              dynamic requiredField = Validation().isRequiredFieldOk(value);
              if (requiredField != true) return requiredField;
              return null;
            },
            onChanged: (value) {
              _validateForm();
            },
          ),
          const SizedBox(height: 20),
          MyCustomFormTextInput(
            controller: lastNameController,
            inputKey: 'last_name',
            name: 'Last Name',
            hintText: AppLocalizations.of(context)!.lastNameTXT,
            validator: (value) {
              dynamic requiredField = Validation().isRequiredFieldOk(value);
              if (requiredField != true) return requiredField;
              return null;
            },
            onChanged: (value) {
              _validateForm();
            },
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          MyCustomFormTextInput(
            controller: confirmPasswordController,
            inputKey: 'confirm_password',
            name: 'Confirm Password',
            hintText: AppLocalizations.of(context)!.confirmPasswordTXT,
            validator: (value) {
              if (value != passwordController.text) {
                return AppLocalizations.of(context)!.passwordsDoNotMatchTXT;
              }
              return null;
            },
            onChanged: (value) {
              _validateForm();
            },
            shouldHideText: true,
          ),
          const SizedBox(height: 35),
          MyCustomFormSubmitButton(
            isDisabled: !_isFormValid,
            key: const Key('registerButton'),
            onTap: () async {
              if (_isFormValid) {
                widget.onSubmit!(
                  nameController.text,
                  lastNameController.text,
                  emailController.text,
                  passwordController.text,
                );
              }
            },
            text: AppLocalizations.of(context)!.registerTXT,
          ),
        ],
      ),
    );
  }
}
