import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/inputs/input_containers/simple_container.dart';

class MyCustomFormPhoneInput extends StatefulWidget {
  final TextEditingController controller;
  final String inputKey;
  final String countryCodeName;
  final String phoneNumberName;
  final String countryCodeHintText;
  final String phoneNumberHintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(dynamic)? onCountryCodeChanged;
  final Function(dynamic)? onPhoneNumberChanged;
  final Function(Map<String, String>)? onChanged;
  final String? Function(String?)? countryCodeValidator;
  final String? Function(String?)? phoneNumberValidator;
  final bool shouldHideText;
  final bool showOutlineOnFocus;
  final bool isDisabled;
  final bool isCountryCodeDisabled;
  final bool shouldIncludeCountryCodePlusChar;
  final bool shouldDisplayCountryCodeAndCountryName;

  String countryCodeInitValue;
  String phoneNumberInitValue;

  final TextStyle? countryCodeTextStyle;
  final TextStyle? countryCodeTextStyleDisabled;
  final TextStyle? phoneNumberTextStyle;
  final TextStyle? phoneNumberTextStyleDisabled;

  final double dropdownMaxWidth;

  final EdgeInsetsGeometry containerPadding;
  final BoxDecoration? containerBoxDecoration;
  final BoxDecoration? containerBoxDecorationDisabled;

  final InputDecoration? dropdownInputDecoration;
  final InputDecoration? dropdownInputDecorationDisabled;

  final InputDecoration? inputDecoration;
  final InputDecoration? inputDecorationDisabled;

  MyCustomFormPhoneInput({
    Key? key,
    required this.controller,
    required this.inputKey,
    this.countryCodeName = "Code",
    this.phoneNumberName = "Phone Number",
    this.countryCodeHintText = "Code",
    this.phoneNumberHintText = "Phone Number",
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.onCountryCodeChanged,
    this.onPhoneNumberChanged,
    this.onChanged,
    this.countryCodeValidator,
    this.phoneNumberValidator,
    this.shouldHideText = false,
    this.showOutlineOnFocus = true,
    this.isDisabled = false,
    this.isCountryCodeDisabled = false,
    this.shouldIncludeCountryCodePlusChar = true,
    this.shouldDisplayCountryCodeAndCountryName = false,
    //
    this.countryCodeInitValue = '',
    this.phoneNumberInitValue = '',
    //
    this.countryCodeTextStyle,
    this.countryCodeTextStyleDisabled,
    this.phoneNumberTextStyle,
    this.phoneNumberTextStyleDisabled,
    //
    this.dropdownMaxWidth = 100,
    //
    this.containerPadding = const EdgeInsets.all(0),
    this.containerBoxDecoration,
    this.containerBoxDecorationDisabled,
    //
    this.dropdownInputDecoration,
    this.dropdownInputDecorationDisabled,
    //
    this.inputDecoration,
    this.inputDecorationDisabled,
  }) : super(key: key);

  @override
  _MyCustomFormPhoneInputState createState() => _MyCustomFormPhoneInputState();
}

class _MyCustomFormPhoneInputState extends State<MyCustomFormPhoneInput> {
  bool isTextVisible = true;
  String selectedCountryCode = ''; // Default country code

  @override
  void initState() {
    super.initState();
    isTextVisible = !widget.shouldHideText;

    widget.controller.text = widget.phoneNumberInitValue;
  }

  void _handleValueChanged() {
    final phoneCountryCode = selectedCountryCode;
    final phoneCountryCodeWithoutPlusChar = '';
    final phoneNumber = widget.controller.text;
    final fullPhoneNumber = '$phoneCountryCode$phoneNumber';
    final fullPhoneNumberWithoutPlusChar = '';

    if (widget.onChanged != null) {
      widget.onChanged!({
        'phoneCountryCode': phoneCountryCode,
        'phoneCountryCodeWithoutPlusChar':
            selectedCountryCode.length > 0 ? phoneCountryCode.substring(1) : '',
        'phoneNumber': phoneNumber,
        'fullPhoneNumber': fullPhoneNumber,
        'fullPhoneNumberWithoutPlusChar': selectedCountryCode.length > 0
            ? '${phoneCountryCode.substring(1)}$phoneNumber'
            : '',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _countryCodeTextStyle =
        widget.isDisabled == true || widget.isCountryCodeDisabled == true
            ? widget.countryCodeTextStyleDisabled ??
                TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey.shade400,
                )
            : widget.countryCodeTextStyle ??
                TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey.shade600,
                );

    return Container(
      padding: widget.containerPadding,
      decoration: widget.isDisabled
          ? widget.containerBoxDecorationDisabled ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.transparent,
              )
          : widget.containerBoxDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.transparent,
              ),
      child: Row(
        children: [
          // Country code dropdown
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widget.dropdownMaxWidth),
            child: IntrinsicWidth(
              child: MyCustomFormSimpleInputContainer(
                isDisabled: widget.isDisabled || widget.isCountryCodeDisabled,
                useBlankContainer: true,
                //
                childWidget: FormBuilderDropdown<String>(
                  enabled: widget.isDisabled == true ||
                          widget.isCountryCodeDisabled == true
                      ? false
                      : true,
                  name: widget.countryCodeName,
                  // style: _countryCodeTextStyle,
                  items: phoneCountryCodes
                      .map((option) => DropdownMenuItem<String>(
                            alignment: AlignmentDirectional.centerStart,
                            value: widget.shouldIncludeCountryCodePlusChar
                                ? option['value']
                                : option['value']
                                    .toString()
                                    .substring(1), // removes the + character
                            child: widget.shouldDisplayCountryCodeAndCountryName
                                ? Text(
                                    '${option['displayValue']!} ${option['text']}',
                                    style: _countryCodeTextStyle,
                                  )
                                : Text(
                                    option['displayValue']!,
                                    style: _countryCodeTextStyle,
                                  ),
                            // child:
                            //     Text('${option['value']!} ${option['text']}'),
                          ))
                      .toList(),
                  onChanged: widget.onCountryCodeChanged,
                  // onChanged: (value) {
                  //   setState(() {
                  //     selectedCountryCode = value ?? '+1';
                  //   });
                  //   _handleValueChanged(); // Trigger callback with updated values
                  // },
                  validator: widget.countryCodeValidator,
                  initialValue: widget.countryCodeInitValue,
                  decoration: widget.isDisabled
                      ? widget.dropdownInputDecorationDisabled ??
                          const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0))
                      : widget.dropdownInputDecoration ??
                          const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0)),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10), // Spacer between dropdown and input

