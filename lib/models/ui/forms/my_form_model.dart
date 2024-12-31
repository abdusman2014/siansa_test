import 'package:siansa_app/models/ui/forms/my_form_input_model.dart';

class MyFormModel {
  final String? titleText;
  final String? subtitleText;
  final String? descriptionText;
  final dynamic footerText;
  final dynamic submitButtonText;
  final List<MyFormInputModel>? inputElements;
  final bool isDisabled;

  MyFormModel({
    this.titleText = "",
    this.subtitleText = "",
    this.descriptionText = "",
    this.footerText = "",
    this.submitButtonText = "",
    required this.inputElements,
    this.isDisabled = false,
  });
}
