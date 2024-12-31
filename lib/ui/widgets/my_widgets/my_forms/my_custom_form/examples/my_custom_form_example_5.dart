import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_range_picker.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_file_picker_drag_and_drop_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label_button.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_phone_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_signature_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_time_range_picker.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_checkbox_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_color_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_time_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_dropdown_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_file_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_image_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_radio_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_range_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_rating_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_slider_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_switch_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_textarea_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_time_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';
import 'package:siansa_app/utilities/conversions/colors/color_conversions.dart';

class MyCustomFormExample5 extends StatefulWidget {
  final Map<String, dynamic>? initialValues;
  final List<Map<String, dynamic>>? dropdownInputOptions;
  final List<Map<String, dynamic>>? checkboxInputOptions;
  final List<Map<String, dynamic>>? radioInputOptions;
  final Function()? onClickForgotPassword;
  final Function(Map<String, dynamic>)? onSubmit;

  const MyCustomFormExample5({
    Key? key,
    this.initialValues,
    required this.dropdownInputOptions,
    required this.checkboxInputOptions,
    required this.radioInputOptions,
    this.onClickForgotPassword,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<MyCustomFormExample5> createState() => _MyCustomFormExample1State();
}

class _MyCustomFormExample1State extends State<MyCustomFormExample5> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  // Form Variables

  bool _isFormValid = false;

  List<String> invalidInputs = [];

  DateTime date18YearsAgo = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

  // Text Controller Variables

  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _textareaController;

  // Form Values Variables

  String _phoneInputValue = '';
  String _emailInputValue = '';
  String _passwordInputValue = '';
  String _textareaInputValue = '';

  String _phoneCountryCodeInputValue = '';

  dynamic _colorPickerInputValue;
  double? _ratingInputValue;

  DateTime? _dateTimePickerInputValue;

  DateTime? _datePickerInputValue;
  DateTimeRange? _dateRangePickerInputValue;
  DateTime? _dateRangePickerInputValueStart;
  DateTime? _dateRangePickerInputValueEnd;

  TimeOfDay? _timePickerInputValue;

  TimeOfDayRange? _timeRangePickerInputValue;
  TimeOfDay? _timeRangePickerInputValueStart;
  TimeOfDay? _timeRangePickerInputValueEnd;

  List<PlatformFile>? _filePickerInputValue;
  XFile? _imagePickerInputValue;

  RangeValues? _rangeInputValues;
  double? _rangeMinValue;
  double? _rangeMaxValue;
  double? _rangeMinSelectedInputValue;
  double? _rangeMaxSelectedInputValue;

  double? _sliderMinValue;
  double? _sliderMaxValue;
  double? _sliderInputValue;

  bool? _switchInputValue;
  String? _dropdownInputValue;
  List<dynamic>? _checkboxInputValue;
  String? _radioInputValue;
  ui.Image? _signatureImageValue;
  List<Offset?>? _signaturePointsInputValue;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _populateInitialValues();
    _validateForm();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _textareaController = TextEditingController();
  }

  void _disposeControllers() {
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _textareaController.dispose();
  }

