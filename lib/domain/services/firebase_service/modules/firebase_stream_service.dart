import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStreamService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final String collectionName;
  // FirebaseStreamService(this.collectionName);

  FirebaseStreamService();

  // **************************************************
  // STREAM
  // **************************************************

  // Stream document logic
  Stream<Map<String, dynamic>?> streamDocument(
      String collectionName, String id) {
    return _firestore.collection(collectionName).doc(id).snapshots().map(
        (snapshot) =>
            snapshot.exists ? snapshot.data() as Map<String, dynamic>? : null);
  }
}
