import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_radio_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class FormEquipmentCategoriesOrderBy extends StatefulWidget {
  final Function()? onClickCallback;
  final Function(String)? onSubmit;

  final List<Map<String, dynamic>> radioInputOptions;
  final String? radioInputInitValue;

  FormEquipmentCategoriesOrderBy({
    Key? key,
    this.onClickCallback,
    required this.onSubmit,
    //
    this.radioInputOptions = const [
      {'text': 'Name A-Z', 'value': 'name-asc'},
      {'text': 'Name Z-A', 'value': 'name-desc'},
    ],
    this.radioInputInitValue = 'name-asc',
  }) : super(key: key);

  @override
  State<FormEquipmentCategoriesOrderBy> createState() =>
      _FormEquipmentCategoriesOrderByState();
}

class _FormEquipmentCategoriesOrderByState
    extends State<FormEquipmentCategoriesOrderBy> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool _isFormValid = false;

  String? _radioInputValue;

  @override
  void initState() {
    super.initState();

    // if (widget.radioInputInitValue != null &&
    //     widget.radioInputInitValue.toString().isNotEmpty) {
    //   _radioInputValue = widget.radioInputInitValue;
    // }
    _radioInputValue = widget.radioInputInitValue;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid =
          _radioInputValue != null && _radioInputValue?.isNotEmpty == true;
    });
  }

  void _resetForm() {
    setState(() {
      _radioInputValue = '';
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
              _buildRadioGroupInput(),
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

  _buildRadioGroupInput() {
    return MyCustomFormRadioGroupInput(
      inputKey: 'radio_group',
      name: 'radioGroupInput',
      options: widget.radioInputOptions,
      // Pre-select 'Option 1' or no option by setting empty list []
      initialValue: _radioInputValue, // Pre-select 'Option 1' or ''
      validator: (value) {
        if (value == null) {
          return 'Please select an option';
        }
        return null;
      },
      onChanged: (newValue) {
        setState(() {
          _radioInputValue = newValue;
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
        if (_isFormValid) {
          widget.onSubmit!(_radioInputValue!);
          // _resetForm();
        }
        // print(_radioInputValue);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }
}
