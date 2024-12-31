import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/form_layouts/form_layout_1B.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_date_time_picker_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_phone_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/validation/validation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_text_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_checkbox_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_dropdown_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_radio_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_switch_input.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_label.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/my_custom_form_submit_button.dart';

class FormUsersSave extends StatefulWidget {
  final String? authUserRoleId;

  final List<Map<String, dynamic>>? userRoleOptions;
  final List<Map<String, dynamic>>? accountStatusOptions;

  final Map<String, dynamic>? initialValues;
  final Function(Map<String, dynamic>)? onSubmit;

  final bool areInputsDisabled;
  final bool shouldHideSubmitButton;
  final List<String> hiddenInputs;

  final Color themeColor;
  final String? submitButtonText;

  FormUsersSave({
    Key? key,
    //
    required this.authUserRoleId,
    //
    this.userRoleOptions,
    this.accountStatusOptions,
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
  State<FormUsersSave> createState() => _FormUsersSaveState();
}

class _FormUsersSaveState extends State<FormUsersSave> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  // Form Variables

  bool _isFormValid = false;

  List<String> invalidInputs = [];

  DateTime date18YearsAgo = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

  // Text Controller Variables

  late final TextEditingController _emailTextController;
  late final TextEditingController _usernameTextController;
  late final TextEditingController _phoneNumberTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _confirmPasswordTextController;
  late final TextEditingController _nameTextController;
  late final TextEditingController _lastNameTextController;
  late final TextEditingController _deviceTokenUTextController;
  late final TextEditingController _languageCodeTextController;

  // Form Values Variables

  bool? _isSystemInputValue;
  String? _emailInputValue;
  String? _usernameInputValue;
  String? _phoneNumberInputValue;
  String? _phoneCountryCodeInputValue; // phoneNumberE164
  String? _phoneFullNumberE164InputValue;
  String? _passwordInputValue;
  String? _confirmPasswordInputValue;
  String? _nameInputValue;
  String? _lastNameInputValue;
  String? _fullNameInputValue;
  String? _displayNameInputValue;
  DateTime? _dateOfBirthInputValue;
  String? _userRoleIdInputValue;
  List<dynamic>? _userRoleIdsInputValue;
  String? _photoUrlInputValue;
  String? _accountStatusIdInputValue;
  bool? _isAccountVerifiedInputValue;
  bool? _isEmailVerifiedInputValue;
  bool? _isPhoneVerifiedInputValue;
  bool? _isTwoFactorEnabledInputValue;
  String? _deviceTokenUInputValue;
  String? _languageCodeInputValue;
  DateTime? _lastLoginInputValue;
  DateTime? _createdAtInputValue;
  DateTime? _modifiedAtInputValue;
  int? _lastLoginIntValue;
  int? _createdAtIntValue;
  int? _modifiedAtIntValue;

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
    debugPrint('FormUsersSave initialValues ${widget.initialValues}');
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _emailTextController = TextEditingController();
    _usernameTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _deviceTokenUTextController = TextEditingController();
    _languageCodeTextController = TextEditingController();
  }

  void _disposeControllers() {
    _emailTextController.dispose();
    _usernameTextController.dispose();
    _phoneNumberTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    _nameTextController.dispose();
    _lastNameTextController.dispose();
    _deviceTokenUTextController.dispose();
    _languageCodeTextController.dispose();
  }

