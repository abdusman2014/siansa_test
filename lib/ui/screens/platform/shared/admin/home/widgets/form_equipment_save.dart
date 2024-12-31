import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/form_layouts/form_layout_1B.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_time_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_checkbox_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_switch_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class FormEquipmentSave extends StatefulWidget {
  final String? authUserRoleId;

  final List<Map<String, dynamic>>? equipmentCategoryOptions;
  final List<Map<String, dynamic>>? equipmentSubcategoryOptions;

  final Map<String, dynamic>? initialValues;
  final Function(Map<String, dynamic>)? onSubmit;

  final bool areInputsDisabled;
  final bool shouldHideSubmitButton;
  final List<String> hiddenInputs;

  final Color themeColor;
  final String? submitButtonText;

  FormEquipmentSave({
    Key? key,
    //
    required this.authUserRoleId,
    //
    this.equipmentCategoryOptions,
    this.equipmentSubcategoryOptions,
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
  State<FormEquipmentSave> createState() => _FormEquipmentSaveState();
}

class _FormEquipmentSaveState extends State<FormEquipmentSave> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  // Form Variables

  bool _isFormValid = false;

  List<String> invalidInputs = [];

  // Text Controller Variables

  late final TextEditingController _idTextController;
  late final TextEditingController _nameTextController;
  late final TextEditingController _lastNameTextController;

  // Form Values Variables

  String? _idInputValue;
  bool? _isSystemInputValue;
  String? _nameInputValue;
  String? _lastNameInputValue;
  List<dynamic>? _equipmentCategoryIdsInputValue;
  List<dynamic>? _equipmentSubcategoryIdsInputValue;

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
    debugPrint('FormEquipmentSave initialValues ${widget.initialValues}');
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _idTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
  }

  void _disposeControllers() {
    _idTextController.dispose();
    _nameTextController.dispose();
    _lastNameTextController.dispose();
  }

  void _populateInitialValues() {
    if (widget.initialValues != null) {
      Map<String, dynamic>? initialValues = widget.initialValues;

      _idTextController.text = initialValues?['id'] ?? '';
      _nameTextController.text = initialValues?['name'] ?? '';
      _lastNameTextController.text = initialValues?['lastName'] ?? '';

      _idInputValue = initialValues?['id'] ?? '';
      _isSystemInputValue = initialValues?['isSystem'] ?? false;
      _nameInputValue = initialValues?['name'] ?? '';
      _equipmentCategoryIdsInputValue = initialValues?['categoryIds'] ?? [];
      _equipmentSubcategoryIdsInputValue =
          initialValues?['subcategoryIds'] ?? [];

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
      if (validate.isRequiredFieldOk(_lastNameTextController.text) != true ||
          validate.isRequiredFieldOk(_lastNameInputValue) != true) {
        invalidInputs.add("LastName");
      }

      // Direct values:

      if (isAuthUserRoleIdDeveloper()) {
        if (_isSystemInputValue == null) {
          invalidInputs.add("Is System");
        }
      }

      if (_equipmentCategoryIdsInputValue == null ||
          _equipmentCategoryIdsInputValue!.isEmpty) {
        invalidInputs.add("Equipment Category Ids");
      }

      if (_equipmentSubcategoryIdsInputValue == null ||
          _equipmentSubcategoryIdsInputValue!.isEmpty) {
        invalidInputs.add("Equipment Subcategory Ids");
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
    //   _equipmentCategoryIdsInputValue = [];
    //   _equipmentSubcategoryIdsInputValue = [];

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
      'lastName': _lastNameInputValue,
      'categoryIds': _equipmentCategoryIdsInputValue,
      'subcategoryIds': _equipmentSubcategoryIdsInputValue,
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
              _buildLabel('Select Equipment Categories'),
              _buildEquipmentCategoriesCheckboxGroupInput(),
            ],
          ),
        ),
        row2Column2Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Last Name"),
              _buildLastNameTextInput(),
              _buildLabel('Select Equipment Subcategories'),
              _buildEquipmentSubcategoriesCheckboxGroupInput(),
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
              if (widget.areInputsDisabled)
                Column(
                  children: [
                    // Text(
                    //   "Please share this with the engineer",
                    //   style:
                    //       TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    // ),
                    QrImageView(
                      data: json.encode(widget.initialValues),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ],
                ),
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

  _buildLastNameTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _lastNameTextController,
      inputKey: 'last_name_text_input',
      name: 'Last Name',
      // hintText: AppLocalizations.of(context)!.nameTXT,
      hintText: '',
      initialValue: _lastNameInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _nameInputValue = _nameTextController.text;
          _lastNameInputValue = value;
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

  _buildEquipmentCategoriesCheckboxGroupInput() {
    return MyCustomFormCheckboxGroupInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'equipment_categories_checkbox_group',
      name: 'Equipment Categories',
      options: widget.equipmentCategoryOptions!,
      initialValues: _equipmentCategoryIdsInputValue,
      onChanged: (values) {
        setState(() {
          _equipmentCategoryIdsInputValue = values;
        });
        _actionsOnInputChanged(values);
      },
    );
  }

  _buildEquipmentSubcategoriesCheckboxGroupInput() {
    return MyCustomFormCheckboxGroupInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'equipment_subcategories_checkbox_group',
      name: 'Equipment Subcategories',
      options: widget.equipmentSubcategoryOptions!,
      initialValues: _equipmentSubcategoryIdsInputValue,
      onChanged: (values) {
        setState(() {
          _equipmentSubcategoryIdsInputValue = values;
        });
        _actionsOnInputChanged(values);
      },
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
        print(_isFormValid);
        if (_isFormValid) {
          widget.onSubmit!(data);
          // _resetForm();
        }
      },
    );
  }
}
