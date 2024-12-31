// Purpose of this file, is rendering a form by receiving just a configurations Map object

import 'package:flutter/material.dart';
// import 'package:siansa_app/models/my_form_model.dart';
import 'models/my_form_input_model.dart';
// import 'custom_form/custom_form.dart';
import 'flutter_form_builder.dart';

class MyForm extends StatelessWidget {
  EdgeInsets margin;
  EdgeInsets padding;
  String titleText;
  String subtitleText;
  String descriptionText;
  String footerText;
  String submitButtonText;
  // List<MyFormInputModel> inputElements;
  List<Map<String, dynamic>> inputElements;
  Function(Map<String, dynamic>, bool) onSubmit;

  MyForm({
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(30.0),
    this.titleText = '',
    this.subtitleText = '',
    this.descriptionText = '',
    this.footerText = '',
    this.submitButtonText = 'Submit',
    // List<MyFormInputModel>? inputElements,
    List<Map<String, dynamic>>? inputElements,
    // this.inputElements = const [],
    required this.onSubmit,
    // });
  }) : inputElements = inputElements ?? inputElementsExample;

  static void _defaultOnSubmit(Map<String, dynamic> values, bool isFormValid) {
    // Default behavior: Print all values
    print("MyForm - values: $values");
    print('MyForm - isFormValid: $isFormValid');
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: margin,
    //   padding: padding,
    //   child: Column(
    //     children: [
    //       if (titleText.toString().length > 0) Text(titleText),
    //       if (subtitleText.toString().length > 0) Text(subtitleText),
    //       if (descriptionText.toString().length > 0) Text(descriptionText),
    //       buildInputElements(context, submitButtonText, onSubmit),
    //       if (footerText.toString().length > 0) Text(footerText),
    //     ],
    //   ),
    // );
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white, // Set the container color
        borderRadius: BorderRadius.circular(10.0), // Set the border radius
        border: Border.all(
          color: Colors.blue, // Set the border color
          width: 2.0, // Set the border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Optional: add shadow
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          if (titleText.toString().length > 0) Text(titleText),
          if (subtitleText.toString().length > 0) Text(subtitleText),
          if (descriptionText.toString().length > 0) Text(descriptionText),
          buildInputElements(context, submitButtonText, onSubmit),
          if (footerText.toString().length > 0) Text(footerText),
        ],
      ),
    );
  }

  Widget buildInputElements(context, submitButtonText, onSubmit) {
    return FlutterFormBuilder(
      inputElements: inputElements,
      submitButtonText: submitButtonText,
      onSubmit: onSubmit,
    );
  }

  Widget buildInputElementsColumn(context, submitButtonText, onSubmit) {
    return Column(
      children: [
        FlutterFormBuilder(
          inputElements: inputElements,
          submitButtonText: submitButtonText,
          onSubmit: onSubmit,
        ),
      ],
    );
  }
}

