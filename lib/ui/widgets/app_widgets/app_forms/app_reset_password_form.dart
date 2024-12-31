import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';

class AppResetPasswordForm extends StatefulWidget {
  final Function(String) onSubmit; // Passes the email, no context

  const AppResetPasswordForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AppResetPasswordForm> createState() => _AppResetPasswordFormState();
}

class _AppResetPasswordFormState extends State<AppResetPasswordForm> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  late final TextEditingController emailController;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _validateForm() {
    var validate = Validation();
    setState(() {
      _isFormValid = validate.isEmail(emailController.text) == true;
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
          const SizedBox(height: 35),
          MyCustomFormSubmitButton(
            isDisabled: !_isFormValid,
            key: const Key('resetPassword'),
            onTap: () {
              if (_isFormValid) {
                widget.onSubmit(emailController.text);
              }
            },
            text: AppLocalizations.of(context)!.resetPasswordTXT,
          ),
        ],
      ),
    );
  }
}