  void _populateInitialValues() {
    if (widget.initialValues != null) {
      Map<String, dynamic>? initialValues = widget.initialValues;

      _phoneController.text = initialValues?['phone'] ?? '';
      _emailController.text = initialValues?['email'] ?? '';
      _passwordController.text = initialValues?['password'] ?? '';
      _textareaController.text = initialValues?['textarea'] ?? '';

      _phoneInputValue = initialValues?['phone'] ?? '';
      _emailInputValue = initialValues?['email'] ?? '';
      _passwordInputValue = initialValues?['password'] ?? '';
      _textareaInputValue = initialValues?['textarea'] ?? '';

      _phoneCountryCodeInputValue = initialValues?['phoneCountryCode'] ?? '';

      _colorPickerInputValue = initialValues?['color'];
      _ratingInputValue = initialValues?['rating'];

      _dateTimePickerInputValue = initialValues?['dateTime'];

      _datePickerInputValue = initialValues?['date'];

      _dateRangePickerInputValue = initialValues?['dateRange'];
      _dateRangePickerInputValueStart = initialValues?['dateRangeStart'];
      _dateRangePickerInputValueEnd = initialValues?['dateRangeEnd'];

      if (_dateRangePickerInputValueStart != null &&
          _dateRangePickerInputValueEnd != null) {
        _dateRangePickerInputValue = DateTimeRange(
          start: _dateRangePickerInputValueStart!,
          end: _dateRangePickerInputValueEnd!,
        );
      }

      _timePickerInputValue = initialValues?['time'];

      _timeRangePickerInputValue = initialValues?['timeRange'];
      _timeRangePickerInputValueStart = initialValues?['timeRangeStart'];
      _timeRangePickerInputValueEnd = initialValues?['timeRangeEnd'];

      if (_timeRangePickerInputValueStart != null &&
          _timeRangePickerInputValueEnd != null) {
        _timeRangePickerInputValue = TimeOfDayRange(
          start: _timeRangePickerInputValueStart!,
          end: _timeRangePickerInputValueEnd!,
        );
      }

      _rangeMinValue = initialValues?['rangeMin'];
      _rangeMaxValue = initialValues?['rangeMax'];
      _rangeMinSelectedInputValue = initialValues?['rangeMinSelected'];
      _rangeMaxSelectedInputValue = initialValues?['rangeMaxSelected'];

      if (_rangeMinSelectedInputValue != null &&
          _rangeMaxSelectedInputValue != null) {
        _rangeInputValues = RangeValues(
          _rangeMinSelectedInputValue!,
          _rangeMaxSelectedInputValue!,
        );
      }

      _sliderMinValue = initialValues?['sliderMin'] ?? 0;
      _sliderMaxValue = initialValues?['sliderMax'] ?? 100;
      _sliderInputValue = initialValues?['slider'] ?? 50;

      _switchInputValue = initialValues?['switch'];
      _dropdownInputValue = initialValues?['dropdown'];
      _checkboxInputValue = initialValues?['checkbox'];
      _radioInputValue = initialValues?['radio'];
      _signaturePointsInputValue = initialValues?['signaturePoints'];
    }
  }

