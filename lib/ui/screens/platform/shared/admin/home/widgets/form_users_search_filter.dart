import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_checkbox_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class FormUsersSearchFilter extends StatefulWidget {
  final Function()? onClickCallback;
  final Function(Map<String, dynamic>)? onSubmit;

  List<String>? rolesCheckboxInputInitValue;

  FormUsersSearchFilter({
    Key? key,
    this.onClickCallback,
    required this.onSubmit,
    //
    this.rolesCheckboxInputInitValue,
  }) : super(key: key);

  @override
  State<FormUsersSearchFilter> createState() => _FormUsersSearchFilterState();
}

class _FormUsersSearchFilterState extends State<FormUsersSearchFilter> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool _isFormValid = false;

  List<dynamic>? _rolesCheckboxInputValue;

  @override
  void initState() {
    super.initState();

    if (widget.rolesCheckboxInputInitValue != null) {
      _rolesCheckboxInputValue = widget.rolesCheckboxInputInitValue;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _rolesCheckboxInputValue != null &&
          _rolesCheckboxInputValue!.isNotEmpty;
    });
  }

  void _resetForm() {
    setState(() {
      _rolesCheckboxInputValue = [];
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
              _buildLabel('User Roles:'),
              const SizedBox(height: 10),
              _buildRolesCheckboxGroupInput(),
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

  _buildRolesCheckboxGroupInput() {
    return MyCustomFormCheckboxGroupInput(
      inputKey: 'checkbox_group',
      name: 'User Roles',
      // enabled: false,
      options: const [
        {'text': 'Admin', 'value': 'admin'},
        {'text': 'Client', 'value': 'client'},
        {'text': 'Engineer', 'value': 'engineer'},
      ],
      // Pre-select 'Option 1' or no option by setting empty list []
      initialValues: [],
      onChanged: (newValues) {
        setState(() {
          _rolesCheckboxInputValue = newValues;
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
          'roles': _rolesCheckboxInputValue,
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
