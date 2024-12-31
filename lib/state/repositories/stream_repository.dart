import 'package:siansa_app/domain/services/firebase_service/modules/firebase_stream_service.dart';

class StreamRepository {
  final FirebaseStreamService _firebaseStreamService = FirebaseStreamService();

  // --------------------------------------------------

  // Generic stream method for any model
  Stream<T?> streamDocument<T>({
    required String collectionName,
    required String documentId,
    required T Function(Map<String, dynamic>) fromMap,
  }) {
    return _firebaseStreamService
        .streamDocument(collectionName, documentId)
        .map((data) {
      if (data != null) {
        return fromMap(data);
      }
      return null;
    });
  }

  // --------------------------------------------------
}
