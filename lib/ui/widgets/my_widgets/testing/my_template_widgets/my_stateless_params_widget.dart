import 'package:flutter/material.dart';

/* *** USAGE ***
MyStatelessParamsWidget(
  intValue: 10,
  doubleValue: 3.14,
  stringValue: 'Hello, Flutter!',
  boolValue: true,
  listValue: [1, 2, 3],
  mapValue: {'key': 'value'},
  dynamicValue: 'Dynamic Value',
),
*/

class MyStatelessParamsWidget extends StatelessWidget {
  // Variables of each type
  final int intValue;
  final double doubleValue;
  final String stringValue;
  final bool boolValue;
  final List<int> listValue;
  final Map<String, dynamic> mapValue;
  final dynamic dynamicValue;
  final Color colorValue;
  final Function() callbackFunction;

  // Constructor to receive values from the parent widget
  const MyStatelessParamsWidget({
    Key? key,
    required this.intValue,
    required this.doubleValue,
    required this.stringValue,
    required this.boolValue,
    required this.listValue,
    required this.mapValue,
    required this.dynamicValue,
    required this.colorValue,
    required this.callbackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Variable Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Int Value: $intValue'),
            Text('Double Value: $doubleValue'),
            Text('String Value: $stringValue'),
            Text('Bool Value: $boolValue'),
            Text('List Value: $listValue'),
            Text('Map Value: $mapValue'),
            Text('Dynamic Value: $dynamicValue'),
          ],
        ),
      ),
    );
  }
}
