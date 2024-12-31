import 'package:flutter/material.dart';
// Import the flutter_easyloading package

import 'package:siansa_app/models/ui/forms/my_form_input_model.dart';

import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_form/my_form.dart';

class CRUDCreateUpdateForm extends StatefulWidget {
  List<MyFormInputModel> inputElements;
  Function(Map<String, dynamic>) onSubmit;
  String submitButtonText;

  CRUDCreateUpdateForm({
    Key? key,
    required this.inputElements,
    required this.onSubmit,
    this.submitButtonText = "SUBMIT",
  }) : super(key: key);

  @override
  _CRUDCreateUpdateFormState createState() => _CRUDCreateUpdateFormState();
}

class _CRUDCreateUpdateFormState extends State<CRUDCreateUpdateForm> {
  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  Widget buildForm(context) {
    return MyForm(
      padding: const EdgeInsets.all(10),
      inputElements: widget.inputElements,
      // titleText: 'PRODUCT CREATE/EDIT',
      // subtitleText: 'subtitle text',
      // descriptionText: 'description text',
      // footerText: 'footer text',
      submitButtonText: widget.submitButtonText,
      onSubmit: (formValues) {
        widget.onSubmit(formValues);
      },
    );
  }
}
