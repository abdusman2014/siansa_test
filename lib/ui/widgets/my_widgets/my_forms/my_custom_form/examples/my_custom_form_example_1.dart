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

class MyCustomFormExample1 extends StatefulWidget {
  final Map<String, dynamic>? initialValues;
  final Function()? onClickForgotPassword;
  final Function(Map<String, dynamic>)? onSubmit;

  MyCustomFormExample1({
    Key? key,
    this.initialValues,
    this.onClickForgotPassword,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<MyCustomFormExample1> createState() => _MyCustomFormExample1State();
}

class _MyCustomFormExample1State extends State<MyCustomFormExample1> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  // Form Variables

  bool _isFormValid = false;

  List<String> invalidInputs = [];

  // Text Controller Variables

  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _textareaController;

  // Form Values Variables

  String _phoneCountryCode = '';
  dynamic _colorPickerInputValue;
  double? _ratingInputValue;

  DateTime? _dateTimePickerInputValue;

  DateTime? _datePickerInputValue;
  DateTimeRange? _dateRangePickerInputValue;

  TimeOfDay? _timePickerInputValue;
  TimeOfDayRange? _timeRangePickerInputValue;

  List<PlatformFile>? _filePickerInputValue;
  XFile? _imagePickerInputValue;
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
    }
  }

  void _validateForm() {
    var validate = Validation();

    setState(() {
      _isFormValid = validate.isEmail(_phoneController.text) == true &&
          validate.isEmail(_emailController.text) == true &&
          validate.isRequiredFieldOk(_passwordController.text) == true &&
          validate.isRequiredFieldOk(_textareaController.text) == true &&
          _phoneCountryCode != null &&
          _phoneCountryCode.isNotEmpty &&
          _colorPickerInputValue != null &&
          _ratingInputValue != null &&
          _ratingInputValue! > 0 &&
          _dateTimePickerInputValue != null &&
          _datePickerInputValue != null &&
          _dateRangePickerInputValue != null &&
          _timePickerInputValue != null &&
          _timeRangePickerInputValue != null &&
          _filePickerInputValue != null &&
          _imagePickerInputValue != null &&
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
      _phoneController.text == '';
      _emailController.text == '';
      _passwordController.text == '';
      _textareaController.text == '';

      _phoneCountryCode == '';
      _colorPickerInputValue = null;
      _ratingInputValue = null;
      _dateTimePickerInputValue = null;

      _datePickerInputValue = null;
      _dateRangePickerInputValue = null;

      _timePickerInputValue = null;
      _timeRangePickerInputValue = null;

      _filePickerInputValue = null;
      _imagePickerInputValue = null;
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
      'phone':
          '${_phoneCountryCode.toString()}${_phoneController.text.toString()}',
      'email': _emailController.text,
      'password': _passwordController.text,
      'textarea': _textareaController.text,
      'color': _colorPickerInputValue,
      'rate': _ratingInputValue,
      'dateTime': _dateTimePickerInputValue,
      'date': _datePickerInputValue,
      'dateRange': _dateRangePickerInputValue,
      'time': _timePickerInputValue,
      'timeRange': _timeRangePickerInputValue,
      'files': _filePickerInputValue,
      'images': _imagePickerInputValue,
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

  _buildPhoneInput() {
    return MyCustomFormPhoneInput(
      controller: _phoneController,
      inputKey: 'phone_number',
      countryCodeName: 'Code',
      phoneNumberName: 'Phone Number',
      countryCodeHintText: AppLocalizations.of(context)!.countryTXT,
      phoneNumberHintText: AppLocalizations.of(context)!.phoneNumberTXT,
      countryCodeInitValue: '',
      phoneNumberInitValue: '',
      countryCodeValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      phoneNumberValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) requiredFieldValidation;

        dynamic maxLengthValidation = Validation().isMaxLengthOk(
          value.toString(),
          10,
        );
        if (maxLengthValidation != true) maxLengthValidation;

        return null;
      },
      onCountryCodeChanged: (value) {
        setState(() {
          _phoneCountryCode = value;
        });
        _actionsOnInputChanged(value);
      },
      onPhoneNumberChanged: (value) {
        _actionsOnInputChanged(value);
      },
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

  _buildColorPickerInput() {
    return MyCustomFormColorPickerInput(
      inputKey: 'color_picker_input',
      name: 'Pick a Color',
      // Display initial color if available
      initialValue: _colorPickerInputValue,
      onChanged: (color) {
        setState(() {
          _colorPickerInputValue = color;
        });
        _actionsOnInputChanged(color);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildRatingInput() {
    return MyCustomFormRatingInput(
      inputKey: 'rating_input',
      name: 'Give us a rate!',
      initialValue: 0.00,
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
      initialValue: DateTime.now(),
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
      initialValue: DateTime.now(),
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
      initialValue: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(days: 7)),
      ),
      onChanged: (value) {
        setState(() {
          _dateRangePickerInputValue = value;
          print(_dateRangePickerInputValue);
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
      initialValue: TimeOfDay.now(),
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
      initialValue: TimeOfDayRange(
        start: TimeOfDay(hour: 9, minute: 0),
        end: TimeOfDay(hour: 17, minute: 0),
      ),
      onChanged: (value) {
        print(value?.start);
        print(value?.end);
        setState(() {
          // _timeRangePickerInputValue = [
          //   value?.start,
          //   value?.end,
          // ] as TimeOfDayRange?;
          _timeRangePickerInputValue = value;
          print(_timeRangePickerInputValue);
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
        print('file_picker_input files');
        print(files);
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
          print('Selected image path: ${image.path}');
          setState(() {
            _imagePickerInputValue = image;
          });
          _actionsOnInputChanged(image);
        } else {
          print('No image selected');
        }
        // print(_imagePickerInputValue);
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
      options: const [
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
      // isDisabled: !_isFormValid,
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
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }
}
