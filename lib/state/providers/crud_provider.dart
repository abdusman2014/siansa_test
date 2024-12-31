import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_pdf_template_model.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/subproviders/report_pdf_template_crud_provider.dart';
import 'package:siansa_app/state/providers/crud_sub_provider.dart';

class CRUDProvider<T> with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final CRUDSubProvider _subProvider;

  void _initializeSubProviders() {
    _subProvider = CRUDSubProvider(this);
  }

  // sub providers access

  CRUDSubProvider get subProvider => _subProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  dynamic createOneResult;
  dynamic createManyResult;
  T? readOneByIdResult;
  List<T>? readManyByIdResult;
  List<T>? readAllResult;
  List<T>? readAllByFiltersResult;
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

  String errorMessage = '';

  // Getters
  // --------------------------------------------------

  dynamic get getCreateOneResult => createOneResult;
  dynamic get getCreateManyResult => createManyResult;
  T? get getReadOneByIdResult => readOneByIdResult;
  List<T>? get getReadManyByIdResult => readManyByIdResult;
  List<T>? get getReadAllResult => readAllResult;
  List<T>? get getReadAllByFiltersResult => readAllByFiltersResult;
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

  dynamic get getErrorMessage => errorMessage;

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

  void setReadOneByIdResult(T result) {
    readOneByIdResult = result;
    notifyListeners();
  }

  void setReadManyByIdResult(List<T>? result) {
    readManyByIdResult = result;
    notifyListeners();
  }

  void setReadAllResult(List<T>? result) {
    readAllResult = result;
    notifyListeners();
  }

  void setReadAllByFiltersResult(List<T>? result) {
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

  void setErrorMessage(String errorMessage) {
    errorMessage = errorMessage;
    notifyListeners();
  }

  // **************************************************
  // Constructor (If needed / Loads initial data)
  // **************************************************

  CRUDProvider() {
    _initializeSubProviders();
  }

  // **************************************************
  // Dispose method
  // **************************************************

  @override
  void dispose() {
    super.dispose();
  }

  // **************************************************
  // Private Methods/Helpers (if necessary)
  // **************************************************

  // **************************************************
  // Public Methods (to manipulate data/state)
  // **************************************************

  // You can add additional methods here that might coordinate actions
  // between the auth and profile providers if necessary.

  // **************************************************
  // **************************************************
}
