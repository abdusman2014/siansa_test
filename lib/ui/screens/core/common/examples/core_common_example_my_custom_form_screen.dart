import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_1.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_2.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_3.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_4.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_5.dart';

class CoreCommonExampleMyCustomFormScreen extends StatelessWidget {
  const CoreCommonExampleMyCustomFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _renderMyCustomForm(
        context: context,
        selectedForm: 2,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Title Here')),
      body: SingleChildScrollView(
        child: _renderMyCustomForm(context: context, selectedForm: 1),
      ),
    );
  }

  Widget _renderMyCustomForm({
    required BuildContext context,
    required int selectedForm,
  }) {
    switch (selectedForm) {
      /* **************************************************
      DEMO 1: Shows all form inputs with default styles. 1 column.
      ************************************************** */

      case 1:
        return MyCustomFormExample1(
          onSubmit: (values) =>
              {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
        );

      /* **************************************************
      DEMO 2: Shows all form inputs with custom styles. 1 column.
      ************************************************** */

      case 2:
        return MyCustomFormExample2(
          onSubmit: (values) =>
              {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
        );

      /* **************************************************
      DEMO 3: Shows some inputs using Form Layout1 which renders 2 columns
      These 2 columns turn into 1 column if you are on mobile (responsive form).
      Has a bottom row with 1 column to add submit button.
      ************************************************** */

      case 3:
        return MyCustomFormExample3(
          onSubmit: (values) =>
              {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
        );

      /* **************************************************
      DEMO 4: Shows some inputs using Form Layout1 which renders 2 columns
      These 2 columns turns into 1 column if you are on mobile (responsive form).
      Has a bottom row with 2 columns to add cancel/goBack button and submit button.
      ************************************************** */

      case 4:
        return MyCustomFormExample4(
          onSubmit: (values) =>
              {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
        );

      /* **************************************************
      DEMO 5: Form with initial values set from the parent widget.
      Shows all form inputs with default styles. 1 column.
      ************************************************** */

      case 5:
        return MyCustomFormExample5(
          initialValues: {
            'phoneCountryCode': '+52',
            'phone': '6691993204',
            'email': 'user@mail.com',
            'password': '12345678',
            'textarea': 'Lorem ipsum isut it dolor amet..',
            'color': Colors.pinkAccent,
            'rating': 3.00,
            'dateTime': DateTime(2019, 08, 1, 10, 30),
            'date': DateTime(2021, 12, 24),
            'dateRangeStart': DateTime(1991, 02, 14),
            'dateRangeEnd': DateTime(2021, 12, 24),
            'time': const TimeOfDay(hour: 10, minute: 30),
            'timeRangeStart': const TimeOfDay(hour: 11, minute: 15),
            'timeRangeEnd': const TimeOfDay(hour: 13, minute: 52),
            'rangeMin': 100.00,
            'rangeMax': 1000.00,
            'rangeMinSelected': 150.00,
            'rangeMaxSelected': 950.00,
            'sliderMin': 1,
            'sliderMax': 10,
            'slider': 5,
            'switch': true,
            'dropdown': '3',
            'checkbox': const ['a', 'c'],
            'radio': 'C',
            'signaturePoints': const [
              Offset(175.9, 94.0),
              Offset(175.9, 93.4),
              Offset(180.8, 93.4),
              Offset(210.9, 113.4),
              Offset(246.6, 141.6),
              Offset(285.6, 172.8),
              Offset(300.6, 184.1),
              null,
              Offset(206.4, 168.1),
              Offset(255.7, 92.9),
              null
            ],
          },
          dropdownInputOptions: const [
            {'text': 'O P T I O N  #1', 'value': '1'},
            {'text': 'O P T I O N  #2', 'value': '2'},
            {'text': 'O P T I O N  #3', 'value': '3'},
          ],
          checkboxInputOptions: const [
            {'text': 'O P T I O N  [A]', 'value': 'a'},
            {'text': 'O P T I O N  [B]', 'value': 'b'},
            {'text': 'O P T I O N  [C]', 'value': 'c'},
          ],
          radioInputOptions: const [
            {'text': 'O P T I O N  (A)', 'value': 'A'},
            {'text': 'O P T I O N  (B)', 'value': 'B'},
            {'text': 'O P T I O N  (C)', 'value': 'C'},
          ],
          onSubmit: (values) =>
              {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
        );

      default:
        return const Center(
          child: Text('Select Form'),
        );
    }

    /* **************************************************
    return Scaffold(
      // body: MyCustomFormExample1(
      //   onSubmit: (values) => {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
      // ),
      body: Column(
        children: [
          MyCustomFormExample1(
            onSubmit: (values) => {debugPrint('----> MyCustomForm onSubmit values:\n$values')},
          ),
          ElevatedButton(
            onPressed: () {
              //
            },
            child: Text('click'),
          ),
        ],
      ),
    );
    ************************************************** */
  }
}
