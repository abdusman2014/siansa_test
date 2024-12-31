import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseFirestorePaginationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(app: Firebase.app(),databaseId: "siansa-dev");
  final String collectionName;

  FirebaseFirestorePaginationService(this.collectionName);

  // // First Page Query
  // Future<Map<String, dynamic>> firstPageQuery({
  //   required String orderBy,
  //   required int docsPerPage,
  //   bool descending = false,
  // }) async {
  //   Query query = _firestore
  //       .collection(collectionName)
  //       .orderBy(orderBy, descending: descending) // Respect the descending flag
  //       .limit(docsPerPage); // Limit to the documents per page
  //
  //   return await queryResultsHelper(query: query);
  // }
  //
  // First Page Query
  //
  // EXAMPLE USAGE:
  // await firstPageQuery(
  //   orderBy: 'timestamp',
  //   docsPerPage: 10,
  //   equalityFilters: {'status': 'active'},
  //   inFilters: {'category': ['books', 'electronics']},
  //   rangeFilters: {'price': {'start': 100, 'end': 500}},
  //   arrayContainsFilters: {'tags': 'tech'},
  //   arrayContainsAnyFilters: {'tags': ['tech', 'news']},
  //   notEqualFilters: {'status': 'inactive'},
  //   notInFilters: {'status': ['inactive', 'deleted']},
  //   isNullFilters: ['description'],
  // );
  //
  // EXPLANATION:
  // • The equality filter ensures that status is 'active'.
  // • The IN filter ensures that the category field matches either 'books' or 'electronics'.
  // • The range filter ensures that the price field is between 100 and 500.
  // • Array-Contains: Ensures that a field (which is an array) contains a specific value.
  // • Array-Contains-Any: Ensures that a field (array) contains any value from a list.
  // • Not-Equal: Ensures that the field does not equal a specific value.
  // • Not-In: Filters for documents where the field does not match any value in a list.
  // • Is Null: Checks if a field is null.
  //
  // KEY POINTS:
  // Equality Filters: These are simple field-value pairs where the document field must equal the provided value.
  // IN Filters: These allow a field to match any value in a list. For example, querying users from a list of possible userIds.
  // Range Filters: You can specify a "start" and/or "end" value for fields that need to fall within a range.
  //
  Future<Map<String, dynamic>> firstPageQuery({
    required int docsPerPage,
    required String orderBy,
    bool descending = false,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
    String? searchTerm,
    List<String> searchFields = const [],
  }) async {
    // Build the initial query
    Query query = _firestore
        .collection(collectionName)
        .orderBy(orderBy, descending: descending)
        .limit(docsPerPage);

    // Apply other filters
    query = queryFiltersHelper(
      query,
      equalityFilters,
      inFilters,
      rangeFilters,
      arrayContainsFilters,
      arrayContainsAnyFilters,
      notEqualFilters,
      notInFilters,
      isNullFilters,
    );

    // If no search term is provided, return all results directly
    if (searchTerm == null || searchTerm.isEmpty || searchFields.isEmpty) {
      return queryResultsHelper(query: query);
    }

    // Convert search term to lowercase for case-insensitive comparison
    final lowercaseSearchTerm = searchTerm.toLowerCase();

    // Fetch results with applied filters
    QuerySnapshot snapshot = await query.get();
    // print('>>>>> snapshot <<<<<');
    // print('$snapshot');
    // print('${snapshot.docs}');

    // Filter documents by checking if any of the specified search fields
    // contain the search term as a substring (case-insensitive)
    final filteredDocuments = snapshot.docs.where((doc) {
      for (var field in searchFields) {
        final fieldValue = doc.get(field)?.toString().toLowerCase();
        if (fieldValue != null && fieldValue.contains(lowercaseSearchTerm)) {
          return true;
        }
      }
      return false;
    }).toList();

    // print('>>>>> filteredDocuments <<<<<');
    // print('$filteredDocuments');

    // // Return filtered results in the desired format
    // return queryResultsHelperFromDocs(filteredDocuments);

    // return queryResultsHelper(query: query);

    // ------------

    if (snapshot.docs.isEmpty || filteredDocuments.isEmpty) {
      return {
        'documents': [],
        'firstDocument': null,
        'lastDocument': null,
      };
    }

    DocumentSnapshot? newFirstDocument = filteredDocuments.first;
    DocumentSnapshot? newLastDocument = filteredDocuments.last;

    // print('>>>>> newFirstDocument <<<<<');
    // print(newFirstDocument);

    // print('>>>>> newLastDocument <<<<<');
    // print(newLastDocument);

    List<Map<String, dynamic>> documents = filteredDocuments
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    return {
      'documents': documents,
      'firstDocument': newFirstDocument,
      'lastDocument': newLastDocument,
    };
    // ------------
  }

  // // Helper function to return results in the correct format
  // Future<Map<String, dynamic>> queryResultsHelperFromDocs(
  //     List<QueryDocumentSnapshot> docs) async {
  //   // Process documents and return a map of data
  //   final results = <String, dynamic>{
  //     'documents': docs.map((doc) => doc.data()).toList(),
  //     'count': docs.length,
  //   };
  //   return results;
  // }

  // Future<Map<String, dynamic>> firstPageQuery({
  //   required int docsPerPage,
  //   required String orderBy,
  //   bool descending = false,
  //   Map<String, dynamic>? equalityFilters,
  //   Map<String, List<String>>? inFilters,
  //   Map<String, Map<String, dynamic>>? rangeFilters,
  //   Map<String, dynamic>? arrayContainsFilters,
  //   Map<String, List<String>>? arrayContainsAnyFilters,
  //   Map<String, dynamic>? notEqualFilters,
  //   Map<String, List<String>>? notInFilters,
  //   List<String>? isNullFilters,
  // }) async {
  //   Query query = _firestore
  //       .collection(collectionName)
  //       .orderBy(orderBy, descending: descending) // Respect the descending flag
  //       .limit(docsPerPage); // Limit to the documents per page

  //   query = queryFiltersHelper(
  //     query,
  //     equalityFilters,
  //     inFilters,
  //     rangeFilters,
  //     arrayContainsFilters,
  //     arrayContainsAnyFilters,
  //     notEqualFilters,
  //     notInFilters,
  //     isNullFilters,
  //   );

  //   return await queryResultsHelper(query: query);
  // }

  // Next Page Query
  Future<Map<String, dynamic>> nextPageQuery({
    required int docsPerPage,
    required String orderBy,
    bool descending = false,
    required DocumentSnapshot? lastDocument,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
  }) async {
    Query query = _firestore
        .collection(collectionName)
        .orderBy(orderBy, descending: descending) // Respect the descending flag
        .startAfterDocument(lastDocument!) // Start after the last document
        .limit(docsPerPage); // Limit to the documents per page

    query = queryFiltersHelper(
      query,
      equalityFilters,
      inFilters,
      rangeFilters,
      arrayContainsFilters,
      arrayContainsAnyFilters,
      notEqualFilters,
      notInFilters,
      isNullFilters,
    );

    return await queryResultsHelper(query: query);
  }

  // Previous Page Query
  Future<Map<String, dynamic>> previousPageQuery({
    required int docsPerPage,
    required String orderBy,
    bool descending = false,
    required DocumentSnapshot? firstDocument,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
  }) async {
    // Reverse the descending flag for fetching the previous documents
    bool reverseOrder = !descending;

    // Query to fetch previous documents in reverse order
    Query query = _firestore
        .collection(collectionName)
        .orderBy(orderBy, descending: reverseOrder) // Reverse the order
        .startAfterDocument(firstDocument!) // End before the first document
        .limit(docsPerPage); // Limit to the documents per page

    query = queryFiltersHelper(
      query,
      equalityFilters,
      inFilters,
      rangeFilters,
      arrayContainsFilters,
      arrayContainsAnyFilters,
      notEqualFilters,
      notInFilters,
      isNullFilters,
    );

    // Fetch the results
    Map<String, dynamic> result = await queryResultsHelper(query: query);

    // Reverse the fetched documents to maintain the original order
    // List<Map<String, dynamic>> reversedDocuments =
    //     result['documents'].reversed.toList();
    dynamic reversedDocuments = result['documents'].reversed.toList();

    return {
      'documents': reversedDocuments,
      // In the reversed query, the last doc is the new first
      'firstDocument': result['lastDocument'],
      // And the first doc is the new last
      'lastDocument': result['firstDocument'],
    };
  }
}

