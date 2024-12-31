import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:siansa_app/domain/services/firebase_service/modules/firebase_firestore_pagination_service.dart';
import 'package:siansa_app/models/state/repositories/repository_response_model.dart';
import 'package:siansa_app/state/repositories/repository_utils.dart';

class PaginationRepository<T> {
  final FirebaseFirestorePaginationService _firebaseFirestorePaginationService;

  PaginationRepository(String collectionName)
      : _firebaseFirestorePaginationService =
            FirebaseFirestorePaginationService(collectionName);

  // **************************************************

  Future<RepositoryResponseModel<dynamic>> getFirstPage({
    required int docsPerPage,
    required String orderBy,
    required bool descending,
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
    print('Repository: Getting first page...');

    try {
      Map<String, dynamic>? serviceResponse =
          await _firebaseFirestorePaginationService.firstPageQuery(
        docsPerPage: docsPerPage,
        orderBy: orderBy,
        descending: descending,
        equalityFilters: equalityFilters,
        inFilters: inFilters,
        rangeFilters: rangeFilters,
        arrayContainsFilters: arrayContainsFilters,
        arrayContainsAnyFilters: arrayContainsAnyFilters,
        notEqualFilters: notEqualFilters,
        notInFilters: notInFilters,
        isNullFilters: isNullFilters,
        searchTerm: searchTerm,
        searchFields: searchFields,
      );

      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      print(e);
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<RepositoryResponseModel<dynamic>> getNextPage({
    required DocumentSnapshot lastDocument,
    required int docsPerPage,
    required String orderBy,
    required bool descending,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
  }) async {
    print('Repository: Getting next page...');

    try {
      Map<String, dynamic>? serviceResponse =
          await _firebaseFirestorePaginationService.nextPageQuery(
        lastDocument: lastDocument,
        docsPerPage: docsPerPage,
        orderBy: orderBy,
        descending: descending,
        equalityFilters: equalityFilters,
        inFilters: inFilters,
        rangeFilters: rangeFilters,
        arrayContainsFilters: arrayContainsFilters,
        arrayContainsAnyFilters: arrayContainsAnyFilters,
        notEqualFilters: notEqualFilters,
        notInFilters: notInFilters,
        isNullFilters: isNullFilters,
      );

      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<RepositoryResponseModel<dynamic>> getPreviousPage({
    required DocumentSnapshot firstDocument,
    required int docsPerPage,
    required String orderBy,
    required bool descending,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
  }) async {
    print('Repository: Getting previous page...');

    try {
      Map<String, dynamic>? serviceResponse =
          await _firebaseFirestorePaginationService.previousPageQuery(
        firstDocument: firstDocument,
        docsPerPage: docsPerPage,
        orderBy: orderBy,
        descending: descending,
        equalityFilters: equalityFilters,
        inFilters: inFilters,
        rangeFilters: rangeFilters,
        arrayContainsFilters: arrayContainsFilters,
        arrayContainsAnyFilters: arrayContainsAnyFilters,
        notEqualFilters: notEqualFilters,
        notInFilters: notInFilters,
        isNullFilters: isNullFilters,
      );

      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // **************************************************
}
