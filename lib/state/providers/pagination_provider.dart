import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_pdf_template_model.dart';
import 'package:siansa_app/state/providers/pagination_sub_provider.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/subproviders/report_pdf_template_crud_provider.dart';
import 'package:siansa_app/state/providers/crud_sub_provider.dart';

class PaginationProvider<T> with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final PaginationSubProvider _subProvider;

  void _initializeSubProviders() {
    _subProvider = PaginationSubProvider(this);
  }

  // sub providers access

  PaginationSubProvider get subProvider => _subProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  List<T> paginationData = [];

  List<T> firstPageResult = [];
  List<T> nextPageResult = [];
  List<T> previousPageResult = [];

  String errorMessage = '';

  // Getters
  // --------------------------------------------------

  List<T> get getPaginationData => paginationData;

  List<T> get getFirstPageResult => firstPageResult;
  List<T> get getNextPageResult => nextPageResult;
  List<T> get getPreviousPageResult => previousPageResult;

  dynamic get getErrorMessage => errorMessage;

  // Setters
  // --------------------------------------------------

  void setPaginationData(List<T> data) {
    paginationData = data;
    notifyListeners();
  }

  void setFirstPageResult(List<T> data) {
    firstPageResult = data;
    notifyListeners();
  }

  void setNextPageResult(List<T> data) {
    nextPageResult = data;
    notifyListeners();
  }

  void setPreviousPageResult(List<T> data) {
    previousPageResult = data;
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    errorMessage = errorMessage;
    notifyListeners();
  }

  // **************************************************
  // Constructor (If needed / Loads initial data)
  // **************************************************

  PaginationProvider() {
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