  void _validateForm() {
    var validate = Validation();

    setState(() {
      invalidInputs.clear();

      // Text Controllers

      if (validate.isRequiredFieldOk(_phoneController.text) != true ||
          validate.isExactLengthOk(_phoneController.text, 10) != true ||
          validate.isRequiredFieldOk(_phoneInputValue) != true ||
          validate.isExactLengthOk(_phoneInputValue, 10) != true) {
        invalidInputs.add("Phone");
      }

      if (validate.isEmail(_emailController.text) != true ||
          validate.isEmail(_emailInputValue) != true) {
        invalidInputs.add("Email");
      }

      if (validate.isRequiredFieldOk(_passwordController.text) != true ||
          validate.isMinLengthOk(_passwordController.text, 8) != true ||
          validate.isRequiredFieldOk(_passwordInputValue) != true ||
          validate.isMinLengthOk(_passwordInputValue, 8) != true) {
        invalidInputs.add("Password");
      }

      if (validate.isRequiredFieldOk(_textareaController.text) != true ||
          validate.isRequiredFieldOk(_textareaInputValue) != true) {
        invalidInputs.add("Textarea");
      }

      if (validate.isRequiredFieldOk(_phoneCountryCodeInputValue) != true) {
        invalidInputs.add("Phone Country Code");
      }

      // Direct values:

      if (_colorPickerInputValue == null) invalidInputs.add("Color");

      if (_ratingInputValue == null) invalidInputs.add("Rating");

      if (_dateTimePickerInputValue == null) invalidInputs.add("Date Time");

      if (_datePickerInputValue == null) invalidInputs.add("Date");

      if (_dateRangePickerInputValue == null) invalidInputs.add("Date Range");

      if (_dateRangePickerInputValueStart == null) {
        invalidInputs.add("Date Range Start");
      }

      if (_dateRangePickerInputValueEnd == null) {
        invalidInputs.add("Date Range End");
      }

      if (_timePickerInputValue == null) invalidInputs.add("Time");

      if (_timeRangePickerInputValue == null) invalidInputs.add("Time Range");

      if (_timeRangePickerInputValueStart == null) {
        invalidInputs.add("Time Range Start");
      }

      if (_timeRangePickerInputValueEnd == null) {
        invalidInputs.add("Time Range End");
      }

      // * Uncomment if you need to configure the minimum and maximum range values from parent widget.
      // * Leave commented if the minimum and maximum range values will be hard-coded in the form.
      // if (_rangeMinValue == null) invalidInputs.add("Range Min");
      // if (_rangeMaxValue == null) invalidInputs.add("Range Max");

      if (_rangeMinSelectedInputValue == null)
        invalidInputs.add("Range Min Selected");
      if (_rangeMaxSelectedInputValue == null)
        invalidInputs.add("Range Max Selected");

      if (_rangeInputValues == null) invalidInputs.add("Range");

      // * Uncomment if you need to configure the minimum and maximum slider values from parent widget.
      // * Leave commented if the minimum and maximum slider values will be hard-coded in the form.
      if (_sliderMinValue == null) invalidInputs.add("Slider Min");
      if (_sliderMaxValue == null) invalidInputs.add("Slider Max");

      if (_sliderInputValue == null) invalidInputs.add("Slider");

      if (_switchInputValue == null) invalidInputs.add("Switch");

      if (_dropdownInputValue == null) invalidInputs.add("Dropdown");

      if (_checkboxInputValue == null) invalidInputs.add("Checkbox");

      if (_radioInputValue == null) invalidInputs.add("Radio");

      if (_signaturePointsInputValue == null) invalidInputs.add("Signature");

      // Determine overall form validity
      _isFormValid = invalidInputs.isEmpty;
    });
  }

  void _resetForm() {
    setState(() {
      _phoneController.text = '';
      _emailController.text = '';
      _passwordController.text = '';
      _textareaController.text = '';

      _phoneInputValue = '';
      _emailInputValue = '';
      _passwordInputValue = '';
      _textareaInputValue = '';

      _phoneCountryCodeInputValue == '';
      _colorPickerInputValue = null;
      _ratingInputValue = null;

      _dateTimePickerInputValue = null;

      _datePickerInputValue = null;

      _dateRangePickerInputValue = null;
      _dateRangePickerInputValueStart = null;
      _dateRangePickerInputValueEnd = null;

      _timePickerInputValue = null;

      _timeRangePickerInputValue = null;
      _timeRangePickerInputValueStart = null;
      _timeRangePickerInputValueEnd = null;

      _filePickerInputValue = null;
      _imagePickerInputValue = null;

      _rangeInputValues = null;
      _rangeMinSelectedInputValue = null;
      _rangeMaxSelectedInputValue = null;

      _sliderInputValue = null;

      _switchInputValue = null;
      _dropdownInputValue = null;
      _checkboxInputValue = null;
      _radioInputValue = null;

      _signatureImageValue = null;
      _signaturePointsInputValue = null;
    });
  }

