import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/domain/services/firebase_service/modules/firebase_firestore_service.dart';
import 'package:siansa_app/models/state/repositories/repository_response_model.dart';
import 'package:siansa_app/state/repositories/repository_utils.dart';

class CRUDRepository<T> {
  final FirebaseFirestoreService _firebaseFirestoreService;

  CRUDRepository(String collectionName)
      : _firebaseFirestoreService = FirebaseFirestoreService(collectionName);

  // **************************************************
  // CREATE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> createOne(
    Map<String, dynamic> data,
  ) async {
    print('Repository: Creating data...');

    try {
      final String serviceResponse =
          await _firebaseFirestoreService.createOne(data);

      // return RepositoryUtils.responseSuccess(data: {"id": serviceResponse});
      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> createMany(
    List<Map<String, dynamic>> dataList,
  ) async {
    print('Repository: Creating many data...');

    try {
      await _firebaseFirestoreService.createMany(dataList);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // READ
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> readOneById(
    String documentId,
  ) async {
    print('Repository: Reading data...');

    try {
      final Map<String, dynamic>? serviceResponse =
          await _firebaseFirestoreService.readOneById(documentId);

      if (serviceResponse != null) {
        return RepositoryUtils.responseSuccess(data: serviceResponse);
      } else {
        return RepositoryUtils.responseError();
      }
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> readManyById({
    String orderBy = 'id',
    bool descending = false,
    required List<String> ids,
  }) async {
    print('Repository: Reading many data...');

    try {
      final List<Map<String, dynamic>> serviceResponse =
          await _firebaseFirestoreService.readManyById(ids: ids);
      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> readAll({
    String orderBy = 'id',
    bool descending = false,
  }) async {
    print('Repository: Reading all data from the collection...');

    try {
      final List<Map<String, dynamic>> serviceResponse =
          await _firebaseFirestoreService.readAll(
        orderBy: orderBy,
        descending: descending,
      );

      if (serviceResponse != null) {
        return RepositoryUtils.responseSuccess(data: serviceResponse);
      } else {
        return RepositoryUtils.responseError();
      }
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> readAllByFilters(
    Map<String, dynamic> conditions,
  ) async {
    print('Repository: Reading data with conditions...');

    try {
      final List<Map<String, dynamic>> serviceResponse =
          await _firebaseFirestoreService.readAllByFilters(conditions);

      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // UPDATE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateOneById(
    String documentId,
    Map<String, dynamic> data,
  ) async {
    print('Repository: Updating data with ID: $documentId');

    try {
      await _firebaseFirestoreService.updateOneById(documentId, data);

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateOneByIdExistingFieldsOnly(
    String documentId,
    Map<String, dynamic> data,
  ) async {
    print('Repository: Updating data with ID: $documentId');

    try {
      await _firebaseFirestoreService.updateOneByIdExistingFieldsOnly(
        documentId,
        data,
      );

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateManyById(
    List<String> docIds,
    Map<String, dynamic> data,
  ) async {
    print('Repository: Updating many data...');

    try {
      await _firebaseFirestoreService.updateManyById(docIds, data);

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateManyByIdExistingFieldsOnly(
    List<String> docIds,
    Map<String, dynamic> data,
  ) async {
    print('Repository: Updating many data...');

    try {
      await _firebaseFirestoreService.updateManyByIdExistingFieldsOnly(
        docIds,
        data,
      );

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateAll(
    Map<String, dynamic> data,
  ) async {
    print('Repository: Updating all documents...');

    try {
      await _firebaseFirestoreService.updateAll(data);

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateAllExistingFieldsOnly(
    Map<String, dynamic> data,
  ) async {
    print('Repository: Updating all documents, update only existing fields...');

    try {
      await _firebaseFirestoreService.updateAllExistingFieldsOnly(data);

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> updateAllByFilters(
    Map<String, dynamic> conditions,
    Map<String, dynamic> updateData,
  ) async {
    print('Repository: Updating all documents by filters...');

    try {
      await _firebaseFirestoreService.updateAllByFilters(
        conditions,
        updateData,
      );

      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // updateAllByFiltersExistingFieldsOnly

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // DELETE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> deleteOneById(
      String documentId) async {
    print('Repository: Deleting data with ID: $documentId');

    try {
      await _firebaseFirestoreService.deleteOneById(documentId);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> deleteManyById(
    List<String> docIds,
  ) async {
    print('Repository: Deleting many data...');

    try {
      await _firebaseFirestoreService.deleteManyById(docIds);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> deleteAll() async {
    print('Repository: Deleting all data in the collection');

    try {
      await _firebaseFirestoreService.deleteAll();
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<RepositoryResponseModel<dynamic>> deleteAllByFilters(
    Map<String, dynamic> conditions,
  ) async {
    print('Repository: Deleting all data in the collection by filters');

    try {
      await _firebaseFirestoreService.deleteAllByFilters(conditions);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -
}
