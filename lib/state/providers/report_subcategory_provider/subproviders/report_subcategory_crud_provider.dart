import 'package:flutter/material.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/report_subcategory_model.dart';
import 'package:siansa_app/state/providers/crud_provider.dart';
import 'package:siansa_app/state/providers/crud_sub_provider.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/report_subcategory_provider.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = ReportSubcategoryModel;
const dataset = DatasetsConstants.REPORT_SUBCATEGORIES_DATASET;

String dataNameSG = 'Report Subcategory';
String dataNamePL = 'Report Subcategories';
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class TextStrings {
  static String createOne = 'Creating $dataNameSG...';
  static String createMany = 'Creating $dataNamePL...';
  static String readOneById = 'Reading $dataNameSG...';
  static String readManyById = 'Reading $dataNamePL...';
  static String readAll = 'Reading all $dataNamePL...';
  static String readAllByFilters = 'Reading $dataNamePL by filters...';
  static String updateOneById = 'Updating $dataNameSG...';
  static String updateOneByIdExistingFieldsOnly = 'Updating $dataNameSG...';
  static String updateManyById = 'Updating $dataNamePL...';
  static String updateManyByIdExistingFieldsOnly = 'Updating $dataNamePL...';
  static String updateAll = 'Updating $dataNamePL...';
  static String updateAllExistingFieldsOnly = 'Updating $dataNamePL...';
  static String updateAllByFilters = 'Updating $dataNamePL...';
  static String deleteOneById = 'Deleting $dataNameSG...';
  static String deleteManyById = 'Deleting $dataNamePL...';
  static String deleteAll = 'Deleting $dataNamePL...';
  static String deleteAllByFilters = 'Deleting $dataNamePL...';
}

class ReportSubcategoryCRUDProvider with ChangeNotifier {
  final ReportSubcategoryProvider reportSubcategoryProvider;

  ReportSubcategoryCRUDProvider(this.reportSubcategoryProvider);

  // --------------------------------------------------

  final CRUDSubProvider<ModelType> _crudSubProvider =
      CRUDSubProvider<ModelType>(
    CRUDProvider(),
    dataset: dataset,
    fromMap: ModelType.fromMap,
    toMap: (model) => model.toMap(),
  );

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  dynamic createOneResult;
  dynamic createManyResult;
  ModelType? readOneByIdResult;
  List<ModelType>? readManyByIdResult;
  List<ModelType>? readAllResult;
  List<ModelType>? readAllByFiltersResult;
  dynamic updateOneByIdResult;
  dynamic updateOneByIdExistingFieldsOnlyResult;
  dynamic updateManyByIdResult;
  dynamic updateManyByIdExistingFieldsOnlyResult;
  dynamic updateAllResult;
  dynamic updateAllExistingFieldsOnlyResult;
  dynamic updateAllByFiltersResult;
  dynamic deleteOneByIdResult;
  dynamic deleteManyByIdResult;
  dynamic deleteAllResult;
  dynamic deleteAllByFiltersResult;

  // Getters
  // --------------------------------------------------

  dynamic get getCreateOneResult => createOneResult;
  dynamic get getCreateManyResult => createManyResult;
  ModelType? get getReadOneByIdResult => readOneByIdResult;
  List<ModelType>? get getReadManyByIdResult => readManyByIdResult;
  List<ModelType>? get getReadAllResult => readAllResult;
  List<ModelType>? get getReadAllByFiltersResult => readAllByFiltersResult;
  dynamic get getUpdateOneByIdResult => updateOneByIdResult;
  dynamic get getUpdateOneByIdExistingFieldsOnlyResult =>
      updateOneByIdExistingFieldsOnlyResult;
  dynamic get getUpdateManyByIdResult => updateManyByIdResult;
  dynamic get getUpdateManyByIdExistingFieldsOnlyResult =>
      updateManyByIdExistingFieldsOnlyResult;
  dynamic get getUpdateAllResult => updateAllResult;
  dynamic get getUpdateAllExistingFieldsOnlyResult =>
      updateAllExistingFieldsOnlyResult;
  dynamic get getUpdateAllByFiltersResult => updateAllByFiltersResult;
  dynamic get getDeleteOneByIdResult => deleteOneByIdResult;
  dynamic get getDeleteManyByIdResult => deleteManyByIdResult;
  dynamic get getDeleteAllResult => deleteAllResult;
  dynamic get getDeleteAllByFiltersResult => deleteAllByFiltersResult;