// List<MyFormInputModel> inputElementsExample = [
//   MyFormInputModel(
//     type: 'email',
//     name: 'email',
//     label: 'Enter your email',
//     placeholder: 'user@example.com',
//     // initialValue: 'name@company.com',
//   ),
//   MyFormInputModel(
//     type: 'password',
//     name: 'password',
//     label: 'Enter your password',
//     placeholder: '12345678',
//     // initialValue: '0987654321',
//   ),
//   MyFormInputModel(
//     type: 'textfield',
//     name: 'short_description',
//     label: 'Add a short description',
//     placeholder: 'Lorem ipsum...',
//     // initialValue: 'short description',
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'textarea',
//     name: 'large_description',
//     label: 'Add a large description',
//     placeholder: 'Lorem ipsum isset it dolor asumet inapmet is...',
//     // initialValue: 'large description',
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'radio',
//     name: 'radio',
//     label: 'Select one option',
//     placeholder: '',
//     initialValue: "2",
//     options: [
//       {"text": "Text 1", "value": 1},
//       {"text": "Text 2", "value": 2},
//       {"text": "Text 3", "value": 3},
//     ],
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'checkbox',
//     name: 'checkbox',
//     label: 'Select the options that apply',
//     placeholder: '',
//     // initialValue: ["1", "3"],
//     options: [
//       {"text": "Text 1", "value": 1},
//       {"text": "Text 2", "value": 2},
//       {"text": "Text 3", "value": 3},
//     ],
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'dropdown',
//     name: 'dropdown',
//     label: 'Select one option',
//     placeholder: '',
//     // initialValue: '2',
//     options: [
//       {"text": "Text 1", "value": 1},
//       {"text": "Text 2", "value": 2},
//       {"text": "Text 3", "value": 3},
//     ],
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'filterChip',
//     name: 'filterChip',
//     label: 'Select the options that apply',
//     placeholder: '',
//     // initialValue: ['1', '3'],
//     options: [
//       {"text": "Text 1", "value": 1},
//       {"text": "Text 2", "value": 2},
//       {"text": "Text 3", "value": 3},
//     ],
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'choiceChip',
//     name: 'choiceChip',
//     label: 'Select one option',
//     placeholder: '',
//     // initialValue: '2',
//     options: [
//       {"text": "Text 1", "value": 1},
//       {"text": "Text 2", "value": 2},
//       {"text": "Text 3", "value": 3},
//     ],
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'datePicker',
//     name: 'datePicker',
//     label: 'Select your birth date',
//     placeholder: '',
//     // initialValue: '2',
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'timePicker',
//     name: 'timePicker',
//     label: 'Select your birth hour',
//     placeholder: '',
//     // initialValue: '2',
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'dateTimePicker',
//     name: 'dateTimePicker',
//     label: 'Select your birth date and hour',
//     placeholder: '',
//     // initialValue: '2',
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'dateRangePicker',
//     name: 'dateRangePicker',
//     label: 'Select arrival and departure dates',
//     placeholder: '',
//     // initialValue: '2',
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'rangeSlider',
//     name: 'rangeSlider',
//     label: 'Select a range',
//     placeholder: '',
//     // initialValue: DateTimeRange(
//     //   start: DateTime(
//     //     DateTime.now().year,
//     //     DateTime.now().month,
//     //     DateTime.now().day - 2,
//     //   ),
//     //   end: DateTime(
//     //     DateTime.now().year,
//     //     DateTime.now().month,
//     //     DateTime.now().day + 7,
//     //   ),
//     // ),
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'slider',
//     name: 'slider',
//     label: 'Select a vaue',
//     placeholder: '',
//     // initialValue: 10,
//     // initialValue2: 1000,
//     validationRules: ['required'],
//   ),
//   MyFormInputModel(
//     type: 'switch',
//     name: 'switch',
//     label: 'Yer or no?',
//     placeholder: '',
//     // initialValue: '2',
//     validationRules: ['required'],
//   ),
// ];

