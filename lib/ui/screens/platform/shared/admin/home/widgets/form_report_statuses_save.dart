import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/form_layouts/form_layout_1B.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_color_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_time_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_checkbox_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_switch_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';
import 'package:siansa_app/utilities/conversions/colors/color_conversions.dart';

class FormReportStatusesSave extends StatefulWidget {
  final String? authUserRoleId;

  final Map<String, dynamic>? initialValues;
  final Function(Map<String, dynamic>)? onSubmit;

  final bool areInputsDisabled;
  final bool shouldHideSubmitButton;
  final List<String> hiddenInputs;

  final Color themeColor;
  final String? submitButtonText;

  FormReportStatusesSave({
    Key? key,
    //
    required this.authUserRoleId,
    //
    this.initialValues,
    required this.onSubmit,
    //
    this.areInputsDisabled = false,
    this.shouldHideSubmitButton = false,
    this.hiddenInputs = const [],
    //
    this.themeColor = Colors.green,
    this.submitButtonText,
  }) : super(key: key);

  @override
  State<FormReportStatusesSave> createState() => _FormReportStatusesSaveState();
}

class _FormReportStatusesSaveState extends State<FormReportStatusesSave> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  // Form Variables

  bool _isFormValid = false;

  List<String> invalidInputs = [];

  // Text Controller Variables

  late final TextEditingController _idTextController;
  late final TextEditingController _nameTextController;

  // Form Values Variables

  String? _idInputValue;
  bool? _isSystemInputValue;
  String? _nameInputValue;
  dynamic _statusColorPickerInputValue;
  String? _statusColorHEXValue;

  DateTime? _createdAtInputValue;
  DateTime? _modifiedAtInputValue;
  int? _createdAtIntValue;
  int? _modifiedAtIntValue;

  // Conditional Variables

  bool isAuthUserRoleIdDeveloper() {
    return widget.authUserRoleId == UserRoleIdsConstants.DEVELOPER_ROLE_ID
        ? true
        : false;
  }

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _populateInitialValues();
    // _validateForm();
    debugPrint('FormReportStatusesSave initialValues ${widget.initialValues}');
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _idTextController = TextEditingController();
    _nameTextController = TextEditingController();
  }

  void _disposeControllers() {
    _idTextController.dispose();
    _nameTextController.dispose();
  }

  void _populateInitialValues() {
    if (widget.initialValues != null) {
      Map<String, dynamic>? initialValues = widget.initialValues;

      _idTextController.text = initialValues?['id'] ?? '';
      _nameTextController.text = initialValues?['name'] ?? '';

      _idInputValue = initialValues?['id'] ?? '';
      _isSystemInputValue = initialValues?['isSystem'] ?? false;
      _nameInputValue = initialValues?['name'] ?? '';

      if (initialValues!['color'] != null) {
        _statusColorHEXValue = initialValues['color'];
        _statusColorPickerInputValue =
            ColorConversionsUtilities.hexToMaterialColor(_statusColorHEXValue!);
      }

      // _createdAtInputValue = initialValues?['createdAt'];
      // _modifiedAtInputValue = initialValues?['modifiedAt'];

      if (initialValues!['createdAt'] != null) {
        _createdAtInputValue =
            DateTime.fromMillisecondsSinceEpoch(initialValues['createdAt']);
      }
      // else {
      //   _createdAtInputValue = DateTime.now();
      // }

      if (initialValues!['modifiedAt'] != null) {
        _modifiedAtInputValue =
            DateTime.fromMillisecondsSinceEpoch(initialValues['modifiedAt']);
      }
      // else {
      //   _modifiedAtInputValue = DateTime.now();
      // }

      _createdAtIntValue = initialValues?['createdAt'];
      _modifiedAtIntValue = initialValues?['modifiedAt'];

      // _createdAtIntValue =
      //     initialValues['createdAt'] ?? DateTime.now().microsecondsSinceEpoch;
      // _modifiedAtIntValue =
      //     initialValues['modifiedAt'] ?? DateTime.now().microsecondsSinceEpoch;

      /**/
    }
  }

  void _validateForm() {
    var validate = Validation();

    // Update state to track form validity
    setState(() {
      invalidInputs.clear();

      // Text Controllers

      if (isAuthUserRoleIdDeveloper()) {
        if (validate.isRequiredFieldOk(_idTextController.text) != true ||
            validate.isRequiredFieldOk(_idInputValue) != true) {
          invalidInputs.add("ID");
        }
      }

      if (validate.isRequiredFieldOk(_nameTextController.text) != true ||
          validate.isRequiredFieldOk(_nameInputValue) != true) {
        invalidInputs.add("Name");
      }

      // Direct values:

      if (isAuthUserRoleIdDeveloper()) {
        if (_isSystemInputValue == null) {
          invalidInputs.add("Is System");
        }
      }

      // if (isAuthUserRoleIdDeveloper()) {
      //   if (_createdAtInputValue == null) {
      //     invalidInputs.add("Created At");
      //   }
      // }

      // if (isAuthUserRoleIdDeveloper()) {
      //   if (_modifiedAtInputValue == null) {
      //     invalidInputs.add("Modified At");
      //   }
      // }

      // Determine overall form validity
      _isFormValid = invalidInputs.isEmpty;
    });
  }

  void _resetForm() {
    _populateInitialValues();

    // setState(() {
    //   _nameTextController.text = '';

    //   _isSystemInputValue = false;
    //   _nameInputValue = '';
    //   _reportCategoryIdsInputValue = [];

    //   /*

    //   _createdAtInputValue = DateTime.now();
    //   _modifiedAtInputValue = DateTime.now();

    //   _createdAtIntValue = DateTime.now().microsecondsSinceEpoch;
    //   _modifiedAtIntValue = DateTime.now().microsecondsSinceEpoch;

    //   */
    // });
  }

  Map<String, dynamic> _getFormValues() {
    return {
      'id': _idInputValue,
      'isSystem': _isSystemInputValue,
      'name': _nameInputValue,
      'color': _statusColorHEXValue,
      'createdAt': _createdAtIntValue,
      'modifiedAt': _modifiedAtIntValue,
    };
  }

  // shared actions triggered by all inputs when they changed
  _actionsOnInputChanged(value) {
    _validateForm();
    debugPrint('$value');
    debugPrint('_isFormValid: $_isFormValid');
    debugPrint("Invalid Fields: $invalidInputs");
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //
      child: MyCustomFormLayout1B(
        // Show/Hide Rows
        row1ChildVisible: true,
        row2Column1ChildVisible: true,
        row2Column2ChildVisible: true,
        row3ChildVisible: isAuthUserRoleIdDeveloper(),
        row4Column1ChildVisible: isAuthUserRoleIdDeveloper(),
        row4Column2ChildVisible: isAuthUserRoleIdDeveloper(),
        row5ChildVisible: true,

        // Rows
        row1Child: Container(
          color: widget.themeColor,
          padding: const EdgeInsets.all(0), // 16
          child: const Column(
            children: [
              // const Text(
              //   'Please fill the next form',
              //   style: TextStyle(color: Colors.white),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        // row1Child: const SizedBox(height: 20),
        row2Column1Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(AppLocalizations.of(context)!.nameTXT),
              _buildNameTextInput(),
            ],
          ),
        ),
        row2Column2Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Status Color'),
              _buildStatusColorPickerInput(),
            ],
          ),
        ),

        row3Child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Text(
              'DEVELOPER SETTINGS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        row4Column1Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Is System'),
              _buildIsSystemSwitchInput(),
              const SizedBox(height: 20),
              _buildLabel('ID'),
              _buildIdTextInput(),
            ],
          ),
        ),
        row4Column2Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Created At'),
              Row(
                children: [
                  _buildCreatedAtDateTimePickerInput(),
                  const SizedBox(width: 10),
                  if (_createdAtInputValue != null)
                    Text(_createdAtInputValue.toString()),
                  if (_createdAtInputValue == null) const Text('No date.'),
                ],
              ),
              const SizedBox(height: 20),
              _buildLabel('Modified At'),
              Row(
                children: [
                  _buildModifiedAtDateTimePickerInput(),
                  const SizedBox(width: 10),
                  if (_modifiedAtInputValue != null)
                    Text(_modifiedAtInputValue.toString()),
                  if (_modifiedAtInputValue == null) const Text('No date.'),
                ],
              ),
              /*
              const SizedBox(height: 20),
              */
            ],
          ),
        ),

        row5Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (!widget.shouldHideSubmitButton) const SizedBox(height: 20),
              if (!widget.shouldHideSubmitButton) _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  _buildLabel(String text) {
    return MyCustomFormLabel(
      labelText: text,
      labelColor: widget.themeColor,
      onTap: () {
        _actionsOnInputChanged(null);
      },
    );
  }

  _buildStatusColorPickerInput() {
    return MyCustomFormColorPickerInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'status_color_picker_input',
      name: 'Status Color',
      // Display initial color if available
      initialValue: _statusColorPickerInputValue,
      onChanged: (color) {
        String rgba = ColorConversionsUtilities.materialColorToRGBA(color!);
        String hex = ColorConversionsUtilities.materialColorToHEX(color);
        setState(() {
          _statusColorPickerInputValue = color;
          _statusColorHEXValue = hex;
        });
        _actionsOnInputChanged(color);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildIsSystemSwitchInput() {
    return MyCustomFormSwitchInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'is_system_switch_input',
      name: 'Is this data used by the system?',
      initialValue: _isSystemInputValue,
      onChanged: (value) {
        setState(() {
          _isSystemInputValue = value!;
        });
        _actionsOnInputChanged(null);
      },
    );
  }

  _buildNameTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _nameTextController,
      inputKey: 'name_text_input',
      name: 'Name',
      // hintText: AppLocalizations.of(context)!.nameTXT,
      hintText: '',
      initialValue: _nameInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _nameInputValue = _nameTextController.text;
          _nameInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildIdTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _idTextController,
      inputKey: 'id_text_input',
      name: 'ID',
      hintText: '',
      initialValue: _idInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _idInputValue = _idTextController.text;
          _idInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // containerBoxDecorationDisabled: BoxDecoration(
      //   color: Colors.transparent,
      //   border: Border.all(color: Colors.grey.shade100, width: 5.0),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      inputDecorationDisabled: InputDecoration(
        fillColor: Color.fromARGB(255, 247, 247, 247),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      textStyleDisabled: const TextStyle(color: Colors.black),
    );
  }

  _buildCreatedAtDateTimePickerInput() {
    return MyCustomFormDateTimePickerInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'created_at_date_time_picker_input',
      name: 'Select Date',
      initialValue: _createdAtInputValue,
      onChanged: (value) {
        setState(() {
          _createdAtInputValue = value;
          _createdAtIntValue = value!.microsecondsSinceEpoch;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildModifiedAtDateTimePickerInput() {
    return MyCustomFormDateTimePickerInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'modified_at_data_time_picker_input',
      name: 'Select Date',
      initialValue: _modifiedAtInputValue,
      onChanged: (value) {
        setState(() {
          _modifiedAtInputValue = value;
          _modifiedAtIntValue = value!.microsecondsSinceEpoch;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildSubmitButton() {
    return MyCustomFormSubmitButton(
      isDisabled: !_isFormValid,
      key: const Key('submitButton'),
      text: widget.submitButtonText ?? AppLocalizations.of(context)!.saveTXT,
      onTap: () async {
        final data = _getFormValues();
        print(data);
        print('isFormValid? $_isFormValid');
        if (_isFormValid) {
          widget.onSubmit!(data);
          // _resetForm();
        }
      },
    );
  }
}
