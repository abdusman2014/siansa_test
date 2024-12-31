import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  // Variables of each type
  final int intValue = 10;
  final double doubleValue = 3.14;
  final String stringValue = 'Hello, Flutter!';
  final bool boolValue = true;
  final List<int> listValue = [1, 2, 3];
  final Map<String, dynamic> mapValue = {'key': 'value'};
  final Color colorValue = Colors.blue;
  final dynamic dynamicValue = 'Dynamic Value';
  final Function() callbackFunction;

  MyStatelessWidget({this.callbackFunction = _callbackFunction});

  static void _callbackFunction() {
    print('Hello from _callbackFunction');
  }

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
