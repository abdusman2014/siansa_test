// import 'package:flutter/material.dart';
// import 'package:record/record.dart';

// class MyCustomFormVoiceInput extends StatefulWidget {
//   final String name;
//   final Function(String)? onChanged;

//   const MyCustomFormVoiceInput({
//     Key? key,
//     required this.name,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   _MyCustomFormVoiceInputState createState() =>
//       _MyCustomFormVoiceInputState();
// }

// class _MyCustomFormVoiceInputState extends State<MyCustomFormVoiceInput> {
//   final Record _record = Record();
//   bool isRecording = false;

//   void startRecording() async {
//     await _record.start();
//     setState(() {
//       isRecording = true;
//     });
//   }

//   void stopRecording() async {
//     String? path = await _record.stop();
//     setState(() {
//       isRecording = false;
//     });
//     if (path != null && widget.onChanged != null) {
//       widget.onChanged!(path); // Pass the file path to the parent
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(widget.name),
//         const SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: isRecording ? stopRecording : startRecording,
//           child: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
//         ),
//       ],
//     );
//   }
// }
