import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_radio_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class FormReportPDFTemplatesSearchFilter extends StatefulWidget {
  final Function()? onClickCallback;
  final Function(Map<String, dynamic>)? onSubmit;

  List<Map<String, dynamic>> radioInputOptions;
  dynamic radioInputInitValue;

  FormReportPDFTemplatesSearchFilter({
    Key? key,
    this.onClickCallback,
    required this.onSubmit,
    //
    this.radioInputOptions = const [
      {'text': 'Any', 'value': null},
      {'text': 'Yes', 'value': true},
      {'text': 'No', 'value': false},
    ],
    this.radioInputInitValue = null,
  }) : super(key: key);

  @override
  State<FormReportPDFTemplatesSearchFilter> createState() =>
      _FormReportPDFTemplatesSearchFilterState();
}

class _FormReportPDFTemplatesSearchFilterState
    extends State<FormReportPDFTemplatesSearchFilter> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool _isFormValid = false;

  dynamic _radioInputValue;

  @override
  void initState() {
    super.initState();

    if (widget.radioInputInitValue != null) {
      _radioInputValue = widget.radioInputInitValue;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _radioInputValue != null && _radioInputValue!.isNotEmpty;
    });
  }

  void _resetForm() {
    setState(() {
      _radioInputValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 300), // Fixed width
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Wrap content vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Is System?'),
              const SizedBox(height: 10),
              _buildIsSystemRadioGroupInput(),
              const SizedBox(height: 20),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
      //
    );
  }

  _buildLabel(String text) {
    return MyCustomFormLabel(
      textWidget: Text(
        text,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        print('tapped');
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildIsSystemRadioGroupInput() {
    return MyCustomFormRadioGroupInput(
      inputKey: 'radio_group',
      name: 'radioGroupInput',
      options: widget.radioInputOptions,
      initialValue: widget.radioInputInitValue,
      validator: (value) {
        if (value == null) return 'Please select an option';
        return null;
      },
      onChanged: (value) {
        setState(() {
          _radioInputValue = value;
        });
        _validateForm();
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildSubmitButton() {
    return MyCustomFormSubmitButton(
      isDisabled: !_isFormValid,
      key: const Key('submitButton'),
      text: 'APPLY',
      onTap: () async {
        final data = {
          'isSystem': _radioInputValue,
        };
        if (_isFormValid) {
          widget.onSubmit!(data);
          // _resetForm();
        }
        print(data);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }
}
