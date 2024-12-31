import 'package:flutter/material.dart';

/* *** USAGE ***
MyStatefulParamsWidget(
  intValue: 42,
  doubleValue: 3.14,
  stringValue: 'Hello from parent!',
  boolValue: true,
  listValue: [1, 2, 3],
  mapValue: {'key': 'value'},
  dynamicValue: 'Dynamic Value',
)
*/

class MyStatefulParamsWidget extends StatefulWidget {
  final int intValue;
  final double doubleValue;
  final String stringValue;
  final bool boolValue;
  final List<int> listValue;
  final Map<String, dynamic> mapValue;
  final dynamic dynamicValue;
  final Color colorValue;
  final Function() callback;

  const MyStatefulParamsWidget({
    Key? key,
    required this.intValue,
    required this.doubleValue,
    required this.stringValue,
    required this.boolValue,
    required this.listValue,
    required this.mapValue,
    required this.dynamicValue,
    required this.colorValue,
    required this.callback,
  }) : super(key: key);

  @override
  _MyStatefulParamsWidgetState createState() => _MyStatefulParamsWidgetState();
}

class _MyStatefulParamsWidgetState extends State<MyStatefulParamsWidget> {
  late int intValue;
  late double doubleValue;
  late String stringValue;
  late bool boolValue;
  late List<int> listValue;
  late Map<String, dynamic> mapValue;

  @override
  void initState() {
    super.initState();
    intValue = widget.intValue;
    doubleValue = widget.doubleValue;
    stringValue = widget.stringValue;
    boolValue = widget.boolValue;
    listValue = widget.listValue;
    mapValue = widget.mapValue;
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