  void _populateInitialValues() {
    if (widget.initialValues != null) {
      Map<String, dynamic>? initialValues = widget.initialValues;

      _emailTextController.text = initialValues?['email'] ?? '';
      _usernameTextController.text = initialValues?['username'] ?? '';
      _phoneNumberTextController.text = initialValues?['phone'] ?? '';
      _passwordTextController.text = initialValues?['password'] ?? '';
      _confirmPasswordTextController.text = initialValues?['password'] ?? '';
      _nameTextController.text = initialValues?['name'] ?? '';
      _lastNameTextController.text = initialValues?['lastName'] ?? '';
      _deviceTokenUTextController.text = initialValues?['deviceTokenU'] ?? '';
      _languageCodeTextController.text = initialValues?['languageCode'] ?? '';

      _isSystemInputValue = initialValues?['isSystem'] ?? false;
      _emailInputValue = initialValues?['email'] ?? '';
      _usernameInputValue = initialValues?['username'] ?? '';
      _phoneNumberInputValue = initialValues?['phoneNumber'] ?? '';
      _phoneCountryCodeInputValue = initialValues?['phoneCountryCode'] ?? '';
      _phoneFullNumberE164InputValue =
          initialValues?['phoneFullNumberE164'] ?? '';
      _passwordInputValue = initialValues?['password'] ?? '';
      _confirmPasswordInputValue = initialValues?['password'] ?? '';
      _nameInputValue = initialValues?['name'] ?? '';
      _lastNameInputValue = initialValues?['lastName'] ?? '';
      _fullNameInputValue = initialValues?['fullName'] ?? '';
      _displayNameInputValue = initialValues?['displayaName'] ?? '';

      // _dateOfBirthInputValue = initialValues?['dateOfBirth'];
      if (initialValues!['dateOfBirth'] != null) {
        if (initialValues['dateOfBirth'] is Timestamp) {
          _dateOfBirthInputValue = initialValues['dateOfBirth'].toDate();
        } else {
          _dateOfBirthInputValue =
              DateTime.fromMillisecondsSinceEpoch(initialValues['dateOfBirth']);
        }
      }

      _userRoleIdInputValue = initialValues?['userRoleId'] ?? '';
      _userRoleIdsInputValue = initialValues?['userRoleIds'] ?? [];
      _photoUrlInputValue = initialValues?['photoUrl'] ?? '';
      _accountStatusIdInputValue = initialValues?['accountStatusId'] ?? '';
      _isAccountVerifiedInputValue =
          initialValues?['isAccountVerified'] ?? false;
      _isEmailVerifiedInputValue = initialValues?['isEmailVerified'] ?? false;
      _isPhoneVerifiedInputValue = initialValues?['isPhoneVerified'] ?? false;
      _isTwoFactorEnabledInputValue =
          initialValues?['isTwoFactorEnabled'] ?? false;
      _deviceTokenUInputValue = initialValues?['deviceTokenU'] ?? '';
      _languageCodeInputValue = initialValues?['languageCode'] ?? '';
    }
  }

