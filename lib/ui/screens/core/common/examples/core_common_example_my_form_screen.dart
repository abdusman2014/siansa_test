import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/my_form/my_form.dart';
// import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_form/my_form.dart';

class CoreCommonExampleMyFormScreen extends StatefulWidget {
  @override
  _CoreCommonExampleMyFormScreenState createState() =>
      _CoreCommonExampleMyFormScreenState();
}

class _CoreCommonExampleMyFormScreenState
    extends State<CoreCommonExampleMyFormScreen> {
  // Handle form submission
  void _handleSubmit(Map<String, dynamic> formValues, bool isFormValid) {
    if (isFormValid) {
      print("Form Submitted: $formValues");
    } else {
      print("Form is not valid.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: renderMyForm(context, _handleSubmit),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Title Here')),
      body: SingleChildScrollView(
        child: renderMyForm(context, _handleSubmit),
      ),
    );
  }
}

Widget renderMyForm(BuildContext context, _handleSubmit) {
  return MyForm(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(20.0),
    titleText: 'User Registration',
    subtitleText: 'Please fill out the form below.',
    descriptionText: 'This form collects user information.',
    footerText: 'Thank you for registering!',
    submitButtonText: 'Register',
    inputElements: inputElementsExample, // Form configuration
    onSubmit: _handleSubmit, // Handle form submission
  );
}

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
