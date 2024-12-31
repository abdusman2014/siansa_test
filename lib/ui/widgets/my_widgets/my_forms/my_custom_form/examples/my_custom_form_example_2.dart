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

class MyCustomFormExample2 extends StatefulWidget {
  final Map<String, dynamic>? initialValues;
  final Function()? onClickForgotPassword;
  final Function(Map<String, dynamic>)? onSubmit;

  MyCustomFormExample2({
    Key? key,
    this.initialValues,
    this.onClickForgotPassword,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<MyCustomFormExample2> createState() => _MyCustomFormExample2State();
}

class _MyCustomFormExample2State extends State<MyCustomFormExample2> {
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

  String? _phoneCountryCode;
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
      _isFormValid = _phoneCountryCode != null &&
          validate.isEmail(_phoneController.text) == true &&
          validate.isEmail(_emailController.text) == true &&
          validate.isRequiredFieldOk(_passwordController.text) == true &&
          validate.isRequiredFieldOk(_textareaController.text) == true &&
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
      _phoneController.text = '';
      _emailController.text = '';
      _passwordController.text = '';
      _textareaController.text = '';

      _phoneCountryCode == null;
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

  // container style used by all inputs
  _getContainerBoxDecoration({double borderRadius = 20}) {
    return BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: Colors.lightGreen, width: 5.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.75),
          blurRadius: 10,
          offset: Offset(2, 2), // Shadow position
        ),
      ],
    );
  }

  // container style used by all inputs (if input is disabled)
  _getContainerBoxDecorationDisabled({double borderRadius = 20}) {
    return BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: Colors.white, width: 5.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.75),
          blurRadius: 10,
          offset: Offset(2, 2), // Shadow position
        ),
      ],
    );
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
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      // Container
      containerPadding: EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(),
      textWidget: Text(
        'Enter some data:',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Icon
      iconWidget: const Icon(
        Icons.info,
        color: Colors.blue,
        size: 50,
      ),
      iconPosition: 'start', // 'start', 'end', 'top', 'bottom'
      iconSpacer: 50,
      onIconTap: () {
        print('Icon tapped');
      },
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildLabelButton() {
    return MyCustomFormLabelButton(
      onClick: () {
        print('label button clicked');
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      containerPadding: EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(),
      clickableTextWidget: const Text(
        'Sign In',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      nonClickableTextWidget: const Text(
        'today for enjoying!',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      clickableTextWidgetPosition: 'bottom', // 'start', 'end', 'top', 'bottom'
      spacerSize: 50,
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
      countryCodeInitValue: '+52',
      phoneNumberInitValue: '1234567890',
      countryCodeValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      phoneNumberValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;

        dynamic maxLengthValidation = Validation().isMaxLengthOk(
          value.toString(),
          10,
        );
        if (maxLengthValidation != true) return maxLengthValidation;

        return null;
      },
      onCountryCodeChanged: (value) {
        print('countryCode: $value');
        setState(() {
          _phoneCountryCode = value;
        });
        _actionsOnInputChanged(value);
      },
      onPhoneNumberChanged: (value) {
        print('phoneNumber: $value');
        _actionsOnInputChanged(value);
      },
      // shouldIncludeCountryCodePlusChar: false,
      // shouldDisplayCountryCodeAndCountryName: true,
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // isDisabled: true,
      // isCountryCodeDisabled: true,
      //
      countryCodeTextStyle:
          const TextStyle(color: Colors.lightBlue, fontSize: 15),
      countryCodeTextStyleDisabled:
          const TextStyle(color: Colors.pink, fontSize: 15),
      phoneNumberTextStyle:
          const TextStyle(color: Colors.lightBlue, fontSize: 15),
      phoneNumberTextStyleDisabled:
          const TextStyle(color: Colors.pink, fontSize: 15),
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(),
      containerBoxDecorationDisabled: _getContainerBoxDecorationDisabled(),
      //
      // DROPDOWN INPUT STYLES >>>>>
      //
      dropdownMaxWidth: 500,
      //
      dropdownInputDecoration: InputDecoration(
        hintText: 'Code',
        labelText: 'C O D E',
        labelStyle:
            TextStyle(color: const ui.Color.fromARGB(255, 132, 133, 131)),
        floatingLabelStyle: TextStyle(color: Colors.purple, fontSize: 16),
        errorStyle: TextStyle(color: Colors.limeAccent, fontSize: 12),
        icon: Icon(
          Icons.flag,
          color: Colors.lightGreen,
        ),
        suffixIcon: Icon(
          Icons.flag,
          color: Colors.lightGreen,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      dropdownInputDecorationDisabled: InputDecoration(
        hintText: 'Code',
        labelText: 'C O D E',
        labelStyle: TextStyle(color: Colors.purple),
        floatingLabelStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
        icon: Icon(
          Icons.flag,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.flag,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      //
      // TEXT INPUT STYLES >>>>>
      //
      inputDecoration: InputDecoration(
        hintText: 'Phone Number',
        labelText: 'P H O N E   N U M B E R',
        labelStyle: TextStyle(color: Colors.lightGreen),
        floatingLabelStyle: TextStyle(color: Colors.purple, fontSize: 16),
        errorStyle: TextStyle(color: Colors.limeAccent, fontSize: 12),
        icon: Icon(
          Icons.phone,
          color: Colors.lightGreen,
        ),
        suffixIcon: Icon(
          Icons.phone,
          color: Colors.lightGreen,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      inputDecorationDisabled: InputDecoration(
        hintText: 'Phone Number',
        labelText: 'P H O N E   N U M B E R',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
        icon: Icon(
          Icons.phone,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.phone,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(),
      containerBoxDecorationDisabled: _getContainerBoxDecorationDisabled(),
      //
      textStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
      textStyleDisabled: TextStyle(color: Colors.pink, fontSize: 16),
      inputDecoration: InputDecoration(
        hintText: 'Email',
        labelText: 'E M A I L',
        labelStyle: TextStyle(color: Colors.lightGreen),
        floatingLabelStyle: TextStyle(color: Colors.purple, fontSize: 16),
        errorStyle: TextStyle(color: Colors.limeAccent, fontSize: 12),
        icon: Icon(
          Icons.email,
          color: Colors.lightGreen,
        ),
        suffixIcon: Icon(
          Icons.email,
          color: Colors.lightGreen,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      inputDecorationDisabled: InputDecoration(
        hintText: 'Email',
        labelText: 'E M A I L',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
        icon: Icon(
          Icons.email,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.email,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(),
      containerBoxDecorationDisabled: _getContainerBoxDecorationDisabled(),
      //
      textStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
      textStyleDisabled: TextStyle(color: Colors.pink, fontSize: 16),
      inputDecoration: InputDecoration(
        hintText: 'Password',
        labelText: 'P A S S W O R D',
        labelStyle: TextStyle(color: Colors.lightGreen),
        floatingLabelStyle: TextStyle(color: Colors.purple, fontSize: 16),
        errorStyle: TextStyle(color: Colors.limeAccent, fontSize: 12),
        icon: Icon(
          Icons.password,
          color: Colors.lightGreen,
        ),
        suffixIcon: Icon(
          Icons.password,
          color: Colors.lightGreen,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      inputDecorationDisabled: InputDecoration(
        hintText: 'Password',
        labelText: 'P A S S W O R D',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
        icon: Icon(
          Icons.password,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.password,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
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
      // isDisabled: true,
      //
      minLines: 5,
      maxLines: 100,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(),
      containerBoxDecorationDisabled: _getContainerBoxDecorationDisabled(),
      //
      textStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
      textStyleDisabled: TextStyle(color: Colors.pink, fontSize: 16),
      inputDecoration: InputDecoration(
        hintText: 'Custom hint text',
        labelText: 'D E S C R I P T I O N',
        labelStyle: TextStyle(color: Colors.lightGreen),
        floatingLabelStyle: TextStyle(color: Colors.purple, fontSize: 16),
        errorStyle: TextStyle(color: Colors.limeAccent, fontSize: 12),
        icon: Icon(
          Icons.description,
          color: Colors.lightGreen,
        ),
        suffixIcon: Icon(
          Icons.description,
          color: Colors.lightGreen,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      inputDecorationDisabled: InputDecoration(
        hintText: 'Custom hint text',
        labelText: 'D E S C R I P T I O N',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.lightBlue, fontSize: 16),
        icon: Icon(
          Icons.description,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.description,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
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
      // isDisabled: true,
      //
      // showButton: false, // Hides the button
      // showColorBox: false, // Shows the color box
      // disableButtonText: true,
      //
      // // Container
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      // // Elevated Button
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      elevatedButtonTextWidget: const Text(
        'Select Color',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Select Color :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      elevatedButtonTextWidgetIFSelectedColor: Text(
        'Change Color',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabledIFSelectedColor: Text(
        'Change Color :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      // // Selected Color Container
      //
      selectedColorContainerWidth: 40,
      selectedColorContainerHeight: 40,
      //
      selectedColorContainerBorder: Border.all(
          color: Colors.lightGreen,
          width: 5.0,
          strokeAlign: BorderSide.strokeAlignOutside),
      selectedColorContainerBorderDisabled: Border.all(
          color: Colors.red,
          width: 5.0,
          strokeAlign: BorderSide.strokeAlignOutside),
      //
      selectedColorContainerBorderRadius: BorderRadius.circular(100),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      //
      iconWidget: const Icon(
        Icons.palette,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.palette,
        color: Colors.orange.shade200,
        size: 20,
      ),
      //
      alertDialogStyle: AlertDialogStyle(
        backgroundColor: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.0),
      ),
      alertDialogSelectButtonTextStyle: TextStyle(
        color: Colors.blueGrey.shade700,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      alertDialogSelectButtonTextWidget: const Text(
        'SELECT COLOR',
        style: const TextStyle(color: Colors.blue),
      ),
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
      // isDisabled: true,
      //
      // ratingPoints: 10,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      iconSize: 30.0,
      iconColor: Colors.lightGreen,
      iconColorDisabled: Colors.grey.shade100,
      filledIcon: Icons.thumb_up,
      unfilledIcon: Icons.thumb_down_outlined,
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Select Date & Time',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Select Date & Time :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      iconWidget: const Icon(
        Icons.calendar_today_outlined,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.calendar_today_outlined,
        color: Colors.orange.shade200,
        size: 20,
      ),
      //
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.black,
        headerForegroundColor: Colors.white,
        dayStyle: TextStyle(color: Colors.green),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.black,
        dialTextColor: Colors.blue.shade900,
      ),
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Select Date',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Select Date :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      iconWidget: const Icon(
        Icons.date_range,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.date_range,
        color: Colors.orange.shade200,
        size: 20,
      ),
      //
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.black,
        yearStyle: TextStyle(color: Colors.blue.shade900),
        dayStyle: TextStyle(color: Colors.white),
      ),
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
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Date Range',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Date Range :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      iconWidget: const Icon(
        Icons.calendar_month_sharp,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.calendar_month_sharp,
        color: Colors.orange.shade200,
        size: 20,
      ),
      //
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.black,
        dayStyle: TextStyle(color: Colors.white),
        headerHeadlineStyle: TextStyle(color: Colors.yellow),
      ),
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Select Time',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Select Time :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      //
      iconWidget: const Icon(
        Icons.timer_3_outlined,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.timer_3_outlined,
        color: Colors.orange.shade200,
        size: 20,
      ),
      //
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.black,
        dialTextColor: Colors.blue.shade900,
      ),
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
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Time Range',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Time Range :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      iconWidget: const Icon(
        Icons.timer,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.timer,
        color: Colors.orange.shade200,
        size: 20,
      ),
      //
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: Colors.black,
        hourMinuteColor: Colors.yellow,
        dialHandColor: Colors.red,
      ),
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Pick Files',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Pick Files :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      iconWidget: const Icon(
        Icons.file_open,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.file_open,
        color: Colors.orange.shade200,
        size: 20,
      ),
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }

  _buildImagePickerInput() {
    return MyCustomFormImagePickerInput(
      inputKey: 'image_picker_input',
      // name: 'Pick Your Images',
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
      // isDisabled: true,
      //
      // imageSource: 'camera', // 'gallery' or 'camera'
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      elevatedButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonStyleDisabled: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.yellow.shade200,
        padding: const EdgeInsets.all(25),
        // shape: CircleBorder(), // Makes the button circular
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      //
      // disableButtonText: true,
      elevatedButtonTextWidget: const Text(
        'Pick Image',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTextWidgetDisabled: Text(
        'Pick Image :(',
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      iconSpace: 10,
      iconPosition: 'top', // 'start', 'end', 'top', 'bottom'
      iconWidget: const Icon(
        Icons.image_outlined,
        color: Colors.lightGreen,
        size: 20,
      ),
      iconWidgetDisabled: Icon(
        Icons.image_outlined,
        color: Colors.orange.shade200,
        size: 20,
      ),
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
      // isDisabled: true,
      //
      // showRangesText: false,
      // rangesTextPosition: 'topCenter',
      //
      rangesSeparator: '-----',
      rangesTextStyle: TextStyle(color: Colors.white),
      rangesTextStyleDisabled: TextStyle(color: Colors.red),
      //
      inactiveTrackColor: Colors.lightGreen.shade100,
      inactiveTrackColorDisabled: Colors.red.shade200,
      activeTrackColor: Colors.green,
      activeTrackColorDisabled: Colors.red,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      sliderTheme: const SliderThemeData(
        trackHeight: 4,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
      ),
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
      // isDisabled: true,
      //
      // showValueText: false,
      // valueTextPosition: 'topCenter',
      //
      valueTextStyle: TextStyle(color: Colors.white),
      valueTextStyleDisabled: TextStyle(color: Colors.red),
      //
      inactiveTrackColor: Colors.lightGreen.shade100,
      inactiveTrackColorDisabled: Colors.red.shade200,
      activeTrackColor: Colors.green,
      activeTrackColorDisabled: Colors.red,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      sliderTheme: const SliderThemeData(
        trackHeight: 4,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
      ),
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(20),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      textWidget: const Text(
        'Are you sure?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      textWidgetDisabled: const Text(
        'Are you sure? :(',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      //
      // Customized Colors and Text Styles:
      activeTrackColor: Colors.green.shade200,
      activeTrackColorDisabled: Colors.purple.shade200,
      //
      activeThumbColor: Colors.green,
      activeThumbColorDisabled: Colors.purple.shade500,
      //
      inactiveTrackColor: Colors.orange.shade200,
      inactiveTrackColorDisabled: Colors.pink.shade200,
      //
      inactiveThumbColor: Colors.orange,
      inactiveThumbColorDisabled: Colors.pink.shade500,
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
        setState(() {
          _dropdownInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(16),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 100),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 100),
      //
      inputDecoration: InputDecoration(
        labelText: 'Language',
        labelStyle: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior
            .always, // 'FloatingLabelBehavior.always' removes the floating label animation
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.blue, width: 10.0),
        ),
        contentPadding: EdgeInsets.all(16.0),
      ),
      inputDecorationDisabled: InputDecoration(
        labelText: 'Language (disabled)',
        labelStyle: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior
            .always, // 'FloatingLabelBehavior.always' removes the floating label animation
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.blue, width: 10.0),
        ),
        contentPadding: EdgeInsets.all(16.0),
      ),
      //
      dropdownItemsAlignment: AlignmentDirectional.center,
      dropdownTextStyle: const TextStyle(
        color: Colors.red,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
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
        setState(() {
          _checkboxInputValue = values;
        });
        _actionsOnInputChanged(values);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(16),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 50),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 50),
      //
      isHorizontal: true, // Checkboxes laid out horizontally
      checkboxSize: 50.0, // Adjust the size of the checkbox
      checkboxTextSpacing: 30.0, // Adjust this value as needed
      checkboxContentPadding: EdgeInsets.all(5),
      // // Rounded corners for the tile
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      // // Rounded corners for the checkbox itself
      // checkboxShape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(6.0),
      // ),
      //
      labelStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelStyleDisabled: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade600,
      ),
      //
      // active icon color
      checkColor: Colors.white,
      checkColorDisabled: Colors.grey.shade500,
      //
      // active bg color
      activeColor: Colors.lightGreen,
      activeColorDisabled: Colors.black45,
      //
      // inactive bg color
      // fillColor: WidgetStateProperty.all(Colors.grey.shade400),
      fillColor: WidgetStateProperty.all(Colors.lightBlueAccent),
      fillColorDisabled: WidgetStateProperty.all(Colors.blue),
      //
      // inactive border color, if active no border color displayed
      unselectedBorderSide: BorderSide(color: Colors.purple, width: 2.0),
      unselectedBorderSideDisabled: BorderSide(color: Colors.red, width: 2.0),
      //
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
        setState(() {
          _radioInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // EDIT STYLES -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(16),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 50),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 50),
      //
      isHorizontal: true, // Checkboxes laid out horizontally
      radioSize: 50.0, // Adjust the size of the checkbox
      radioTextSpacing: 10.0, // Adjust this value as needed
      //
      labelStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelStyleDisabled: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      //
      activeColor: Colors.green,
      activeColorDisabled: Colors.black,
      //
      // Border radio to fill if its unchecked
      fillColor: WidgetStateProperty.all(Colors.lightGreen.shade200),
      fillColorDisabled: WidgetStateProperty.all(Colors.blueGrey),
      //
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
      // isDisabled: true,
      //
      containerPadding: const EdgeInsets.all(16),
      containerBoxDecoration: _getContainerBoxDecoration(borderRadius: 25),
      containerBoxDecorationDisabled:
          _getContainerBoxDecorationDisabled(borderRadius: 25),
      //
      containerWidth: 450,
      containerHeight: 150,
      //
      // columnCrossAxisAlignment: CrossAxisAlignment.end,
      //
      titleTextWidget: const Text(
        'Sign here...',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleTextWidgetDisabled: const Text(
        'Sign (disabled)',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      buttonTextWidget: const Text(
        'Clear singature here',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTextWidgetDisabled: const Text(
        'Clear (disabled)',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.black54,
      ),
      buttonStyleDisabled: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      //
      paintColor: Colors.limeAccent,
      paintWidth: 12,
      //
      topSpacerHeight: 2,
      bottomSpacerHeight: 2,
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
      text: 'MY SUBMIT BTN', // textWidget will override this
      textWidget: Text(
        // AppLocalizations.of(context)!.submitText,
        'Submit >>>',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textWidgetDisabled: Text(
        // AppLocalizations.of(context)!.submitText,
        'Submit >',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        ),
      ),
      boxDecoration: BoxDecoration(
        color: Colors.green,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.75),
            offset: const Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      boxDecorationDisabled: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(1)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.75),
            offset: const Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    );
  }
}
