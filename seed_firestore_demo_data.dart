// To run this file from terminal, use the next command:
// flutter run --no-sound-null-safety seed_firestore_demo_data.dart
// dart run seed_firestore_demo_data.dart

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> main() async {
//   // Initialize Firebase
//   await Firebase.initializeApp();

//   // Define your demo data seeding function
//   Future<void> seedDemoData() async {
//     final CollectionReference usersCollection =
//         FirebaseFirestore.instance.collection('TestUsers');

//     // Example data
//     List<Map<String, dynamic>> demoData = [
//       {'name': 'Alice', 'email': 'alice@example.com', 'age': 25},
//       {'name': 'Bob', 'email': 'bob@example.com', 'age': 30},
//       {'name': 'Charlie', 'email': 'charlie@example.com', 'age': 35},
//     ];

//     for (Map<String, dynamic> user in demoData) {
//       await usersCollection.add(user);
//       print("User added: ${user['name']}");
//     }

//     print("Demo data has been successfully added to Firestore.");
//   }

//   // Call the seeding function
//   await seedDemoData();
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Initialize Firebase (ensure Firebase CLI setup for Dart-only)
  await Firebase.initializeApp();

  // Reference to Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Example data to seed
  List<Map<String, dynamic>> demoData = [
    {'email': 'user1@example.com', 'userRoleId': 'admin'},
    {'email': 'user2@example.com', 'userRoleId': 'user'},
  ];

  // Insert demo data
  for (var data in demoData) {
    await firestore.collection('users').add(data);
  }

  print("Demo data seeded successfully!");
}
