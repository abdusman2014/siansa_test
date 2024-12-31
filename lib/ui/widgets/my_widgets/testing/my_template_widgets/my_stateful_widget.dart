import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Variables of different types
  int intValue = 10;
  double doubleValue = 3.14;
  String stringValue = 'Hello, Flutter!';
  bool boolValue = true;
  List<int> listValue = [1, 2, 3];
  Map<String, dynamic> mapValue = {'key': 'value'};
  final Color colorValue = Colors.blue;
  final dynamic dynamicValue = 'Dynamic Value';
  final Function() callbackFunction;

  _MyStatefulWidgetState({this.callbackFunction = _callbackFunction});

  static void _callbackFunction() {
    print('Hello from _callbackFunction');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Variable Types Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Int Value: $intValue'),
            Text('Double Value: $doubleValue'),
            Text('String Value: $stringValue'),
            Text('Bool Value: $boolValue'),
            Text('List Value: ${listValue.toString()}'),
            Text('Map Value: ${mapValue.toString()}'),
          ],
        ),
      ),
    );
  }
}