          // Numeric phone input field
          Expanded(
            child: AbsorbPointer(
              absorbing: widget.isDisabled,
              child: FormBuilderTextField(
                enabled: !widget.isDisabled,
                controller: widget.controller,
                key: Key(widget.inputKey),
                name: widget.phoneNumberName,
                keyboardType: TextInputType.number,
                textInputAction: widget.textInputAction,
                onChanged: widget.onPhoneNumberChanged,
                // onChanged: (value) {
                //   _handleValueChanged(); // Trigger callback with updated values
                // },
                validator: widget.phoneNumberValidator,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Allows only digits
                obscureText: widget.shouldHideText && !isTextVisible,
                style: widget.isDisabled
                    ? widget.phoneNumberTextStyleDisabled ??
                        TextStyle(
                          fontSize: 13.5,
                          color: Colors.grey.shade400,
                        )
                    : widget.phoneNumberTextStyle ??
                        TextStyle(
                          fontSize: 13.5,
                          color: Colors.grey.shade600,
                        ),
                decoration: widget.isDisabled
                    ? widget.inputDecorationDisabled ??
                        InputDecoration(
                          hintText: widget.phoneNumberHintText,
                          hintStyle: TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey.shade300,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          focusedBorder: widget.showOutlineOnFocus
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2.0))
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          suffixIcon: widget.shouldHideText
                              ? GestureDetector(
                                  onTap: () => setState(
                                      () => isTextVisible = !isTextVisible),
                                  child: Icon(
                                      isTextVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey))
                              : null,
                        )
                    : widget.inputDecoration ??
                        InputDecoration(
                          hintText: widget.phoneNumberHintText,
                          hintStyle: const TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          focusedBorder: widget.showOutlineOnFocus
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2.0))
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          suffixIcon: widget.shouldHideText
                              ? GestureDetector(
                                  onTap: () => setState(
                                      () => isTextVisible = !isTextVisible),
                                  child: Icon(
                                      isTextVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey))
                              : null,
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// NOTES:
// Standard Formatting: The international phone number standard (E.164) specifies phone numbers should start with the + symbol, which helps signify the full international format and avoid ambiguity. It’s also what users commonly expect when they see an international number.

final List<Map<String, String>> phoneCountryCodes = [
  {'text': 'United States, Canada', 'value': '+1', 'displayValue': '+1'},
  {'text': 'Bahamas', 'value': '+1242', 'displayValue': '+1-242'},
  {'text': 'Barbados', 'value': '+1246', 'displayValue': '+1-246'},
  {'text': 'Anguilla', 'value': '+1264', 'displayValue': '+1-264'},
  {'text': 'Antigua and Barbuda', 'value': '+1268', 'displayValue': '+1-268'},
  {
    'text': 'British Virgin Islands',
    'value': '+1284',
    'displayValue': '+1-284'
  },
  {'text': 'Cayman Islands', 'value': '+1345', 'displayValue': '+1-345'},
  {'text': 'Bermuda', 'value': '+1441', 'displayValue': '+1-441'},
  {'text': 'Grenada', 'value': '+1473', 'displayValue': '+1-473'},
  {
    'text': 'Northern Mariana Islands',
    'value': '+1670',
    'displayValue': '+1-670'
  },
  {'text': 'Guam', 'value': '+1671', 'displayValue': '+1-671'},
  {'text': 'American Samoa', 'value': '+1684', 'displayValue': '+1-684'},
  {'text': 'Dominica', 'value': '+1767', 'displayValue': '+1-767'},
  {'text': 'Puerto Rico', 'value': '+1787', 'displayValue': '+1-787'},
  {'text': 'Dominican Republic', 'value': '+1809', 'displayValue': '+1-809'},
  {'text': 'Trinidad and Tobago', 'value': '+1868', 'displayValue': '+1-868'},
  {'text': 'Jamaica', 'value': '+1876', 'displayValue': '+1-876'},
  {'text': 'Egypt', 'value': '+20', 'displayValue': '+20'},
  {'text': 'South Africa', 'value': '+27', 'displayValue': '+27'},
  {'text': 'Greece', 'value': '+30', 'displayValue': '+30'},
  {'text': 'Netherlands', 'value': '+31', 'displayValue': '+31'},
  {'text': 'Belgium', 'value': '+32', 'displayValue': '+32'},
  {'text': 'France', 'value': '+33', 'displayValue': '+33'},
  {'text': 'Spain', 'value': '+34', 'displayValue': '+34'},
  {'text': 'Hungary', 'value': '+36', 'displayValue': '+36'},
  {'text': 'Italy', 'value': '+39', 'displayValue': '+39'},
  {'text': 'Romania', 'value': '+40', 'displayValue': '+40'},
  {'text': 'Austria', 'value': '+43', 'displayValue': '+43'},
  {'text': 'United Kingdom', 'value': '+44', 'displayValue': '+44'},
  {'text': 'Isle of Man', 'value': '+441624', 'displayValue': '+44-1624'},
  {'text': 'Denmark', 'value': '+45', 'displayValue': '+45'},
  {'text': 'Sweden', 'value': '+46', 'displayValue': '+46'},
  {'text': 'Norway', 'value': '+47', 'displayValue': '+47'},
  {'text': 'Germany', 'value': '+49', 'displayValue': '+49'},
  {'text': 'Peru', 'value': '+51', 'displayValue': '+51'},
  {'text': 'Mexico', 'value': '+52', 'displayValue': '+52'},
  {'text': 'Cuba', 'value': '+53', 'displayValue': '+53'},
  {'text': 'Argentina', 'value': '+54', 'displayValue': '+54'},
  {'text': 'Brazil', 'value': '+55', 'displayValue': '+55'},
  {'text': 'Chile', 'value': '+56', 'displayValue': '+56'},
  {'text': 'Colombia', 'value': '+57', 'displayValue': '+57'},
  {'text': 'Venezuela', 'value': '+58', 'displayValue': '+58'},
  {'text': 'Malaysia', 'value': '+60', 'displayValue': '+60'},
  {
    'text': 'Australia, Christmas Island, Cocos (Keeling) Islands',
    'value': '+61',
    'displayValue': '+61'
  },
  {'text': 'Indonesia', 'value': '+62', 'displayValue': '+62'},
  {'text': 'Philippines', 'value': '+63', 'displayValue': '+63'},
  {'text': 'New Zealand', 'value': '+64', 'displayValue': '+64'},
  {'text': 'Singapore', 'value': '+65', 'displayValue': '+65'},
  {'text': 'Thailand', 'value': '+66', 'displayValue': '+66'},
  {'text': 'Japan', 'value': '+81', 'displayValue': '+81'},
  {'text': 'South Korea', 'value': '+82', 'displayValue': '+82'},
  {'text': 'Vietnam', 'value': '+84', 'displayValue': '+84'},
  {'text': 'China', 'value': '+86', 'displayValue': '+86'},
  {'text': 'Turkey', 'value': '+90', 'displayValue': '+90'},
  {'text': 'India', 'value': '+91', 'displayValue': '+91'},
  {'text': 'Pakistan', 'value': '+92', 'displayValue': '+92'},
  {'text': 'Afghanistan', 'value': '+93', 'displayValue': '+93'},
  {'text': 'Sri Lanka', 'value': '+94', 'displayValue': '+94'},
  {'text': 'Myanmar', 'value': '+95', 'displayValue': '+95'},
  {'text': 'Iran', 'value': '+98', 'displayValue': '+98'},
  {'text': 'South Sudan', 'value': '+211', 'displayValue': '+211'},
  {'text': 'Morocco', 'value': '+212', 'displayValue': '+212'},
  {'text': 'Algeria', 'value': '+213', 'displayValue': '+213'},
  {'text': 'Tunisia', 'value': '+216', 'displayValue': '+216'},
  {'text': 'Libya', 'value': '+218', 'displayValue': '+218'},
  {'text': 'Gambia', 'value': '+220', 'displayValue': '+220'},
  {'text': 'Senegal', 'value': '+221', 'displayValue': '+221'},
  {'text': 'Mauritania', 'value': '+222', 'displayValue': '+222'},
  {'text': 'Mali', 'value': '+223', 'displayValue': '+223'},
  {'text': 'Guinea', 'value': '+224', 'displayValue': '+224'},
  {'text': 'Ivory Coast', 'value': '+225', 'displayValue': '+225'},
  {'text': 'Burkina Faso', 'value': '+226', 'displayValue': '+226'},
  {'text': 'Niger', 'value': '+227', 'displayValue': '+227'},
  {'text': 'Togo', 'value': '+228', 'displayValue': '+228'},
  {'text': 'Benin', 'value': '+229', 'displayValue': '+229'},
  {'text': 'Mauritius', 'value': '+230', 'displayValue': '+230'},
  {'text': 'Liberia', 'value': '+231', 'displayValue': '+231'},
  {'text': 'Sierra Leone', 'value': '+232', 'displayValue': '+232'},
  {'text': 'Ghana', 'value': '+233', 'displayValue': '+233'},
  {'text': 'Nigeria', 'value': '+234', 'displayValue': '+234'},
  {'text': 'Chad', 'value': '+235', 'displayValue': '+235'},
  {'text': 'Central African Republic', 'value': '+236', 'displayValue': '+236'},
  {'text': 'Cameroon', 'value': '+237', 'displayValue': '+237'},
  {'text': 'Cape Verde', 'value': '+238', 'displayValue': '+238'},
  {'text': 'Sao Tome and Principe', 'value': '+239', 'displayValue': '+239'},
  {'text': 'Equatorial Guinea', 'value': '+240', 'displayValue': '+240'},
  {'text': 'Gabon', 'value': '+241', 'displayValue': '+241'},
  {'text': 'Republic of the Congo', 'value': '+242', 'displayValue': '+242'},
  {
    'text': 'Democratic Republic of the Congo',
    'value': '+243',
    'displayValue': '+243'
  },
  {'text': 'Angola', 'value': '+244', 'displayValue': '+244'},
  {'text': 'Guinea-Bissau', 'value': '+245', 'displayValue': '+245'},
  {
    'text': 'British Indian Ocean Territory',
    'value': '+246',
    'displayValue': '+246'
  },
  {'text': 'Seychelles', 'value': '+248', 'displayValue': '+248'},
  {'text': 'Sudan', 'value': '+249', 'displayValue': '+249'},
  {'text': 'Rwanda', 'value': '+250', 'displayValue': '+250'},
  {'text': 'Ethiopia', 'value': '+251', 'displayValue': '+251'},
  {'text': 'Somalia', 'value': '+252', 'displayValue': '+252'},
  {'text': 'Djibouti', 'value': '+253', 'displayValue': '+253'},
  {'text': 'Kenya', 'value': '+254', 'displayValue': '+254'},
  {'text': 'Tanzania', 'value': '+255', 'displayValue': '+255'},
  {'text': 'Uganda', 'value': '+256', 'displayValue': '+256'},
  {'text': 'Burundi', 'value': '+257', 'displayValue': '+257'},
  {'text': 'Mozambique', 'value': '+258', 'displayValue': '+258'},
  {'text': 'Zambia', 'value': '+260', 'displayValue': '+260'},
  {'text': 'Madagascar', 'value': '+261', 'displayValue': '+261'},
  {'text': 'Reunion, Mayotte', 'value': '+262', 'displayValue': '+262'},
  {'text': 'Zimbabwe', 'value': '+263', 'displayValue': '+263'},
  {'text': 'Namibia', 'value': '+264', 'displayValue': '+264'},
  {'text': 'Malawi', 'value': '+265', 'displayValue': '+265'},
  {'text': 'Lesotho', 'value': '+266', 'displayValue': '+266'},
  {'text': 'Botswana', 'value': '+267', 'displayValue': '+267'},
  {'text': 'Swaziland', 'value': '+268', 'displayValue': '+268'},
  {'text': 'Comoros', 'value': '+269', 'displayValue': '+269'},
  {'text': 'Eritrea', 'value': '+291', 'displayValue': '+291'},
  {'text': 'Aruba', 'value': '+297', 'displayValue': '+297'},
  {'text': 'Faroe Islands', 'value': '+298', 'displayValue': '+298'},
  {'text': 'Greenland', 'value': '+299', 'displayValue': '+299'},
  {'text': 'Gibraltar', 'value': '+350', 'displayValue': '+350'},
  {'text': 'Portugal', 'value': '+351', 'displayValue': '+351'},
  {'text': 'Luxembourg', 'value': '+352', 'displayValue': '+352'},
  {'text': 'Ireland', 'value': '+353', 'displayValue': '+353'},
  {'text': 'Iceland', 'value': '+354', 'displayValue': '+354'},
  {'text': 'Albania', 'value': '+355', 'displayValue': '+355'},
  {'text': 'Malta', 'value': '+356', 'displayValue': '+356'},
  {'text': 'Cyprus', 'value': '+357', 'displayValue': '+357'},
  {'text': 'Finland', 'value': '+358', 'displayValue': '+358'},
  {'text': 'Bulgaria', 'value': '+359', 'displayValue': '+359'},
  {'text': 'Lithuania', 'value': '+370', 'displayValue': '+370'},
  {'text': 'Latvia', 'value': '+371', 'displayValue': '+371'},
  {'text': 'Estonia', 'value': '+372', 'displayValue': '+372'},
  {'text': 'Moldova', 'value': '+373', 'displayValue': '+373'},
  {'text': 'Armenia', 'value': '+374', 'displayValue': '+374'},
  {'text': 'Belarus', 'value': '+375', 'displayValue': '+375'},
  {'text': 'Andorra', 'value': '+376', 'displayValue': '+376'},
  {'text': 'Monaco', 'value': '+377', 'displayValue': '+377'},
  {'text': 'San Marino', 'value': '+378', 'displayValue': '+378'},
  {'text': 'Ukraine', 'value': '+380', 'displayValue': '+380'},
  {'text': 'Serbia', 'value': '+381', 'displayValue': '+381'},
  {'text': 'Montenegro', 'value': '+382', 'displayValue': '+382'},
  {'text': 'Kosovo', 'value': '+383', 'displayValue': '+383'},
  {'text': 'Croatia', 'value': '+385', 'displayValue': '+385'},
  {'text': 'Slovenia', 'value': '+386', 'displayValue': '+386'},
  {'text': 'Bosnia and Herzegovina', 'value': '+387', 'displayValue': '+387'},
  {'text': 'Macedonia', 'value': '+389', 'displayValue': '+389'},
  {'text': 'Czech Republic', 'value': '+420', 'displayValue': '+420'},
  {'text': 'Slovakia', 'value': '+421', 'displayValue': '+421'},
  {'text': 'Liechtenstein', 'value': '+423', 'displayValue': '+423'},
  {'text': 'Falkland Islands', 'value': '+500', 'displayValue': '+500'},
  {'text': 'Belize', 'value': '+501', 'displayValue': '+501'},
  {'text': 'Guatemala', 'value': '+502', 'displayValue': '+502'},
  {'text': 'El Salvador', 'value': '+503', 'displayValue': '+503'},
  {'text': 'Honduras', 'value': '+504', 'displayValue': '+504'},
  {'text': 'Nicaragua', 'value': '+505', 'displayValue': '+505'},
  {'text': 'Costa Rica', 'value': '+506', 'displayValue': '+506'},
  {'text': 'Panama', 'value': '+507', 'displayValue': '+507'},
  {
    'text': 'Saint Pierre and Miquelon',
    'value': '+508',
    'displayValue': '+508'
  },
  {'text': 'Haiti', 'value': '+509', 'displayValue': '+509'},
  {'text': 'French Guiana', 'value': '+594', 'displayValue': '+594'},
  {'text': 'Paraguay', 'value': '+595', 'displayValue': '+595'},
  {'text': 'Martinique', 'value': '+596', 'displayValue': '+596'},
  {'text': 'Suriname', 'value': '+597', 'displayValue': '+597'},
  {'text': 'Uruguay', 'value': '+598', 'displayValue': '+598'},
  {'text': 'East Timor', 'value': '+670', 'displayValue': '+670'},
  {'text': 'Antarctica', 'value': '+672', 'displayValue': '+672'},
  {'text': 'Brunei Darussalam', 'value': '+673', 'displayValue': '+673'},
  {'text': 'Nauru', 'value': '+674', 'displayValue': '+674'},
  {'text': 'Papua New Guinea', 'value': '+675', 'displayValue': '+675'},
  {'text': 'Tonga', 'value': '+676', 'displayValue': '+676'},
  {'text': 'Solomon Islands', 'value': '+677', 'displayValue': '+677'},
  {'text': 'Vanuatu', 'value': '+678', 'displayValue': '+678'},
  {'text': 'Fiji', 'value': '+679', 'displayValue': '+679'},
  {'text': 'Palau', 'value': '+680', 'displayValue': '+680'},
  {'text': 'Wallis and Futuna', 'value': '+681', 'displayValue': '+681'},
  {'text': 'Cook Islands', 'value': '+682', 'displayValue': '+682'},
  {'text': 'Niue', 'value': '+683', 'displayValue': '+683'},
  {'text': 'Tokelau', 'value': '+690', 'displayValue': '+690'},
  {'text': 'Micronesia', 'value': '+691', 'displayValue': '+691'},
  {'text': 'Marshall Islands', 'value': '+692', 'displayValue': '+692'},
  {'text': 'North Korea', 'value': '+850', 'displayValue': '+850'},
  {'text': 'Hong Kong', 'value': '+852', 'displayValue': '+852'},
  {'text': 'Macao', 'value': '+853', 'displayValue': '+853'},
  {'text': 'Cambodia', 'value': '+855', 'displayValue': '+855'},
  {'text': 'Laos', 'value': '+856', 'displayValue': '+856'},
  {'text': 'Bangladesh', 'value': '+880', 'displayValue': '+880'},
  {'text': 'Taiwan', 'value': '+886', 'displayValue': '+886'},
  {'text': 'Maldives', 'value': '+960', 'displayValue': '+960'},
  {'text': 'Lebanon', 'value': '+961', 'displayValue': '+961'},
  {'text': 'Jordan', 'value': '+962', 'displayValue': '+962'},
  {'text': 'Syria', 'value': '+963', 'displayValue': '+963'},
  {'text': 'Iraq', 'value': '+964', 'displayValue': '+964'},
  {'text': 'Kuwait', 'value': '+965', 'displayValue': '+965'},
  {'text': 'Saudi Arabia', 'value': '+966', 'displayValue': '+966'},
  {'text': 'Yemen', 'value': '+967', 'displayValue': '+967'},
  {'text': 'Oman', 'value': '+968', 'displayValue': '+968'},
  {'text': 'Palestine', 'value': '+970', 'displayValue': '+970'},
  {'text': 'United Arab Emirates', 'value': '+971', 'displayValue': '+971'},
  {'text': 'Israel', 'value': '+972', 'displayValue': '+972'},
  {'text': 'Bahrain', 'value': '+973', 'displayValue': '+973'},
  {'text': 'Qatar', 'value': '+974', 'displayValue': '+974'},
  {'text': 'Bhutan', 'value': '+975', 'displayValue': '+975'},
  {'text': 'Mongolia', 'value': '+976', 'displayValue': '+976'},
  {'text': 'Nepal', 'value': '+977', 'displayValue': '+977'},
  {'text': 'Tajikistan', 'value': '+992', 'displayValue': '+992'},
  {'text': 'Turkmenistan', 'value': '+993', 'displayValue': '+993'},
  {'text': 'Azerbaijan', 'value': '+994', 'displayValue': '+994'},
  {'text': 'Georgia', 'value': '+995', 'displayValue': '+995'},
  {'text': 'Kyrgyzstan', 'value': '+996', 'displayValue': '+996'},
  {'text': 'Uzbekistan', 'value': '+998', 'displayValue': '+998'},
];

// final List<String> phoneCountryCodes = [
//   '+1', // United States, Canada
//   '+1-242', // Bahamas
//   '+1-246', // Barbados
//   '+1-264', // Anguilla
//   '+1-268', // Antigua and Barbuda
//   '+1-284', // British Virgin Islands
//   '+1-345', // Cayman Islands
//   '+1-441', // Bermuda
//   '+1-473', // Grenada
//   '+1-670', // Northern Mariana Islands
//   '+1-671', // Guam
//   '+1-684', // American Samoa
//   '+1-767', // Dominica
//   '+1-787', // Puerto Rico
//   '+1-809', // Dominican Republic
//   '+1-868', // Trinidad and Tobago
//   '+1-876', // Jamaica
//   '+20', // Egypt
//   '+27', // South Africa
//   '+30', // Greece
//   '+31', // Netherlands
//   '+32', // Belgium
//   '+33', // France
//   '+34', // Spain
//   '+36', // Hungary
//   '+39', // Italy
//   '+40', // Romania
//   '+43', // Austria
//   '+44', // United Kingdom
//   '+44-1624', // Isle of Man
//   '+45', // Denmark
//   '+46', // Sweden
//   '+47', // Norway
//   '+49', // Germany
//   '+51', // Peru
//   '+52', // Mexico
//   '+53', // Cuba
//   '+54', // Argentina
//   '+55', // Brazil
//   '+56', // Chile
//   '+57', // Colombia
//   '+58', // Venezuela
//   '+60', // Malaysia
//   '+61', // Australia, Christmas Island, Cocos (Keeling) Islands
//   '+62', // Indonesia
//   '+63', // Philippines
//   '+64', // New Zealand
//   '+65', // Singapore
//   '+66', // Thailand
//   '+81', // Japan
//   '+82', // South Korea
//   '+84', // Vietnam
//   '+86', // China
//   '+90', // Turkey
//   '+91', // India
//   '+92', // Pakistan
//   '+93', // Afghanistan
//   '+94', // Sri Lanka
//   '+95', // Myanmar
//   '+98', // Iran
//   '+211', // South Sudan
//   '+212', // Morocco
//   '+213', // Algeria
//   '+216', // Tunisia
//   '+218', // Libya
//   '+220', // Gambia
//   '+221', // Senegal
//   '+222', // Mauritania
//   '+223', // Mali
//   '+224', // Guinea
//   '+225', // Ivory Coast
//   '+226', // Burkina Faso
//   '+227', // Niger
//   '+228', // Togo
//   '+229', // Benin
//   '+230', // Mauritius
//   '+231', // Liberia
//   '+232', // Sierra Leone
//   '+233', // Ghana
//   '+234', // Nigeria
//   '+235', // Chad
//   '+236', // Central African Republic
//   '+237', // Cameroon
//   '+238', // Cape Verde
//   '+239', // Sao Tome and Principe
//   '+240', // Equatorial Guinea
//   '+241', // Gabon
//   '+242', // Republic of the Congo
//   '+243', // Democratic Republic of the Congo
//   '+244', // Angola
//   '+245', // Guinea-Bissau
//   '+246', // British Indian Ocean Territory
//   '+248', // Seychelles
//   '+249', // Sudan
//   '+250', // Rwanda
//   '+251', // Ethiopia
//   '+252', // Somalia
//   '+253', // Djibouti
//   '+254', // Kenya
//   '+255', // Tanzania
//   '+256', // Uganda
//   '+257', // Burundi
//   '+258', // Mozambique
//   '+260', // Zambia
//   '+261', // Madagascar
//   '+262', // Reunion, Mayotte
//   '+263', // Zimbabwe
//   '+264', // Namibia
//   '+265', // Malawi
//   '+266', // Lesotho
//   '+267', // Botswana
//   '+268', // Swaziland
//   '+269', // Comoros
//   '+291', // Eritrea
//   '+297', // Aruba
//   '+298', // Faroe Islands
//   '+299', // Greenland
//   '+350', // Gibraltar
//   '+351', // Portugal
//   '+352', // Luxembourg
//   '+353', // Ireland
//   '+354', // Iceland
//   '+355', // Albania
//   '+356', // Malta
//   '+357', // Cyprus
//   '+358', // Finland
//   '+359', // Bulgaria
//   '+370', // Lithuania
//   '+371', // Latvia
//   '+372', // Estonia
//   '+373', // Moldova
//   '+374', // Armenia
//   '+375', // Belarus
//   '+376', // Andorra
//   '+377', // Monaco
//   '+378', // San Marino
//   '+380', // Ukraine
//   '+381', // Serbia
//   '+382', // Montenegro
//   '+383', // Kosovo
//   '+385', // Croatia
//   '+386', // Slovenia
//   '+387', // Bosnia and Herzegovina
//   '+389', // Macedonia
//   '+420', // Czech Republic
//   '+421', // Slovakia
//   '+423', // Liechtenstein
//   '+500', // Falkland Islands
//   '+501', // Belize
//   '+502', // Guatemala
//   '+503', // El Salvador
//   '+504', // Honduras
//   '+505', // Nicaragua
//   '+506', // Costa Rica
//   '+507', // Panama
//   '+509', // Haiti
//   '+590', // Guadeloupe
//   '+591', // Bolivia
//   '+592', // Guyana
//   '+593', // Ecuador
//   '+594', // French Guiana
//   '+595', // Paraguay
//   '+596', // Martinique
//   '+597', // Suriname
//   '+598', // Uruguay
//   '+599', // Curacao
//   '+670', // East Timor
//   '+672', // Antarctica
//   '+673', // Brunei
//   '+674', // Nauru
//   '+675', // Papua New Guinea
//   '+676', // Tonga
//   '+677', // Solomon Islands
//   '+678', // Vanuatu
//   '+679', // Fiji
//   '+680', // Palau
//   '+682', // Cook Islands
//   '+683', // Niue
//   '+685', // Samoa
//   '+686', // Kiribati
//   '+687', // New Caledonia
//   '+688', // Tuvalu
//   '+689', // French Polynesia
//   '+690', // Tokelau
//   '+691', // Micronesia
//   '+692', // Marshall Islands
//   '+850', // North Korea
//   '+852', // Hong Kong
//   '+853', // Macau
//   '+855', // Cambodia
//   '+856', // Laos
//   '+880', // Bangladesh
//   '+886', // Taiwan
//   '+960', // Maldives
//   '+961', // Lebanon
//   '+962', // Jordan
//   '+963', // Syria
//   '+964', // Iraq
//   '+965', // Kuwait
//   '+966', // Saudi Arabia
//   '+967', // Yemen
//   '+968', // Oman
//   '+971', // United Arab Emirates
//   '+972', // Israel
//   '+973', // Bahrain
//   '+974', // Qatar
//   '+975', // Bhutan
//   '+976', // Mongolia
//   '+977', // Nepal
//   '+992', // Tajikistan
//   '+993', // Turkmenistan
//   '+994', // Azerbaijan
//   '+995', // Georgia
//   '+996', // Kyrgyzstan
//   '+998' // Uzbekistan
// ];

// final List<String> phoneCountryCodes = [
//   '+93', // Afghanistan
//   '+355', // Albania
//   '+213', // Algeria
//   '+1-684', // American Samoa
//   '+376', // Andorra
//   '+244', // Angola
//   '+1-264', // Anguilla
//   '+672', // Antarctica
//   '+1-268', // Antigua and Barbuda
//   '+54', // Argentina
//   '+374', // Armenia
//   '+297', // Aruba
//   '+61', // Australia
//   '+43', // Austria
//   '+994', // Azerbaijan
//   '+1-242', // Bahamas
//   '+973', // Bahrain
//   '+880', // Bangladesh
//   '+1-246', // Barbados
//   '+375', // Belarus
//   '+32', // Belgium
//   '+501', // Belize
//   '+229', // Benin
//   '+1-441', // Bermuda
//   '+975', // Bhutan
//   '+591', // Bolivia
//   '+387', // Bosnia and Herzegovina
//   '+267', // Botswana
//   '+55', // Brazil
//   '+246', // British Indian Ocean Territory
//   '+1-284', // British Virgin Islands
//   '+673', // Brunei
//   '+359', // Bulgaria
//   '+226', // Burkina Faso
//   '+257', // Burundi
//   '+855', // Cambodia
//   '+237', // Cameroon
//   '+1', // Canada
//   '+238', // Cape Verde
//   '+1-345', // Cayman Islands
//   '+236', // Central African Republic
//   '+235', // Chad
//   '+56', // Chile
//   '+86', // China
//   '+61', // Christmas Island
//   '+61', // Cocos (Keeling) Islands
//   '+57', // Colombia
//   '+269', // Comoros
//   '+682', // Cook Islands
//   '+506', // Costa Rica
//   '+385', // Croatia
//   '+53', // Cuba
//   '+599', // Curacao
//   '+357', // Cyprus
//   '+420', // Czech Republic
//   '+243', // Democratic Republic of the Congo
//   '+45', // Denmark
//   '+253', // Djibouti
//   '+1-767', // Dominica
//   '+1-809', // Dominican Republic
//   '+670', // East Timor
//   '+593', // Ecuador
//   '+20', // Egypt
//   '+503', // El Salvador
//   '+240', // Equatorial Guinea
//   '+291', // Eritrea
//   '+372', // Estonia
//   '+251', // Ethiopia
//   '+500', // Falkland Islands
//   '+298', // Faroe Islands
//   '+679', // Fiji
//   '+358', // Finland
//   '+33', // France
//   '+594', // French Guiana
//   '+689', // French Polynesia
//   '+241', // Gabon
//   '+220', // Gambia
//   '+995', // Georgia
//   '+49', // Germany
//   '+233', // Ghana
//   '+350', // Gibraltar
//   '+30', // Greece
//   '+299', // Greenland
//   '+1-473', // Grenada
//   '+590', // Guadeloupe
//   '+1-671', // Guam
//   '+502', // Guatemala
//   '+224', // Guinea
//   '+245', // Guinea-Bissau
//   '+592', // Guyana
//   '+509', // Haiti
//   '+504', // Honduras
//   '+852', // Hong Kong
//   '+36', // Hungary
//   '+354', // Iceland
//   '+91', // India
//   '+62', // Indonesia
//   '+98', // Iran
//   '+964', // Iraq
//   '+353', // Ireland
//   '+44-1624', // Isle of Man
//   '+972', // Israel
//   '+39', // Italy
//   '+1-876', // Jamaica
//   '+81', // Japan
//   '+962', // Jordan
//   '+7', // Kazakhstan
//   '+254', // Kenya
//   '+686', // Kiribati
//   '+383', // Kosovo
//   '+965', // Kuwait
//   '+996', // Kyrgyzstan
//   '+856', // Laos
//   '+371', // Latvia
//   '+961', // Lebanon
//   '+266', // Lesotho
//   '+231', // Liberia
//   '+218', // Libya
//   '+423', // Liechtenstein
//   '+370', // Lithuania
//   '+352', // Luxembourg
//   '+853', // Macau
//   '+389', // Macedonia
//   '+261', // Madagascar
//   '+265', // Malawi
//   '+60', // Malaysia
//   '+960', // Maldives
//   '+223', // Mali
//   '+356', // Malta
//   '+692', // Marshall Islands
//   '+596', // Martinique
//   '+222', // Mauritania
//   '+230', // Mauritius
//   '+262', // Mayotte
//   '+52', // Mexico
//   '+691', // Micronesia
//   '+373', // Moldova
//   '+377', // Monaco
//   '+976', // Mongolia
//   '+382', // Montenegro
//   '+212', // Morocco
//   '+258', // Mozambique
//   '+95', // Myanmar
//   '+264', // Namibia
//   '+674', // Nauru
//   '+977', // Nepal
//   '+31', // Netherlands
//   '+687', // New Caledonia
//   '+64', // New Zealand
//   '+505', // Nicaragua
//   '+227', // Niger
//   '+234', // Nigeria
//   '+683', // Niue
//   '+850', // North Korea
//   '+1-670', // Northern Mariana Islands
//   '+47', // Norway
//   '+968', // Oman
//   '+92', // Pakistan
//   '+680', // Palau
//   '+970', // Palestine
//   '+507', // Panama
//   '+675', // Papua New Guinea
//   '+595', // Paraguay
//   '+51', // Peru
//   '+63', // Philippines
//   '+48', // Poland
//   '+351', // Portugal
//   '+1-787', // Puerto Rico
//   '+974', // Qatar
//   '+242', // Republic of the Congo
//   '+262', // Reunion
//   '+40', // Romania
//   '+7', // Russia
//   '+250', // Rwanda
//   '+685', // Samoa
//   '+378', // San Marino
//   '+239', // Sao Tome and Principe
//   '+966', // Saudi Arabia
//   '+221', // Senegal
//   '+381', // Serbia
//   '+248', // Seychelles
//   '+232', // Sierra Leone
//   '+65', // Singapore
//   '+421', // Slovakia
//   '+386', // Slovenia
//   '+677', // Solomon Islands
//   '+252', // Somalia
//   '+27', // South Africa
//   '+82', // South Korea
//   '+211', // South Sudan
//   '+34', // Spain
//   '+94', // Sri Lanka
//   '+249', // Sudan
//   '+597', // Suriname
//   '+268', // Swaziland
//   '+46', // Sweden
//   '+41', // Switzerland
//   '+963', // Syria
//   '+886', // Taiwan
//   '+992', // Tajikistan
//   '+255', // Tanzania
//   '+66', // Thailand
//   '+228', // Togo
//   '+690', // Tokelau
//   '+676', // Tonga
//   '+1-868', // Trinidad and Tobago
//   '+216', // Tunisia
//   '+90', // Turkey
//   '+993', // Turkmenistan
//   '+688', // Tuvalu
//   '+256', // Uganda
//   '+380', // Ukraine
//   '+971', // United Arab Emirates
//   '+44', // United Kingdom
//   '+1', // United States
//   '+598', // Uruguay
//   '+998', // Uzbekistan
//   '+678', // Vanuatu
//   '+379', // Vatican
//   '+58', // Venezuela
//   '+84', // Vietnam
//   '+681', // Wallis and Futuna
//   '+967', // Yemen
//   '+260', // Zambia
//   '+263', // Zimbabwe
// ];
