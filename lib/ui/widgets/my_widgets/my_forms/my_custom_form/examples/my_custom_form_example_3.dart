import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/form_layouts/form_layout_1.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label_button.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_signature_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_checkbox_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_dropdown_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_radio_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_range_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_slider_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_switch_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_textarea_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class MyCustomFormExample3 extends StatefulWidget {
  final Map<String, dynamic>? initialValues;
  final Function()? onClickForgotPassword;
  final Function(Map<String, dynamic>)? onSubmit;

  MyCustomFormExample3({
    Key? key,
    this.initialValues,
    this.onClickForgotPassword,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<MyCustomFormExample3> createState() => _MyCustomFormExample3State();
}

class _MyCustomFormExample3State extends State<MyCustomFormExample3> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  // Form Variables

  bool _isFormValid = false;

  List<String> invalidInputs = [];

  // Text Controller Variables

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _textareaController;

  // Form Values Variables

  RangeValues? _rangeInputValues;
  double? _rangeInputMinValue;
  double? _rangeInputMaxValue;
  double? _sliderInputValue;
  bool? _switchInputValue;
  String? _dropdownInputValue;
  List<dynamic>? _checkboxInputValue;
  String? _radioInputValue;
  ui.Image? _signatureImageValue;
  List<Offset?>? _signaturePointsValue;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    // _populateInitialValues();
    // _validateForm();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _textareaController = TextEditingController();
  }

  void _disposeControllers() {
    _emailController.dispose();
    _passwordController.dispose();
    _textareaController.dispose();
  }

  void _populateInitialValues() {
    if (widget.initialValues != null) {
      Map<String, dynamic>? initialValues = widget.initialValues;
    }
  }

  void _validateForm() {
    var validate = Validation();
    setState(() {
      _isFormValid = validate.isEmail(_emailController.text) == true &&
          validate.isRequiredFieldOk(_passwordController.text) == true &&
          validate.isRequiredFieldOk(_textareaController.text) == true &&
          _rangeInputValues != null &&
          _rangeInputMinValue != null &&
          _rangeInputMinValue! > 0 &&
          _rangeInputMaxValue != null &&
          _rangeInputMaxValue! > 0 &&
          _sliderInputValue != null &&
          _switchInputValue != null &&
          _dropdownInputValue != null &&
          _dropdownInputValue?.isNotEmpty == true &&
          _checkboxInputValue != null &&
          _checkboxInputValue!.isNotEmpty &&
          _radioInputValue != null &&
          _radioInputValue?.isNotEmpty == true &&
          _signatureImageValue != null &&
          _signaturePointsValue != null;
    });
  }

  void _resetForm() {
    setState(() {
      _emailController.text = '';
      _passwordController.text = '';
      _textareaController.text = '';

      _rangeInputValues = null;
      _rangeInputMinValue = null;
      _rangeInputMaxValue = null;
      _sliderInputValue = null;
      _switchInputValue = null;
      _dropdownInputValue = ''; // '' or null ???
      _checkboxInputValue = [];
      _radioInputValue = ''; // '' or null ???
      _signatureImageValue = null;
      _signaturePointsValue = null;
    });
  }

  Map<String, dynamic> _getFormValues() {
    return {
      'email': _emailController.text,
      'password': _passwordController.text,
      'textarea': _textareaController.text,
      'rangeValues': _rangeInputValues,
      'rangeMin': _rangeInputMinValue,
      'rangeMax': _rangeInputMaxValue,
      'slider': _sliderInputValue,
      'switch': _switchInputValue,
      'dropdown': _dropdownInputValue,
      'checkbox': _checkboxInputValue,
      'radio': _radioInputValue,
      'imageSignature': _signatureImageValue,
      'signaturePoints': _signaturePointsValue,
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
    // return MyCustomFormLayout1();

    return FormBuilder(
      key: formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: MyCustomFormLayout1(
        // Show/Hide Rows
        row1ChildVisible: true,
        row2Column1ChildVisible: true,
        row2Column2ChildVisible: true,
        row3ChildVisible: true,
        // Rows
        row1Child: Container(
          color: Colors.blueGrey,
          padding: const EdgeInsets.all(16),
          child: const Text(
            'Please fill the next form',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        row2Column1Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildLabel(),
              const SizedBox(height: 20),
              _buildLabelButton(),
              const SizedBox(height: 20),
              _buildEmailTextInput(),
              const SizedBox(height: 20),
              _buildPasswordTextInput(),
              const SizedBox(height: 20),
              _buildTextAreaInput(),
              const SizedBox(height: 20),
              _buildRangeInput(),
              const SizedBox(height: 20),
              _buildSliderInput(),
              const SizedBox(height: 20),
              _buildSwitchInput(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        row2Column2Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildDropdownInput(),
              const SizedBox(height: 20),
              _buildCheckboxGroupInput(),
              const SizedBox(height: 20),
              _buildRadioGroupInput(),
              const SizedBox(height: 20),
              _buildSingatureInput(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        row3Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: _buildSubmitButton(),
        ),
      ),
    );
  }

  _buildLabel() {
    return MyCustomFormLabel(
      onTap: () {
        print('tapped');
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildLabelButton() {
    return MyCustomFormLabelButton(
      onClick: () {
        print('label button clicked');
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildEmailTextInput() {
    return MyCustomFormTextInput(
      controller: _emailController,
      inputKey: 'email',
      name: 'email',
      initialValue: '',
      hintText: AppLocalizations.of(context)!.emailTXT,
      validator: (value) {
        dynamic emailValidation = Validation().isEmail(value);
        if (emailValidation != true) return emailValidation;
        return null;
      },
      onChanged: (value) {
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildPasswordTextInput() {
    return MyCustomFormTextInput(
      controller: _passwordController,
      inputKey: 'password',
      name: 'password',
      initialValue: '',
      hintText: AppLocalizations.of(context)!.passwordTXT,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        _actionsOnInputChanged(value);
      },
      shouldHideText: true,
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildTextAreaInput() {
    return MyCustomFormTextareaInput(
      controller: _textareaController,
      inputKey: 'textarea',
      name: 'textarea',
      initialValue: '',
      hintText: AppLocalizations.of(context)!.descriptionTXT,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildRangeInput() {
    return MyCustomFormRangeInput(
      inputKey: 'range_input',
      name: 'Select a Range',
      minValue: 0,
      maxValue: 200,
      onChanged: (ranges) {
        setState(() {
          _rangeInputValues = ranges;
          _rangeInputMinValue = ranges.start;
          _rangeInputMaxValue = ranges.end;
        });
        _actionsOnInputChanged(ranges);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildSliderInput() {
    return MyCustomFormSliderInput(
      inputKey: 'slider_input',
      name: 'Select a Value',
      minValue: 0,
      maxValue: 200,
      initialValue: 80.00,
      onChanged: (value) {
        setState(() {
          _sliderInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildSwitchInput() {
    return MyCustomFormSwitchInput(
      inputKey: 'switch_input',
      name: 'Confirm',
      initialValue: false,
      onChanged: (value) {
        setState(() {
          _switchInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildDropdownInput() {
    return MyCustomFormDropdownInput(
      inputKey: 'dropdown_input',
      name: 'Select an Option',
      // enabled: false,
      options: const [
        {'text': 'Option 1', 'value': 'opt1'},
        {'text': 'Option 2', 'value': 'opt2'},
        {'text': 'Option 3', 'value': 'opt3'},
      ],
      initialValue: null, // Pre-select 'Option 1' or ''
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        print(value);
        setState(() {
          _dropdownInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildCheckboxGroupInput() {
    return MyCustomFormCheckboxGroupInput(
      inputKey: 'checkbox_group',
      name: 'checkboxGroupInput',
      // enabled: false,
      options: [
        {'text': 'Option 1', 'value': '1'},
        {'text': 'Option 2', 'value': '2'},
        {'text': 'Option 3', 'value': '3'},
      ],
      // Pre-select 'Option 1' or no option by setting empty list []
      initialValues: ['1'],
      onChanged: (values) {
        print(values);
        setState(() {
          _checkboxInputValue = values;
        });
        _actionsOnInputChanged(values);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildRadioGroupInput() {
    return MyCustomFormRadioGroupInput(
      inputKey: 'radio_group',
      name: 'radioGroupInput',
      options: const [
        {'text': 'Option 1', 'value': '1'},
        {'text': 'Option 2', 'value': '2'},
        {'text': 'Option 3', 'value': '3'},
      ],
      // Pre-select 'Option 1' or no option by setting empty list []
      initialValue: '2', // Pre-select 'Option 1' or ''
      validator: (value) {
        if (value == null) return 'Please select an option';
        return null;
      },
      onChanged: (value) {
        print(value);
        setState(() {
          _radioInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildSingatureInput() {
    return MyCustomFormSignatureInput(
      name: 'signature_input',
      onChanged: (image, points) {
        print('signature image:');
        print(image);
        print('signature points:');
        print(points);
        setState(() {
          _signatureImageValue = image; // Store the signature image
          _signaturePointsValue = points;
        });
        _actionsOnInputChanged(points);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildSubmitButton() {
    return MyCustomFormSubmitButton(
      isDisabled: !_isFormValid,
      key: const Key('submitButton'),
      onTap: () async {
        final data = _getFormValues();
        print(data);
        print(_isFormValid);
        if (_isFormValid) {
          widget.onSubmit!(data);
          // _resetForm();
        }
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // containerWidth: MediaQuery.of(context).size.width * 0.5,
      containerWidth: 200,
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }
}

// Summary of containers:
// • Wrap: Great if your items can wrap to multiple lines.
// • Flexible/Expanded: Works well in a column layout within a flexible parent, like a SingleChildScrollView.
// • IntrinsicHeight: Good for smaller layouts where dynamic resizing is needed without scrolling.
// These options will prevent overflow and make the Container adapt to fit all contents based on available space and parent constraints.
