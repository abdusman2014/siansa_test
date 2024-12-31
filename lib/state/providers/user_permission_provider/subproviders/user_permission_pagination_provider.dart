import 'package:flutter/material.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/user_permission_model.dart';
import 'package:siansa_app/state/providers/pagination_provider.dart';
import 'package:siansa_app/state/providers/pagination_sub_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/user_permission_provider.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = UserPermissionModel;
const dataset = DatasetsConstants.USER_PERMISSIONS_DATASET;

const String orderBy = 'name'; // 'createdAt' or 'id'
const int docsPerPage = 10;
const bool descending = false; // ASC: 1-10, A-Z | DESC: 10-1, Z-A
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class UserPermissionPaginationProvider with ChangeNotifier {
  final UserPermissionProvider userPermissionProvider;

  UserPermissionPaginationProvider(this.userPermissionProvider);

  // --------------------------------------------------

  final PaginationSubProvider<ModelType> _paginationSubProvider =
      PaginationSubProvider<ModelType>(
    PaginationProvider(),
    dataset: dataset,
    fromMap: ModelType.fromMap,
    toMap: (model) => model.toMap(),
  );

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  final String _orderBy = orderBy;
  final int _docsPerPage = docsPerPage;
  final bool _descending = descending;

  List<ModelType> paginationData = [];

  // Getters
  // --------------------------------------------------

  List<ModelType> get getPaginationData => paginationData;

  // Setters
  // --------------------------------------------------

  void setPaginationData(List<ModelType> data) {
    paginationData = data;
    notifyListeners();
  }

  // **************************************************
  // GET FIRST PAGE
  // **************************************************

  Future<void> getFirstPage({
    required BuildContext context,
    int? docsPerPage,
    String? orderBy,
    bool? descending,
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
    docsPerPage = docsPerPage ?? _docsPerPage;
    orderBy = orderBy ?? _orderBy;
    descending = descending ?? _descending;

    var result = await _paginationSubProvider.getFirstPage(
      context: context,
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

    setPaginationData(result ?? []);
    notifyListeners();
    return result;
  }

  // **************************************************
  // GET NEXT PAGE
  // **************************************************

  Future<void> getNextPage({
    required BuildContext context,
    int? docsPerPage,
    String? orderBy,
    bool? descending,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
  }) async {
    docsPerPage = docsPerPage ?? _docsPerPage;
    orderBy = orderBy ?? _orderBy;
    descending = descending ?? _descending;

    var result = await _paginationSubProvider.getNextPage(
      context: context,
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

    setPaginationData(result ?? []);
    notifyListeners();
    return result;
  }

  // **************************************************
  // GET PREVIOUS PAGE
  // **************************************************

  Future<void> getPreviousPage({
    required BuildContext context,
    int? docsPerPage,
    String? orderBy,
    bool? descending,
    Map<String, dynamic>? equalityFilters,
    Map<String, List<String>>? inFilters,
    Map<String, Map<String, dynamic>>? rangeFilters,
    Map<String, dynamic>? arrayContainsFilters,
    Map<String, List<String>>? arrayContainsAnyFilters,
    Map<String, dynamic>? notEqualFilters,
    Map<String, List<String>>? notInFilters,
    List<String>? isNullFilters,
  }) async {
    docsPerPage = docsPerPage ?? _docsPerPage;
    orderBy = orderBy ?? _orderBy;
    descending = descending ?? _descending;

    var result = await _paginationSubProvider.getPreviousPage(
      context: context,
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

    setPaginationData(result ?? []);
    notifyListeners();
    return result;
  }
}