  void _validateForm() {
    var validate = Validation();

    // Update state to track form validity
    setState(() {
      invalidInputs.clear();

      // Text Controllers

      if (validate.isEmail(_emailTextController.text) != true ||
          validate.isEmail(_emailInputValue) != true) {
        invalidInputs.add("Email");
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (validate.isRequiredFieldOk(_usernameTextController.text) != true ||
            validate.isRequiredFieldOk(_usernameInputValue) != true) {
          invalidInputs.add("Username");
        }
      }
      if (validate.isRequiredFieldOk(_phoneNumberTextController.text) != true ||
          validate.isPhoneNumber(_phoneNumberTextController.text) != true ||
          validate.isExactLengthOk(_phoneNumberTextController.text, 10) !=
              true ||
          validate.isRequiredFieldOk(_phoneNumberInputValue) != true ||
          validate.isPhoneNumber(_phoneNumberInputValue) != true ||
          validate.isExactLengthOk(_phoneNumberInputValue.toString(), 10) !=
              true) {
        invalidInputs.add("Phone Number");
      }
      if (validate.isRequiredFieldOk(_passwordTextController.text) != true ||
          validate.isRequiredFieldOk(_passwordInputValue) != true ||
          _passwordTextController.text != _confirmPasswordTextController.text ||
          _passwordInputValue != _confirmPasswordInputValue) {
        invalidInputs.add("Password");
      }
      if (validate.isRequiredFieldOk(_confirmPasswordTextController.text) !=
              true ||
          validate.isRequiredFieldOk(_confirmPasswordInputValue) != true ||
          _passwordTextController.text != _confirmPasswordTextController.text ||
          _passwordInputValue != _confirmPasswordInputValue) {
        invalidInputs.add("Confirm Password");
      }
      if (validate.isRequiredFieldOk(_nameTextController.text) != true ||
          validate.isRequiredFieldOk(_nameInputValue) != true) {
        invalidInputs.add("Name");
      }
      if (validate.isRequiredFieldOk(_lastNameTextController.text) != true ||
          validate.isRequiredFieldOk(_lastNameInputValue) != true) {
        invalidInputs.add("Last Name");
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (validate.isRequiredFieldOk(_deviceTokenUTextController.text) !=
                true ||
            validate.isRequiredFieldOk(_deviceTokenUInputValue) != true) {
          invalidInputs.add("Device Token U");
        }
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (validate.isRequiredFieldOk(_languageCodeTextController.text) !=
                true ||
            validate.isRequiredFieldOk(_languageCodeInputValue) != true) {
          invalidInputs.add("Language Code");
        }
      }

      // Direct values:

      if (isAuthUserRoleIdDeveloper()) {
        if (_isSystemInputValue == null) {
          invalidInputs.add("Is System");
        }
      }

      if (_phoneCountryCodeInputValue == null ||
          _phoneCountryCodeInputValue.toString().isEmpty) {
        invalidInputs.add("Phone Country Code");
      }

      // if (_phoneFullNumberE164InputValue == null) {
      //   invalidInputs.add("Phone Full Number E164");
      // }

      // if (_fullNameInputValue == null) {
      //   invalidInputs.add("Full Name");
      // }

      // if (_displayNameInputValue == null) {
      //   invalidInputs.add("Display Name");
      // }

      if (isAuthUserRoleIdDeveloper()) {
        if (_dateOfBirthInputValue == null) {
          invalidInputs.add("Date of Birth");
        }
      }

      if (validate.isRequiredFieldOk(_userRoleIdInputValue) != true) {
        invalidInputs.add("User Role Id");
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (_userRoleIdsInputValue == null || _userRoleIdsInputValue!.isEmpty) {
          invalidInputs.add("User Role Ids");
        }
      }

      // if (_photoUrlInputValue == null) {
      //   invalidInputs.add("Photo Url");
      // }

      if (validate.isRequiredFieldOk(_accountStatusIdInputValue) != true) {
        invalidInputs.add("Account Status Id");
      }

      if (isAuthUserRoleIdDeveloper()) {
        if (_isAccountVerifiedInputValue == null) {
          invalidInputs.add("Is Account Verified");
        }
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (_isEmailVerifiedInputValue == null) {
          invalidInputs.add("Is Email Verified");
        }
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (_isPhoneVerifiedInputValue == null) {
          invalidInputs.add("Is Phone Verified");
        }
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (_isTwoFactorEnabledInputValue == null) {
          invalidInputs.add("Is Two Factor Enabled");
        }
      }

      if (isAuthUserRoleIdDeveloper()) {
        if (_lastLoginInputValue == null) {
          invalidInputs.add("Last Login");
        }
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (_createdAtInputValue == null) {
          invalidInputs.add("Created At");
        }
      }
      if (isAuthUserRoleIdDeveloper()) {
        if (_modifiedAtInputValue == null) {
          invalidInputs.add("Modified At");
        }
      }

      // Determine overall form validity
      _isFormValid = invalidInputs.isEmpty;
    });
  }

  void _resetForm() {
    setState(() {
      _emailTextController.text = '';
      _usernameTextController.text = '';
      _phoneNumberTextController.text = '';
      _passwordTextController.text = '';
      _confirmPasswordTextController.text = '';
      _nameTextController.text = '';
      _lastNameTextController.text = '';
      _deviceTokenUTextController.text = '';
      _languageCodeTextController.text = '';

      _isSystemInputValue = false;
      _emailInputValue = '';
      _usernameInputValue = '';
      _phoneNumberInputValue = '';
      _phoneCountryCodeInputValue = '';
      _phoneFullNumberE164InputValue = '';
      _passwordInputValue = '';
      _confirmPasswordInputValue = '';
      _nameInputValue = '';
      _lastNameInputValue = '';
      _fullNameInputValue = '';
      _displayNameInputValue = '';
      _dateOfBirthInputValue = date18YearsAgo;
      _userRoleIdInputValue = '';
      _userRoleIdsInputValue = [];
      _photoUrlInputValue = '';
      _accountStatusIdInputValue = '';
      _isAccountVerifiedInputValue = false;
      _isEmailVerifiedInputValue = false;
      _isPhoneVerifiedInputValue = false;
      _isTwoFactorEnabledInputValue = false;
      _deviceTokenUInputValue = '';
      _languageCodeInputValue = '';

      /*

      _lastLoginInputValue = DateTime.now();
      _createdAtInputValue = DateTime.now();
      _modifiedAtInputValue = DateTime.now();

      _lastLoginIntValue = DateTime.now().microsecondsSinceEpoch;
      _createdAtIntValue = DateTime.now().microsecondsSinceEpoch;
      _modifiedAtIntValue = DateTime.now().microsecondsSinceEpoch;

      */
    });
  }