const List<Map<String, dynamic>> inputElementsExample = [
  {
    'type': 'email',
    'name': 'email',
    'label': 'Enter your email',
    'placeholder': 'user@example.com',
    // 'initialValue': 'name@company.com',
  },
  {
    'type': 'password',
    'name': 'password',
    'label': 'Enter your password',
    'placeholder': '12345678',
    // 'initialValue': '0987654321',
  },
  {
    'type': 'textfield',
    'name': 'short_description',
    'label': 'Add a short description',
    'placeholder': 'Lorem ipsum...',
    // 'initialValue': 'short description',
    'validationRules': ['required'],
  },
  {
    'type': 'textarea',
    'name': 'large_description',
    'label': 'Add a large description',
    'placeholder': 'Lorem ipsum isset it dolor asumet inapmet is...',
    // 'initialValue': 'large description',
    'validationRules': ['required'],
  },
  {
    'type': 'radio',
    'name': 'radio',
    'label': 'Select one option',
    'placeholder': '',
    'initialValue': "2",
    'options': [
      {"text": "Text 1", "value": 1},
      {"text": "Text 2", "value": 2},
      {"text": "Text 3", "value": 3},
    ],
    'validationRules': ['required'],
  },
  {
    'type': 'checkbox',
    'name': 'checkbox',
    'label': 'Select the options that apply',
    'placeholder': '',
    // 'initialValue': ["1", "3"],
    'options': [
      {"text": "Text 1", "value": 1},
      {"text": "Text 2", "value": 2},
      {"text": "Text 3", "value": 3},
    ],
    'validationRules': ['required'],
  },
  {
    'type': 'dropdown',
    'name': 'dropdown',
    'label': 'Select one option',
    'placeholder': '',
    // 'initialValue': '2',
    'options': [
      {"text": "Text 1", "value": 1},
      {"text": "Text 2", "value": 2},
      {"text": "Text 3", "value": 3},
    ],
    'validationRules': ['required'],
  },
  {
    'type': 'filterChip',
    'name': 'filterChip',
    'label': 'Select the options that apply',
    'placeholder': '',
    // 'initialValue': ['1', '3'],
    'options': [
      {"text": "Text 1", "value": 1},
      {"text": "Text 2", "value": 2},
      {"text": "Text 3", "value": 3},
    ],
    'validationRules': ['required'],
  },
  {
    'type': 'choiceChip',
    'name': 'choiceChip',
    'label': 'Select one option',
    'placeholder': '',
    // 'initialValue': '2',
    'options': [
      {"text": "Text 1", "value": 1},
      {"text": "Text 2", "value": 2},
      {"text": "Text 3", "value": 3},
    ],
    'validationRules': ['required'],
  },
  {
    'type': 'datePicker',
    'name': 'datePicker',
    'label': 'Select your birth date',
    'placeholder': '',
    // 'initialValue': '2',
    'validationRules': ['required'],
  },
  {
    'type': 'timePicker',
    'name': 'timePicker',
    'label': 'Select your birth hour',
    'placeholder': '',
    // 'initialValue': '2',
    'validationRules': ['required'],
  },
  {
    'type': 'dateTimePicker',
    'name': 'dateTimePicker',
    'label': 'Select your birth date and hour',
    'placeholder': '',
    // 'initialValue': '2',
    'validationRules': ['required'],
  },
  {
    'type': 'dateRangePicker',
    'name': 'dateRangePicker',
    'label': 'Select arrival and departure dates',
    'placeholder': '',
    // 'initialValue': '2',
    'validationRules': ['required'],
  },
  {
    'type': 'rangeSlider',
    'name': 'rangeSlider',
    'label': 'Select a range',
    'placeholder': '',
    // 'initialValue': DateTimeRange(
    //   start: DateTime(
    //     DateTime.now().year,
    //     DateTime.now().month,
    //     DateTime.now().day - 2,
    //   ),
    //   end: DateTime(
    //     DateTime.now().year,
    //     DateTime.now().month,
    //     DateTime.now().day + 7,
    //   ),
    // ),
    'validationRules': ['required'],
  },
  {
    'type': 'slider',
    'name': 'slider',
    'label': 'Select a vaue',
    'placeholder': '',
    // 'initialValue': 10,
    // 'initialValue2': 1000,
    'validationRules': ['required'],
  },
  {
    'type': 'switch',
    'name': 'switch',
    'label': 'Yer or no?',
    'placeholder': '',
    // 'initialValue': '2',
    'validationRules': ['required'],
  },
];

// EXAMPLE USAGE:
// MyForm(
//   margin: EdgeInsets.all(10.0),
//   padding: EdgeInsets.all(20.0),
//   titleText: 'User Registration',
//   subtitleText: 'Please fill out the form below.',
//   descriptionText: 'This form collects user information.',
//   footerText: 'Thank you for registering!',
//   submitButtonText: 'Register',
//   inputElements: inputElementsExample, // Form configuration
//   onSubmit: _handleSubmit, // Handle form submission
// )
