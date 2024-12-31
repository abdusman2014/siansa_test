import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName;

  FirebaseFirestoreService(this.collectionName);

  // **************************************************
  // CREATE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // And ID will be created for the document if it is not found in
  // the data map.
  Future<String> createOne(Map<String, dynamic> data) async {
    // Determine the document ID
    String id =
        data.containsKey('id') && data['id'] != null && data['id'].isNotEmpty
            ? data['id']
            : _firestore.collection(collectionName).doc().id;

    // Check if the document with the given ID already exists
    DocumentReference docRef = _firestore.collection(collectionName).doc(id);
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      debugPrint('Document with id $id already exists. Skipping creation.');
      throw 'Document with id $id already exists. Skipping creation.';
    }

    // Add or update the 'id' in the data map
    data['id'] = id;

    // Set the data in Firestore with the determined document ID
    await docRef.set(data);

    // Return the document ID to the caller
    return id;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> createMany(List<Map<String, dynamic>> documents) async {
    WriteBatch batch = _firestore.batch();

    for (Map<String, dynamic> document in documents) {
      // Check if document has an 'id' field, otherwise generate a new one
      String docId = document.containsKey('id') &&
              document['id'] != null &&
              document['id'].isNotEmpty
          ? document['id']
          : _firestore.collection(collectionName).doc().id;

      // Add or replace the 'id' field in the document
      document['id'] = docId;

      // Get a reference to the document using the provided or generated id
      DocumentReference docRef =
          _firestore.collection(collectionName).doc(docId);

      // Check if the document already exists
      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        print('Document with id $docId already exists. Skipping...');
        continue; // Skip adding this document to the batch
      }

      // Add the document to the batch
      batch.set(docRef, document);
    }

    // Commit the batch operation
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // READ
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<Map<String, dynamic>?> readOneById(String id) async {
    final DocumentSnapshot snapshot =
        await _firestore.collection(collectionName).doc(id).get();
    if (snapshot.exists) {
      return snapshot.exists && snapshot.data() != null
          ? snapshot.data() as Map<String, dynamic>
          : null;
    } else {
      null;
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // // Read many documents by ID
  // Future<List<Map<String, dynamic>>> readManyById(
  //   List<String> docIds,
  // ) async {
  //   List<Map<String, dynamic>> documents = [];
  //   for (String id in docIds) {
  //     DocumentSnapshot doc =
  //         await _firestore.collection(collectionName).doc(id).get();
  //     documents.add(doc.data() as Map<String, dynamic>);
  //   }
  //   return documents;
  // }
  // Read many documents by ID
  Future<List<Map<String, dynamic>>> readManyById({
    String orderBy = 'id',
    bool descending = false,
    required List<String> ids,
  }) async {
    List<Map<String, dynamic>> documents = [];
    for (String id in ids) {
      DocumentSnapshot doc =
          await _firestore.collection(collectionName).doc(id).get();
      documents.add(doc.data() as Map<String, dynamic>);
    }

    // Sort the documents based on the `orderBy` field
    documents.sort((a, b) {
      final aValue = a[orderBy];
      final bValue = b[orderBy];

      // Handle `null` values gracefully
      if (aValue == null || bValue == null) return 0;

      // Determine sorting order
      if (descending) {
        return bValue.compareTo(aValue);
      } else {
        return aValue.compareTo(bValue);
      }
    });

    return documents;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Future<List<Map<String, dynamic>>> readAll() async {
  //   final QuerySnapshot querySnapshot =
  //       await _firestore.collection(collectionName).get();

  //   return querySnapshot.docs
  //       .map((doc) => doc.data() as Map<String, dynamic>)
  //       .toList();
  // }
  Future<List<Map<String, dynamic>>> readAll({
    String orderBy = 'id',
    bool descending = false,
  }) async {
    final QuerySnapshot querySnapshot = await _firestore
        .collection(collectionName)
        .orderBy(orderBy, descending: descending)
        .get();

    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // readAllByFilters()
  // EXAMPLE USAGE:
  // Map<String, dynamic> conditions = {
  //   'status': 'active',
  //   'age': 25,
  // };
  // readAllByFilters(conditions);
  Future<List<Map<String, dynamic>>> readAllByFilters(
    Map<String, dynamic> conditions, // key: field, value: condition value
  ) async {
    Query query = _firestore.collection(collectionName);

    // Add the 'where' conditions dynamically
    conditions.forEach((field, value) {
      query = query.where(field, isEqualTo: value);
    });

    // Execute the query
    final QuerySnapshot querySnapshot = await query.get();

    // Return the list of documents as Maps
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // UPDATE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Updates a document by id.
  // Updates all fields provided in the data map.
  // If the data map contains fields that does not exist in the document
  // it will create these fields.
  Future<void> updateOneById(String id, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(id).update(data);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Updates a document by id.
  // Updates all fields provided in the data map.
  // If the data map contains fields that does not exist in the document
  // it will NOT create these fields.
  Future<void> updateOneByIdExistingFieldsOnly(
    String id,
    Map<String, dynamic> data,
  ) async {
    // Fetch the current document
    final DocumentSnapshot documentSnapshot =
        await _firestore.collection(collectionName).doc(id).get();

    if (!documentSnapshot.exists) {
      throw Exception('Document with id $id does not exist');
    }

    // Extract the existing fields from the document
    final Map<String, dynamic> existingFields =
        documentSnapshot.data() as Map<String, dynamic>;

    // Filter the data to only include keys that exist in the current document
    final Map<String, dynamic> filteredFields = {};
    data.forEach((key, value) {
      if (existingFields.containsKey(key)) {
        filteredFields[key] = value;
      }
    });

    // Update the document with only the existing fields
    if (filteredFields.isNotEmpty) {
      await _firestore
          .collection(collectionName)
          .doc(id)
          .update(filteredFields);
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Update many documents by ID
  Future<void> updateManyById(
    List<String> docIds,
    Map<String, dynamic> data,
  ) async {
    WriteBatch batch = _firestore.batch();
    for (String id in docIds) {
      DocumentReference docRef = _firestore.collection(collectionName).doc(id);
      batch.update(docRef, data);
    }
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> updateManyByIdExistingFieldsOnly(
    List<String> docIds,
    Map<String, dynamic> data,
  ) async {
    WriteBatch batch = _firestore.batch();

    for (String id in docIds) {
      DocumentReference docRef = _firestore.collection(collectionName).doc(id);

      // Get the current document data
      DocumentSnapshot docSnapshot = await docRef.get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Create a new map with only the existing fields
        Map<String, dynamic> existingData =
            docSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> updates = {};

        // Only keep fields from the data map that exist in the existing document
        data.forEach((key, value) {
          if (existingData.containsKey(key)) {
            updates[key] = value; // Only add existing fields
          }
        });

        // Update only if there are valid fields to update
        if (updates.isNotEmpty) {
          batch.update(docRef, updates);
        }
      }
    }

    // Commit the batch update
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> updateAll(
    Map<String, dynamic> data,
  ) async {
    WriteBatch batch = _firestore.batch();

    // Retrieve all documents in the collection
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).get();

    // Loop through each document in the collection
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      DocumentReference docRef =
          _firestore.collection(collectionName).doc(doc.id);
      batch.update(docRef, data);
    }

    // Commit the batch update
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> updateAllExistingFieldsOnly(
    Map<String, dynamic> data,
  ) async {
    WriteBatch batch = _firestore.batch();

    // Retrieve all documents in the collection
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      DocumentReference docRef =
          _firestore.collection(collectionName).doc(doc.id);

      // Get the current document data
      Map<String, dynamic> existingData = doc.data() as Map<String, dynamic>;
      Map<String, dynamic> updates = {};

      // Only keep fields from the data map that exist in the existing document
      data.forEach((key, value) {
        if (existingData.containsKey(key)) {
          updates[key] = value; // Only add existing fields
        }
      });

      // Update only if there are valid fields to update
      if (updates.isNotEmpty) {
        batch.update(docRef, updates);
      }
    }

    // Commit the batch update
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> updateAllByFilters(
    Map<String, dynamic> conditions, // key: field, value: condition value
    Map<String, dynamic> updateData, // key: field, value: updated value
  ) async {
    Query query = _firestore.collection(collectionName);

    // Add the 'where' conditions dynamically
    conditions.forEach((field, value) {
      query = query.where(field, isEqualTo: value);
    });

    // Execute the query to get matching documents
    final QuerySnapshot querySnapshot = await query.get();

    // Start a Firestore batch for updates
    WriteBatch batch = _firestore.batch();

    // Update each document in the query result
    for (var doc in querySnapshot.docs) {
      batch.update(doc.reference, updateData);
    }

    // Commit the batch update
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // updateAllByFiltersExistingFieldsOnly

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // DELETE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> deleteOneById(String id) async {
    await _firestore.collection(collectionName).doc(id).delete();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Delete many documents by ID
  Future<void> deleteManyById(List<String> docIds) async {
    WriteBatch batch = _firestore.batch();
    for (String id in docIds) {
      DocumentReference docRef = _firestore.collection(collectionName).doc(id);
      batch.delete(docRef);
    }
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> deleteAll() async {
    // Get all documents in the collection
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).get();

    WriteBatch batch = _firestore.batch();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      DocumentReference docRef =
          _firestore.collection(collectionName).doc(doc.id);
      batch.delete(docRef); // Add delete operation to the batch
    }

    // Commit the batch delete operation
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<void> deleteAllByFilters(
    Map<String, dynamic> conditions, // key: field, value: condition value
  ) async {
    Query query = _firestore.collection(collectionName);

    // Add the 'where' conditions dynamically
    conditions.forEach((field, value) {
      query = query.where(field, isEqualTo: value);
    });

    // Execute the query to get matching documents
    final QuerySnapshot querySnapshot = await query.get();

    // Start a Firestore batch for deletions
    WriteBatch batch = _firestore.batch();

    // Delete each document in the query result
    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }

    // Commit the batch deletion
    await batch.commit();
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // deleteDocumentFields

  // - - - - - - - - - - - - - - - - - - - - - - - - -
}