  Map<String, dynamic> _getFormValues() {
    return {
      'id': widget.initialValues!['id'],
      'isSystem': _isSystemInputValue,
      'email': _emailInputValue,
      'username': _usernameInputValue,
      'phoneNumber': _phoneNumberInputValue,
      'phoneCountryCode': _phoneCountryCodeInputValue,
      '_phoneFullNumberE164':
          '$_phoneCountryCodeInputValue$_phoneNumberInputValue',
      'password': _passwordInputValue,
      'name': _nameInputValue,
      'lastName': _lastNameInputValue,
      'fullName': '$_nameInputValue $_lastNameInputValue',
      'displayName': _displayNameInputValue,
      'dateOfBirth': _dateOfBirthInputValue,
      'userRoleId': _userRoleIdInputValue,
      'userRoleIds': _userRoleIdsInputValue,
      'accountStatusId': _accountStatusIdInputValue,
      'isAccountVerified': _isAccountVerifiedInputValue,
      'isEmailVerified': _isEmailVerifiedInputValue,
      'isPhoneVerified': _isPhoneVerifiedInputValue,
      'isTwoFactorEnabled': _isTwoFactorEnabledInputValue,
      'deviceTokenU': _deviceTokenUInputValue,
      'languageCode': _languageCodeInputValue,
      // 'lastLogin': _lastLoginIntValue,
      // 'createdAt': _createdAtIntValue,
      // 'modifiedAt': _modifiedAtIntValue,
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
              const SizedBox(height: 20),
              _buildLabel(AppLocalizations.of(context)!.lastNameTXT),
              _buildLastNameTextInput(),
              const SizedBox(height: 20),
              _buildLabel('Select User Role'),
              _buildUserRoleRadioGroupInput(),
              const SizedBox(height: 20),
              _buildLabel('Select Account Status'),
              _buildAccountStatusDropdownInput(),
            ],
          ),
        ),
        row2Column2Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(AppLocalizations.of(context)!.emailTXT),
              _buildEmailTextInput(),
              const SizedBox(height: 20),
              _buildLabel(AppLocalizations.of(context)!.phoneNumberTXT),
              _buildPhoneInput(),
              const SizedBox(height: 20),
              _buildLabel(AppLocalizations.of(context)!.passwordTXT),
              _buildPasswordTextInput(),
              const SizedBox(height: 20),
              _buildLabel(AppLocalizations.of(context)!.confirmPasswordTXT),
              _buildConfirmPasswordTextInput(),
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
              _buildLabel(AppLocalizations.of(context)!.usernameTXT),
              _buildUsernameTextInput(),
              const SizedBox(height: 20),
              _buildLabel(AppLocalizations.of(context)!.birthdateTXT),
              Row(
                children: [
                  _buildDateOfBirthDatePickerInput(),
                  const SizedBox(width: 10),
                  if (_dateOfBirthInputValue != null)
                    Text(_dateOfBirthInputValue.toString()),
                  if (_dateOfBirthInputValue == null) const Text('No date.'),
                ],
              ),
              const SizedBox(height: 20),
              _buildLabel('Last Login'),
              Row(
                children: [
                  _buildLastLoginDateTimePickerInput(),
                  const SizedBox(width: 10),
                  if (_lastLoginInputValue != null)
                    Text(_lastLoginInputValue.toString()),
                  if (_lastLoginInputValue == null) const Text('No date.'),
                ],
              ),
              const SizedBox(height: 20),
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
            ],
          ),
        ),
        row4Column2Child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildLabel('Add Multiple User Roles'),
              // _buildUserRolesCheckboxGroupInput(),
              // const SizedBox(height: 20),
              _buildLabel('Verifications'),
              _buildIsAccountVerifiedSwitchInput(),
              _buildIsEmailVerifiedSwitchInput(),
              _buildIsPhoneVerifiedSwitchInput(),
              _buildIsTwoFactorEnabledSwitchInput(),
              const SizedBox(height: 20),
              _buildLabel('Device Token U'),
              _buildDeviceTokenUTextInput(),
              const SizedBox(height: 20),
              _buildLabel('Language Code'),
              _buildLanguageCodeTextInput(),
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

  _buildEmailTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _emailTextController,
      inputKey: 'email_text_input',
      name: 'Email',
      // hintText: AppLocalizations.of(context)!.emailTXT,
      hintText: '',
      initialValue: _emailInputValue,
      validator: (value) {
        dynamic emailValidation = Validation().isEmail(value);
        if (emailValidation != true) return emailValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _emailInputValue = _emailTextController.text;
          _emailInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildUsernameTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _usernameTextController,
      inputKey: 'username_text_input',
      name: 'Username',
      // hintText: AppLocalizations.of(context)!.usernameTXT,
      hintText: '',
      initialValue: _usernameInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _usernameInputValue = _usernameTextController.text;
          _usernameInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildPhoneInput() {
    return MyCustomFormPhoneInput(
      isDisabled: widget.areInputsDisabled,
      controller: _phoneNumberTextController,
      inputKey: 'phone_number_text_input',
      countryCodeName: 'Code',
      phoneNumberName: 'Phone Number',
      countryCodeHintText: AppLocalizations.of(context)!.countryTXT,
      phoneNumberHintText: AppLocalizations.of(context)!.phoneNumberTXT,
      countryCodeInitValue: _phoneCountryCodeInputValue!,
      phoneNumberInitValue: _phoneNumberInputValue!,
      countryCodeValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      phoneNumberValidator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;

        dynamic lengthValidation = Validation().isExactLengthOk(
          value.toString(),
          10,
        );
        if (lengthValidation != true) return lengthValidation;

        return null;
      },
      onCountryCodeChanged: (value) {
        setState(() {
          _phoneCountryCodeInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      onPhoneNumberChanged: (value) {
        setState(() {
          // _phoneNumberInputValue = _phoneNumberTextController.text;
          _phoneNumberInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      // shouldIncludeCountryCodePlusChar: false,
      // shouldDisplayCountryCodeAndCountryName: true,
    );
  }

  _buildPasswordTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _passwordTextController,
      inputKey: 'password_text_input',
      name: 'Password',
      // hintText: AppLocalizations.of(context)!.passwordTXT,
      hintText: '',
      initialValue: _passwordInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _passwordInputValue = _passwordTextController.text;
          _passwordInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      shouldHideText: true,
    );
  }

  _buildConfirmPasswordTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _confirmPasswordTextController,
      inputKey: 'confirm_password_text_input',
      name: 'Confirm Password',
      // hintText: AppLocalizations.of(context)!.confirmPasswordTXT,
      hintText: '',
      initialValue: _confirmPasswordInputValue,
      validator: (value) {
        if (value != _passwordTextController.text) {
          return AppLocalizations.of(context)!.passwordsDoNotMatchTXT;
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _confirmPasswordInputValue = _confirmPasswordTextController.text;
          _confirmPasswordInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
      shouldHideText: true,
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
      // hintText: AppLocalizations.of(context)!.lastNameTXT,
      hintText: '',
      initialValue: _lastNameInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _lastNameInputValue = _lastNameTextController.text;
          _lastNameInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildDateOfBirthDatePickerInput() {
    return MyCustomFormDatePickerInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'date_of_birth_date_picker_input',
      name: 'Select Date',
      initialValue: _dateOfBirthInputValue ?? DateTime.now(),
      onChanged: (value) {
        setState(() {
          _dateOfBirthInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildUserRoleRadioGroupInput() {
    return MyCustomFormRadioGroupInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'user_role_radio_group',
      name: 'User Role',
      options: widget.userRoleOptions!,
      initialValue: _userRoleIdInputValue,
      validator: (value) {
        if (value == null) return 'Please select an option';
        return null;
      },
      onChanged: (value) {
        setState(() {
          _userRoleIdInputValue = value!;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildUserRolesCheckboxGroupInput() {
    return MyCustomFormCheckboxGroupInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'user_roles_checkbox_group',
      name: 'User Roles',
      options: widget.userRoleOptions!,
      initialValues: [],
      onChanged: (values) {
        setState(() {
          _userRoleIdsInputValue = values;
        });
        _actionsOnInputChanged(values);
      },
    );
  }

  _buildAccountStatusDropdownInput() {
    return MyCustomFormDropdownInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'account_status_dropdown_input',
      name: 'Select an Account Status',
      options: widget.accountStatusOptions!,
      initialValue: _accountStatusIdInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          _accountStatusIdInputValue = value!;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildIsAccountVerifiedSwitchInput() {
    return MyCustomFormSwitchInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'is_account_verified_switch_input',
      name: 'Is account verified?',
      initialValue: _isAccountVerifiedInputValue,
      onChanged: (value) {
        setState(() {
          _isAccountVerifiedInputValue = value!;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildIsEmailVerifiedSwitchInput() {
    return MyCustomFormSwitchInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'is_email_verified_switch_input',
      name: 'Is email verified?',
      initialValue: _isEmailVerifiedInputValue,
      onChanged: (value) {
        setState(() {
          _isEmailVerifiedInputValue = value!;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildIsPhoneVerifiedSwitchInput() {
    return MyCustomFormSwitchInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'is_phone_verified_switch_input',
      name: 'Is phone verified?',
      initialValue: _isPhoneVerifiedInputValue,
      onChanged: (value) {
        setState(() {
          _isPhoneVerifiedInputValue = value!;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildIsTwoFactorEnabledSwitchInput() {
    return MyCustomFormSwitchInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'is_two_factor_enabled_switch_input',
      name: 'Is two-factor enabled?',
      initialValue: _isTwoFactorEnabledInputValue,
      onChanged: (value) {
        setState(() {
          _isTwoFactorEnabledInputValue = value!;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildDeviceTokenUTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _deviceTokenUTextController,
      inputKey: 'device_token_u_text_input',
      name: 'Device Token U',
      // hintText: AppLocalizations.of(context)!.deviceTokenUTXT,
      hintText: '',
      initialValue: _deviceTokenUInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _deviceTokenUInputValue = _deviceTokenUTextController.text;
          _deviceTokenUInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildLanguageCodeTextInput() {
    return MyCustomFormTextInput(
      isDisabled: widget.areInputsDisabled,
      controller: _languageCodeTextController,
      inputKey: 'language_code_text_input',
      name: 'Language Code',
      // hintText: AppLocalizations.of(context)!.languageCodeTXT,
      hintText: '',
      initialValue: _languageCodeInputValue,
      validator: (value) {
        dynamic requiredFieldValidation = Validation().isRequiredFieldOk(value);
        if (requiredFieldValidation != true) return requiredFieldValidation;
        return null;
      },
      onChanged: (value) {
        setState(() {
          // _languageCodeInputValue = _languageCodeTextController.text;
          _languageCodeInputValue = value;
        });
        _actionsOnInputChanged(value);
      },
    );
  }

  _buildLastLoginDateTimePickerInput() {
    return MyCustomFormDateTimePickerInput(
      isDisabled: widget.areInputsDisabled,
      inputKey: 'last_login_data_time_picker_input',
      name: 'Select Date',
      initialValue: _lastLoginInputValue,
      onChanged: (value) {
        setState(() {
          _lastLoginInputValue = value;
          _lastLoginIntValue = value!.microsecondsSinceEpoch;
        });
        _actionsOnInputChanged(value);
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
        debugPrint('$data');
        debugPrint('$_isFormValid');
        if (_isFormValid) {
          widget.onSubmit!(data);
          // _resetForm();
        }
      },
    );
  }
}