  // Setters
  // --------------------------------------------------

  void setCreateOneResult(dynamic result) {
    createOneResult = result;
    notifyListeners();
  }

  void setCreateManyResult(dynamic result) {
    createManyResult = result;
    notifyListeners();
  }

  void setReadOneByIdResult(ModelType? result) {
    readOneByIdResult = result;
    notifyListeners();
  }

  void setReadManyByIdResult(List<ModelType>? result) {
    readManyByIdResult = result;
    notifyListeners();
  }

  void setReadAllResult(List<ModelType>? result) {
    readAllResult = result;
    notifyListeners();
  }

  void setReadAllByFiltersResult(List<ModelType>? result) {
    readAllByFiltersResult = result;
    notifyListeners();
  }

  void setUpdateOneByIdResult(dynamic result) {
    updateOneByIdResult = result;
    notifyListeners();
  }

  void setUpdateOneByIdExistingFieldsOnlyResult(dynamic result) {
    updateOneByIdExistingFieldsOnlyResult = result;
    notifyListeners();
  }

  void setUpdateManyByIdResult(dynamic result) {
    updateManyByIdResult = result;
    notifyListeners();
  }

  void setUpdateManyByIdExistingFieldsOnlyResult(dynamic result) {
    updateManyByIdExistingFieldsOnlyResult = result;
    notifyListeners();
  }

  void setUpdateAllResult(dynamic result) {
    updateAllResult = result;
    notifyListeners();
  }

  void setUpdateAllExistingFieldsOnlyResult(dynamic result) {
    updateAllExistingFieldsOnlyResult = result;
    notifyListeners();
  }

  void setUpdateAllByFiltersResult(dynamic result) {
    updateAllByFiltersResult = result;
    notifyListeners();
  }

  void setDeleteOneByIdResult(dynamic result) {
    deleteOneByIdResult = result;
    notifyListeners();
  }

  void setDeleteManyByIdResult(dynamic result) {
    deleteManyByIdResult = result;
    notifyListeners();
  }

  void setDeleteAllResult(dynamic result) {
    deleteAllResult = result;
    notifyListeners();
  }

  void setDeleteAllByFiltersResult(dynamic result) {
    deleteAllByFiltersResult = result;
    notifyListeners();
  }

  // **************************************************
  // CREATE
  // **************************************************

  Future<void> createOne(
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    var result = await _crudSubProvider.createOne(context, data, '');
    setCreateOneResult(result);
    notifyListeners();
    return result;
  }

  Future<void> createMany(
    BuildContext context,
    List<Map<String, dynamic>> dataList,
  ) async {
    var result = await _crudSubProvider.createMany(context, dataList, '');
    setCreateManyResult(result);
    notifyListeners();
    return result;
  }

  // **************************************************
  // READ
  // **************************************************

  Future<dynamic> readOneById(
    BuildContext context,
    String id,
  ) async {
    var result = await _crudSubProvider.readOneById(context, id, '');
    setReadOneByIdResult(result);
    notifyListeners();
    return result;
  }

  Future<List<ModelType>?> readManyById({
    required BuildContext context,
    required List<String> ids,
    String? loadingText = '',
    String orderBy = 'id',
    bool descending = false,
  }) async {
    var result = await _crudSubProvider.readManyById(
      context: context,
      loadingText: '',
      ids: ids,
      orderBy: orderBy,
      descending: descending,
    );
    setReadManyByIdResult(result);
    notifyListeners();
    return result;
  }