  Map<String, dynamic> _getFormValues() {
    return {
      'phone':
          '${_phoneCountryCodeInputValue.toString()}${_phoneController.text.toString()}',
      'email': _emailController.text,
      'password': _passwordController.text,
      'textarea': _textareaController.text,
      'color': _colorPickerInputValue,
      'rate': _ratingInputValue,
      'dateTime': _dateTimePickerInputValue,
      'date': _datePickerInputValue,
      'dateRange': _dateRangePickerInputValue,
      'dateRangeStart': _dateRangePickerInputValueStart,
      'dateRangeEnd': _dateRangePickerInputValueEnd,
      'time': _timePickerInputValue,
      'timeRange': _timeRangePickerInputValue,
      'timeRangeStart': _timeRangePickerInputValueStart,
      'timeRangeEnd': _timeRangePickerInputValueEnd,
      'files': _filePickerInputValue,
      'images': _imagePickerInputValue,
      'rangeMinMaxSelectedValues': _rangeInputValues,
      'rangeMinSelectedValue': _rangeMinSelectedInputValue,
      'rangeMaxSelectedValue': _rangeMaxSelectedInputValue,
      'slider': _sliderInputValue,
      'switch': _switchInputValue,
      'dropdown': _dropdownInputValue,
      'checkbox': _checkboxInputValue,
      'radio': _radioInputValue,
      'signatureImage': _signatureImageValue,
      'signaturePoints': _signaturePointsInputValue,
    };
  }

// shared actions triggered by all inputs when they changed
  _actionsOnInputChanged(value) {
    _validateForm();
    debugPrint('----> onInputChanged value:\n$value');
    debugPrint('----> _isFormValid:\n$_isFormValid');
    debugPrint('----> Invalid Fields:\n$invalidInputs');
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildLabel(),
          const SizedBox(height: 20),
          _buildLabelButton(),
          const SizedBox(height: 20),
          _buildPhoneInput(),
          const SizedBox(height: 20),
          _buildEmailTextInput(),
          const SizedBox(height: 20),
          _buildPasswordTextInput(),
          const SizedBox(height: 20),
          _buildTextAreaInput(),
          const SizedBox(height: 20),
          _buildColorPickerInput(),
          const SizedBox(height: 20),
          _buildRatingInput(),
          const SizedBox(height: 20),
          _buildDateTimePickerInput(),
          Text(_dateTimePickerInputValue.toString()),
          const SizedBox(height: 20),
          _buildDatePickerInput(),
          Text(_datePickerInputValue.toString()),
          const SizedBox(height: 20),
          _buildDateRangePickerInput(),
          if (_dateRangePickerInputValue != null &&
              _dateRangePickerInputValue?.start != null &&
              _dateRangePickerInputValue?.end != null)
            Text(_dateRangePickerInputValue!.start.toString()),
          if (_dateRangePickerInputValue != null &&
              _dateRangePickerInputValue?.start != null &&
              _dateRangePickerInputValue?.end != null)
            Text(_dateRangePickerInputValue!.end.toString()),
          const SizedBox(height: 20),
          _buildTimePickerInput(),
          Text(_timePickerInputValue.toString()),
          const SizedBox(height: 20),
          _buildTimeRangeInput(),
          if (_timeRangePickerInputValue != null &&
              _timeRangePickerInputValue?.start != null &&
              _timeRangePickerInputValue?.end != null)
            Text(_timeRangePickerInputValue!.start.toString()),
          if (_timeRangePickerInputValue != null &&
              _timeRangePickerInputValue?.start != null &&
              _timeRangePickerInputValue?.end != null)
            Text(_timeRangePickerInputValue!.end.toString()),
          const SizedBox(height: 20),
          _buildFilePickerInput(),
          const SizedBox(height: 20),
          _buildImagePickerInput(),
          const SizedBox(height: 20),
          _buildRangeInput(),
          const SizedBox(height: 20),
          _buildSliderInput(),
          const SizedBox(height: 20),
          _buildSwitchInput(),
          const SizedBox(height: 20),
          _buildDropdownInput(),
          const SizedBox(height: 20),
          _buildCheckboxGroupInput(),
          const SizedBox(height: 20),
          _buildRadioGroupInput(),
          const SizedBox(height: 20),
          _buildSingatureInput(),
          const SizedBox(height: 20),
          _buildSubmitButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  _buildLabel() {
    return MyCustomFormLabel(
      onTap: () {
        debugPrint('tapped');
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildLabelButton() {
    return MyCustomFormLabelButton(
      onClick: () {
        debugPrint('label button clicked');
        final data = _getFormValues();
        debugPrint('----> Form Values: $data');
        debugPrint('----> isFormValid? $_isFormValid');
        debugPrint('----> invalid inputs are: $invalidInputs');
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildPhoneInput() {
    return MyCustomFormPhoneInput(
      controller: _phoneController,
      inputKey: 'phone_number',
      countryCodeName: 'Code',
      phoneNumberName: 'Phone Number',
      //
      countryCodeHintText: AppLocalizations.of(context)!.countryTXT,
      phoneNumberHintText: AppLocalizations.of(context)!.phoneNumberTXT,
      //
      countryCodeInitValue: _phoneCountryCodeInputValue,
      phoneNumberInitValue: _phoneInputValue,
      //
      countryCodeValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      phoneNumberValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;

        dynamic maxLengthValidation = Validation().isExactLengthOk(
          value.toString(),
          10,
        );
        if (maxLengthValidation != true) return maxLengthValidation;

        return null;
      },
      //
      onCountryCodeChanged: (value) {
        setState(() {
          _phoneCountryCodeInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      onPhoneNumberChanged: (value) {
        setState(() {
          _phoneInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      //
      // shouldIncludeCountryCodePlusChar: false,
      // shouldDisplayCountryCodeAndCountryName: true,
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildEmailTextInput() {
    return MyCustomFormTextInput(
      controller: _emailController,
      inputKey: 'email',
      name: 'Email',
      hintText: AppLocalizations.of(context)!.emailTXT,
      validator: (value) {
        dynamic emailValidation = Validation().isEmail(value);
        if (emailValidation != true) return emailValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          _emailInputValue = value;
        });
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
      name: 'Password',
      hintText: AppLocalizations.of(context)!.passwordTXT,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;

        dynamic minLengthValidation =
            Validation().isMinLengthOk(value.toString(), 8);
        if (minLengthValidation != true) return minLengthValidation;

        return null;
      },
      onChanged: (value) {
        setState(() {
          _passwordInputValue = value;
        });
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
      name: 'Textarea',
      hintText: AppLocalizations.of(context)!.descriptionTXT,
      initialValue: _textareaInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          _textareaInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildColorPickerInput() {
    return MyCustomFormColorPickerInput(
      inputKey: 'color_picker_input',
      name: 'Pick a Color',
      initialValue: _colorPickerInputValue,
      onChanged: (color) {
        setState(() {
          _colorPickerInputValue = color;
        });
        _actionsOnInputChanged(color);

        // // Color Conversions
        // debugPrint('>>>>> materialColor');
        // debugPrint(color);
        // debugPrint('>>>>> materialColorToHEX');
        // String rgba = ColorConversionsUtilities.materialColorToRGBA(color!);
        // debugPrint(rgba);
        // debugPrint('>>>>> materialColorToHEX');
        // String hex = ColorConversionsUtilities.materialColorToHEX(color);
        // debugPrint(hex);
        // debugPrint('>>>>> rgbaToHEX');
        // debugPrint(ColorConversionsUtilities.rgbaToHEX(rgba));
        // debugPrint('>>>>> hexToRGBA');
        // debugPrint(ColorConversionsUtilities.hexToRGBA(hex));
        // debugPrint('>>>>> hexToMaterialColor');
        // debugPrint(ColorConversionsUtilities.hexToMaterialColor(hex));
        // debugPrint('>>>>> rgbaToMaterialColor');
        // debugPrint(ColorConversionsUtilities.rgbaToMaterialColor(rgba));
        // debugPrint('>>>>> detect MaterialColor');
        // debugPrint(ColorConversionsUtilities.detectColorType(color));
        // debugPrint('>>>>> detect RGBA');
        // debugPrint(ColorConversionsUtilities.detectColorType(rgba));
        // debugPrint('>>>>> detect HEX');
        // debugPrint(ColorConversionsUtilities.detectColorType(hex));
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildRatingInput() {
    return MyCustomFormRatingInput(
      inputKey: 'rating_input',
      name: 'Give us a rate!',
      initialValue: _ratingInputValue,
      onChanged: (value) {
        setState(() {
          _ratingInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildDateTimePickerInput() {
    return MyCustomFormDateTimePickerInput(
      inputKey: 'data_time_picker_input',
      name: 'Select Data & Time',
      initialValue: _dateTimePickerInputValue,
      onChanged: (value) {
        setState(() {
          _dateTimePickerInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildDatePickerInput() {
    return MyCustomFormDatePickerInput(
      inputKey: 'date_picker_input',
      name: 'Select Date',
      initialValue: _datePickerInputValue ?? DateTime.now(),
      onChanged: (value) {
        setState(() {
          _datePickerInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildDateRangePickerInput() {
    return MyCustomFormDateRangePickerInput(
      inputKey: 'date_range_picker_input',
      name: 'Select Date Range',
      initialValue: _dateRangePickerInputValue,
      // initialValue: _dateRangePickerInputValue ??
      //     DateTimeRange(
      //       start: DateTime.now().add(Duration(days: 1)),
      //       end: DateTime.now().add(Duration(days: 7)),
      //     ),
      startDateInitValue: _dateRangePickerInputValueStart,
      endDateInitValue: _dateRangePickerInputValueEnd,
      onChanged: (value) {
        // debugPrint('value');
        // debugPrint(value!);
        // debugPrint(value.start);
        // debugPrint(value.end);
        setState(() {
          _dateRangePickerInputValue = value;
          _dateRangePickerInputValueStart = value!.start;
          _dateRangePickerInputValueEnd = value.end;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildTimePickerInput() {
    return MyCustomFormTimePickerInput(
      inputKey: 'time_picker_input',
      name: 'Select Time',
      initialValue: _timePickerInputValue ?? TimeOfDay.now(),
      onChanged: (value) {
        setState(() {
          _timePickerInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildTimeRangeInput() {
    return MyCustomFormTimeRangePickerInput(
      inputKey: 'time_range_input',
      name: 'Select Time Range',
      initialValue: _timeRangePickerInputValue,
      // initialValue: _timeRangePickerInputValue ??
      //     TimeOfDayRange(
      //       start: TimeOfDay(hour: 9, minute: 0),
      //       end: TimeOfDay(hour: 17, minute: 0),
      //     ),
      startTimeInitValue: _timeRangePickerInputValueStart,
      endTimeInitValue: _timeRangePickerInputValueEnd,
      onChanged: (value) {
        // debugPrint('${value?.start}');
        // debugPrint('${value?.end}');
        setState(() {
          _timeRangePickerInputValue = value;
          _timeRangePickerInputValueStart = value?.start;
          _timeRangePickerInputValueEnd = value?.end;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildFilePickerInput() {
    return MyCustomFormFilePickerInput(
      inputKey: 'file_picker_input',
      name: 'Pick Files',
      // allowMultiple: false, // Single file selection
      // allowedExtensions: ['jpg', 'png', 'pdf'], // Allow only specific types
      onChanged: (files) {
        setState(() {
          // _filePickerInputValue = files.cast<String>();
          _filePickerInputValue = files;
        });
        _actionsOnInputChanged(files);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildImagePickerInput() {
    return MyCustomFormImagePickerInput(
      inputKey: 'image_picker_input',
      name: 'Pick Images',
      onChanged: (XFile? image) {
        if (image != null) {
          debugPrint('Selected image path: ${image.path}');
          setState(() {
            _imagePickerInputValue = image;
          });
          _actionsOnInputChanged(image);
        } else {
          debugPrint('No image selected');
        }
        // debugPrint(_imagePickerInputValue);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildRangeInput() {
    return MyCustomFormRangeInput(
      inputKey: 'range_input',
      name: 'Select a Range',
      //
      // Remove the OR comparisons if minValue will be hard-coded in the form
      minValue: _rangeMinValue == null ||
              _rangeMaxValue == null ||
              _rangeMinSelectedInputValue == null ||
              _rangeMaxSelectedInputValue == null
          ? 0.00
          : _rangeMinValue!,
      // Remove the OR comparisons if maxValue will be hard-coded in the form
      maxValue: _rangeMinValue == null ||
              _rangeMaxValue == null ||
              _rangeMinSelectedInputValue == null ||
              _rangeMaxSelectedInputValue == null
          ? 10.00
          : _rangeMaxValue!,
      //
      // Remove the first 2 OR comparisons if minValue and maxValue will be hard-coded in the form
      minInitValue: _rangeMinValue == null ||
              _rangeMaxValue == null ||
              _rangeMinSelectedInputValue == null ||
              _rangeMaxSelectedInputValue == null
          ? 2.00
          : _rangeMinSelectedInputValue!,
      // Remove the first 2 OR comparisons if minValue and maxValue will be hard-coded in the form
      maxInitValue: _rangeMinValue == null ||
              _rangeMaxValue == null ||
              _rangeMinSelectedInputValue == null ||
              _rangeMaxSelectedInputValue == null
          ? 9.00
          : _rangeMaxSelectedInputValue!,
      //
      shouldIncludeDecimals: true,
      //
      onChanged: (ranges) {
        // debugPrint(ranges);
        setState(() {
          _rangeInputValues = ranges;
          _rangeMinSelectedInputValue = ranges.start;
          _rangeMaxSelectedInputValue = ranges.end;
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
      // ** Use the next minValue/maxValue if want min and max values hard coded in the form:
      minValue: _sliderMinValue!,
      maxValue: _sliderMaxValue!,
      initialValue: _sliderInputValue,
      // ** Use the next minValue/maxValue if want min and max values from parent:
      // minValue: (_sliderMinValue == null || _sliderMaxValue == null)
      //     ? 0
      //     : _sliderMinValue!,
      // maxValue: (_sliderMinValue == null || _sliderMaxValue == null)
      //     ? 100
      //     : _sliderMaxValue!,
      // initialValue: (_sliderMinValue != null &&
      //         _sliderMaxValue != null &&
      //         _sliderInputValue != null &&
      //         _sliderInputValue! <= _sliderMaxValue!)
      //     ? _sliderInputValue!
      //     : 50,
      shouldIncludeDecimals: true,
      onChanged: (value) {
        // debugPrint('value: $value');
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
      initialValue: _switchInputValue,
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
      options: widget.dropdownInputOptions ??
          const [
            {'text': 'Option 1', 'value': 'opt1'},
            {'text': 'Option 2', 'value': 'opt2'},
            {'text': 'Option 3', 'value': 'opt3'},
          ],
      initialValue: _dropdownInputValue, // Pre-select 'Option 1' or ''
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        debugPrint(value);
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
      options: widget.checkboxInputOptions ??
          const [
            {'text': 'Option 1', 'value': '1'},
            {'text': 'Option 2', 'value': '2'},
            {'text': 'Option 3', 'value': '3'},
          ],
      // Pre-select 'Option 1' or no option by setting empty list []
      initialValues: _checkboxInputValue,
      onChanged: (values) {
        debugPrint('$values');
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
      options: widget.radioInputOptions ??
          const [
            {'text': 'Option 1', 'value': '1'},
            {'text': 'Option 2', 'value': '2'},
            {'text': 'Option 3', 'value': '3'},
          ],
      // Pre-select 'Option 1' or no option by setting empty list []
      initialValue: _radioInputValue, // Pre-select 'Option 1' or ''
      validator: (value) {
        if (value == null) return 'Please select an option';
        return null;
      },
      onChanged: (value) {
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
      // isDisabled: true,
      // isTitleVisible: false,
      // isClearButtonVisible: false,
      name: 'signature_input',
      initialPointsValue: _signaturePointsInputValue,
      onChanged: (image, points) {
        debugPrint('signature image:');
        debugPrint('$image');
        debugPrint('signature points:');
        debugPrint('$points');
        setState(() {
          _signatureImageValue = image; // Store the signature image
          _signaturePointsInputValue = points;
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
        // debugPrint('----> Form Values:\n$data');
        // debugPrint('----> _isFormValid:\n$_isFormValid');

        if (_isFormValid) {
          widget.onSubmit!(data);
          // _resetForm();
        }
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }
}
