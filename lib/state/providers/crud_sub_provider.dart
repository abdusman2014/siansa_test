import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/state/providers/crud_provider.dart';
import 'package:siansa_app/state/providers/provider_utils.dart';
import 'package:siansa_app/state/repositories/crud_repository.dart';

class CRUDSubProvider<T> with ChangeNotifier {
  var _crudProvider;
  final CRUDProvider crudProvider;
  final CRUDRepository _crudRepository;
  final T Function(Map<String, dynamic> map) fromMap;
  final Map<String, dynamic> Function(T model) toMap;
  final String dataset;

  CRUDSubProvider(
    this.crudProvider, {
    this.dataset = '',
    T Function(Map<String, dynamic>)? fromMap,
    Map<String, dynamic> Function(T)? toMap,
  })  : fromMap = fromMap ?? ((map) => map as T),
        toMap = toMap ?? ((model) => model as Map<String, dynamic>),
        _crudRepository = CRUDRepository(dataset);

  // **************************************************
  // CREATE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> createOne(
    BuildContext context,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    T model = fromMap(data);
    Map<String, dynamic> mapData = toMap(model);

    var repositoryResponse = await _crudRepository.createOne(mapData);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setCreateOneResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setCreateOneResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> createMany(
    BuildContext context,
    List<Map<String, dynamic>> dataList,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    List<T> models = dataList.map(fromMap).toList();
    List<Map<String, dynamic>> mapList = models.map(toMap).toList();

    var repositoryResponse = await _crudRepository.createMany(mapList);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setCreateManyResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setCreateManyResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // READ
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<T?> readOneById(
    BuildContext context,
    String id,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.readOneById(id);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setReadOneByIdResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    final resultData = repositoryResponse.data!;

    final resultModel = fromMap(resultData);

    final resultMap = toMap(resultModel);

    _crudProvider.setReadOneByIdResult(resultModel);
    notifyListeners();

    ProviderUtils.hideLoading();

    return resultModel;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<List<T>?> readManyById({
    required BuildContext context,
    required List<String> ids,
    String? loadingText = '',
    String orderBy = 'id',
    bool descending = false,
  }) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.readManyById(
      orderBy: orderBy,
      descending: descending,
      ids: ids,
    );

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setReadManyByIdResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    var resultData = repositoryResponse.data;
    resultData = resultData as List<Map<String, dynamic>>;
    List<T> modelList = resultData.map<T>((doc) => fromMap(doc)).toList();

    _crudProvider.setReadManyByIdResult(modelList);
    notifyListeners();

    ProviderUtils.hideLoading();

    return modelList;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<List<T>?> readAll({
    required BuildContext context,
    String? loadingText = '',
    String orderBy = 'id',
    bool descending = false,
  }) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.readAll(
      orderBy: orderBy,
      descending: descending,
    );

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setReadAllResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    var resultData = repositoryResponse.data;
    resultData = resultData as List<Map<String, dynamic>>;
    List<T> modelList = resultData.map<T>((doc) => fromMap(doc)).toList();

    _crudProvider.setReadAllResult(modelList);
    notifyListeners();

    ProviderUtils.hideLoading();

    return modelList;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<List<T>?> readAllByFilters(
    BuildContext context,
    Map<String, dynamic> filters,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.readAllByFilters(filters);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setReadAllByFiltersResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return [];
    }

    var resultData = repositoryResponse.data;
    resultData = resultData as List<Map<String, dynamic>>;
    List<T> modelList = resultData.map<T>((doc) => fromMap(doc)).toList();

    _crudProvider.setReadAllByFiltersResult(modelList);
    notifyListeners();

    ProviderUtils.hideLoading();

    return modelList;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // UPDATE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateOneById(
    BuildContext context,
    String id,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.updateOneById(id, data);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateOneByIdResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateOneByIdResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateOneByIdExistingFieldsOnly(
    BuildContext context,
    String id,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse =
        await _crudRepository.updateOneByIdExistingFieldsOnly(id, data);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateOneByIdExistingFieldsOnlyResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateOneByIdExistingFieldsOnlyResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateManyById(
    BuildContext context,
    List<String> ids,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.updateManyById(ids, data);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateManyByIdResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateManyByIdResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateManyByIdExistingFieldsOnly(
    BuildContext context,
    List<String> ids,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse =
        await _crudRepository.updateManyByIdExistingFieldsOnly(ids, data);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateManyByIdExistingFieldsOnlyResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateManyByIdExistingFieldsOnlyResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateAll(
    BuildContext context,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.updateAll(data);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateAllResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateAllResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateAllExistingFieldsOnly(
    BuildContext context,
    Map<String, dynamic> data,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse =
        await _crudRepository.updateAllExistingFieldsOnly(data);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateAllExistingFieldsOnlyResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateAllExistingFieldsOnlyResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> updateAllByFilters(
    BuildContext context,
    Map<String, dynamic> conditions,
    Map<String, dynamic> updateData,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse =
        await _crudRepository.updateAllByFilters(conditions, updateData);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setUpdateAllByFiltersResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setUpdateAllByFiltersResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // updateAllByFiltersExistingFieldsOnly

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // DELETE
  // **************************************************

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> deleteOneById(
    BuildContext context,
    String id,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.deleteOneById(id);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setDeleteOneByIdResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setDeleteOneByIdResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> deleteManyById(
    BuildContext context,
    List<String> ids,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.deleteManyById(ids);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setDeleteManyByIdResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setDeleteManyByIdResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> deleteAll(
    BuildContext context,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse = await _crudRepository.deleteAll();

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setDeleteAllResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setDeleteAllResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  Future<dynamic> deleteAllByFilters(
    BuildContext context,
    Map<String, dynamic> conditions,
    String? loadingText,
  ) async {
    _doThisAtInit(context);

    ProviderUtils.showLoading(context, text: loadingText ?? '');

    var repositoryResponse =
        await _crudRepository.deleteAllByFilters(conditions);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);

      _crudProvider.setErrorMessage(repositoryResponse.errorMessage!);
      _crudProvider.setDeleteAllByFiltersResult(null);
      notifyListeners();

      ProviderUtils.hideLoading();

      return null;
    }

    _crudProvider.setDeleteAllByFiltersResult({});
    notifyListeners();

    ProviderUtils.hideLoading();

    return {};
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // deleteDocumentFields

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // **************************************************
  // HELPER FUNCTIONS
  // **************************************************

  void _doThisAtInit(context) {
    _crudProvider = Provider.of<CRUDProvider>(context, listen: false);
    _crudProvider.setErrorMessage('');
    notifyListeners();
  }
}