  Future<dynamic> readAll({
    required BuildContext context,
    String? loadingText = '',
    String orderBy = 'id',
    bool descending = false,
  }) async {
    var result = await _crudSubProvider.readAll(
      context: context,
      loadingText: '',
      orderBy: orderBy,
      descending: descending,
    );
    setReadAllResult(result);
    notifyListeners();
    return result;
  }

  Future<List<dynamic>?> readAllByFilters(
    BuildContext context,
    Map<String, dynamic> conditions,
  ) async {
    var result =
        await _crudSubProvider.readAllByFilters(context, conditions, '');
    setReadAllByFiltersResult(result);
    notifyListeners();
    return result;
  }

  // **************************************************
  // UPDATE
  // **************************************************

  Future<void> updateOneById(
    BuildContext context,
    String id,
    Map<String, dynamic> data,
  ) async {
    var result = await _crudSubProvider.updateOneById(context, id, data, '');
    setUpdateOneByIdResult(result);
    notifyListeners();
    return result;
  }

  Future<void> updateOneByIdExistingFieldsOnly(
    BuildContext context,
    String id,
    Map<String, dynamic> data,
  ) async {
    var result = await _crudSubProvider.updateOneByIdExistingFieldsOnly(
        context, id, data, '');
    setUpdateOneByIdExistingFieldsOnlyResult(result);
    notifyListeners();
    return result;
  }

  Future<void> updateManyById(
    BuildContext context,
    List<String> ids,
    Map<String, dynamic> data,
  ) async {
    var result = await _crudSubProvider.updateManyById(context, ids, data, '');
    setUpdateManyByIdResult(result);
    notifyListeners();
    return result;
  }

  Future<void> updateManyByIdExistingFieldsOnly(
    BuildContext context,
    List<String> ids,
    Map<String, dynamic> data,
  ) async {
    var result = await _crudSubProvider.updateManyByIdExistingFieldsOnly(
        context, ids, data, '');
    setUpdateManyByIdExistingFieldsOnlyResult(result);
    notifyListeners();
    return result;
  }

  Future<void> updateAll(
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    var result = await _crudSubProvider.updateAll(context, data, '');
    setUpdateAllResult(result);
    notifyListeners();
    return result;
  }

  Future<void> updateAllExistingFieldsOnly(
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    var result =
        await _crudSubProvider.updateAllExistingFieldsOnly(context, data, '');
    setUpdateAllExistingFieldsOnlyResult(result);
    notifyListeners();
    return result;
  }

  Future<void> updateAllByFilters(
    BuildContext context,
    Map<String, dynamic> conditions,
    Map<String, dynamic> updateData,
  ) async {
    var result = await _crudSubProvider.updateAllByFilters(
        context, conditions, updateData, '');
    setUpdateAllByFiltersResult(result);
    notifyListeners();
    return result;
  }

  // updateAllByFiltersExistingFieldsOnly

  // **************************************************
  // DELETE
  // **************************************************

  Future<void> deleteOneById(
    BuildContext context,
    String id,
  ) async {
    var result = await _crudSubProvider.deleteOneById(context, id, '');
    setDeleteOneByIdResult(result);
    notifyListeners();
    return result;
  }

  Future<void> deleteManyById(
    BuildContext context,
    List<String> ids,
  ) async {
    var result = await _crudSubProvider.deleteManyById(context, ids, '');
    setDeleteManyByIdResult(result);
    notifyListeners();
    return result;
  }

  Future<void> deleteAll(BuildContext context) async {
    var result = await _crudSubProvider.deleteAll(context, '');
    setDeleteAllResult(result);
    notifyListeners();
    return result;
  }

  Future<void> deleteAllByFilters(
    BuildContext context,
    Map<String, dynamic> conditions,
  ) async {
    var result =
        await _crudSubProvider.deleteAllByFilters(context, conditions, '');
    setDeleteAllByFiltersResult(result);
    notifyListeners();
    return result;
  }

  // deleteDocumentFields
}