// **************************************************
// HELPERS
// **************************************************

Query queryFiltersHelper(
  Query query,
  Map<String, dynamic>? equalityFilters,
  Map<String, List<String>>? inFilters,
  Map<String, Map<String, dynamic>>? rangeFilters,
  Map<String, dynamic>? arrayContainsFilters,
  Map<String, List<String>>? arrayContainsAnyFilters,
  Map<String, dynamic>? notEqualFilters,
  Map<String, List<String>>? notInFilters,
  List<String>? isNullFilters,
) {
  // Apply equality filters if provided
  if (equalityFilters != null && equalityFilters.isNotEmpty) {
    equalityFilters.forEach((field, value) {
      query = query.where(field, isEqualTo: value);
    });
  }

  // Apply IN filters if provided
  if (inFilters != null && inFilters.isNotEmpty) {
    inFilters.forEach((field, values) {
      query = query.where(field, whereIn: values);
    });
  }

  // Apply range filters if provided
  if (rangeFilters != null && rangeFilters.isNotEmpty) {
    rangeFilters.forEach((field, range) {
      if (range.containsKey('start') && range.containsKey('end')) {
        query = query
            .where(field, isGreaterThanOrEqualTo: range['start'])
            .where(field, isLessThanOrEqualTo: range['end']);
      } else if (range.containsKey('start')) {
        query = query.where(field, isGreaterThanOrEqualTo: range['start']);
      } else if (range.containsKey('end')) {
        query = query.where(field, isLessThanOrEqualTo: range['end']);
      }
    });
  }

  // Apply array-contains filters if provided
  if (arrayContainsFilters != null && arrayContainsFilters.isNotEmpty) {
    arrayContainsFilters.forEach((field, value) {
      query = query.where(field, arrayContains: value);
    });
  }

  // Apply array-contains-any filters if provided
  if (arrayContainsAnyFilters != null && arrayContainsAnyFilters.isNotEmpty) {
    arrayContainsAnyFilters.forEach((field, values) {
      query = query.where(field, arrayContainsAny: values);
    });
  }

  // Apply not-equal filters if provided
  if (notEqualFilters != null && notEqualFilters.isNotEmpty) {
    notEqualFilters.forEach((field, value) {
      query = query.where(field, isNotEqualTo: value);
    });
  }

  // Apply not-in filters if provided
  if (notInFilters != null && notInFilters.isNotEmpty) {
    notInFilters.forEach((field, values) {
      query = query.where(field, whereNotIn: values);
    });
  }

  // Apply is-null filters if provided
  if (isNullFilters != null && isNullFilters.isNotEmpty) {
    isNullFilters.forEach((field) {
      query = query.where(field, isNull: true);
    });
  }

  return query;
}

Future<Map<String, dynamic>> queryResultsHelper({
  required Query query,
}) async {
  QuerySnapshot querySnapshot = await query.get();

  if (querySnapshot.docs.isEmpty) {
    return {
      'documents': [],
      'firstDocument': null,
      'lastDocument': null,
    };
  }

  List<Map<String, dynamic>> documents = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  DocumentSnapshot? newFirstDocument = querySnapshot.docs.first;
  DocumentSnapshot? newLastDocument = querySnapshot.docs.last;

  return {
    'documents': documents,
    'firstDocument': newFirstDocument,
    'lastDocument': newLastDocument,
  };
}
