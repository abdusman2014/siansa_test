import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/state/providers/pagination_provider.dart';
import 'package:siansa_app/state/repositories/pagination_repository.dart';
import 'package:siansa_app/state/providers/provider_utils.dart';

class PaginationSubProvider<T> with ChangeNotifier {
  var _paginationProvider;
  final PaginationProvider paginationProvider;
  final PaginationRepository paginationRepository;
  final T Function(Map<String, dynamic> map) fromMap;
  final Map<String, dynamic> Function(T model) toMap;
  final String dataset;

  // Default query variables and values
  final String orderBy;
  final int docsPerPage;
  final bool descending;

  PaginationSubProvider(
    this.paginationProvider, {
    this.orderBy = 'id',
    this.docsPerPage = 5,
    this.descending = false,
    this.dataset = '',
    T Function(Map<String, dynamic>)? fromMap,
    Map<String, dynamic> Function(T)? toMap,
  })  : fromMap = fromMap ?? ((map) => map as T),
        toMap = toMap ?? ((model) => model as Map<String, dynamic>),
        paginationRepository = PaginationRepository(dataset);

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Pagination variables
  DocumentSnapshot? _firstDoc;
  DocumentSnapshot? _lastDoc;

  bool _hasPreviousPage = false;
  bool _isLoading = false;

  int _currentPage = 0;
  List<T> _paginationData = [];

  // - - - - - - - - - - - - - - - - - - - - - - - - -

  // Getters

  DocumentSnapshot? get getFirstDoc => _firstDoc;
  DocumentSnapshot? get getLastDoc => _lastDoc;

  bool get getHasPreviousPage => _hasPreviousPage;
  bool get getIsLoading => _isLoading;

  int get getCurrentPage => _currentPage;
  List<T> get getPaginationData => _paginationData;

  // Setters

  void setFirstDoc(DocumentSnapshot? value) {
    _firstDoc = value;
    notifyListeners();
  }

  void setLastDoc(DocumentSnapshot? value) {
    _lastDoc = value;
    notifyListeners();
  }

  void setHasPreviousPage(bool value) {
    _hasPreviousPage = value;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setCurrentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  void setPaginationData(List<T> data) {
    _paginationData = data;
    notifyListeners();
  }

  // **************************************************
  // Pagination methods
  // **************************************************

  Future<dynamic> getFirstPage({
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
    docsPerPage = docsPerPage ?? this.docsPerPage;
    orderBy = orderBy ?? this.orderBy;
    descending = descending ?? this.descending;

    _initializeLoading(context, 'Loading first page...');

    var repositoryResponse = await paginationRepository.getFirstPage(
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

    if (_isRepositoryResponseSuccess(context, repositoryResponse)) {
      var data =
          repositoryResponse.data['documents'] as List<Map<String, dynamic>>;

      _paginationData = data.map<T>((doc) => fromMap(doc)).toList();
      _currentPage = 1;

      if (repositoryResponse.data['firstDocument'] != null) {
        _firstDoc = repositoryResponse.data['firstDocument'];
      }
      if (repositoryResponse.data['lastDocument'] != null) {
        _lastDoc = repositoryResponse.data['lastDocument'];
      }

      setPaginationData(_paginationData);
      _paginationProvider.setPaginationData(_paginationData);
      _paginationProvider.setFirstPageResult(_paginationData);
      setCurrentPage(_currentPage);
      setFirstDoc(_firstDoc);
      setLastDoc(_lastDoc);
    }

    _finalizeLoading();
    return _paginationData;
  }

  Future<dynamic> getNextPage({
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
    if (_lastDoc == null) return;

    docsPerPage = docsPerPage ?? this.docsPerPage;
    orderBy = orderBy ?? this.orderBy;
    descending = descending ?? this.descending;

    _initializeLoading(context, 'Loading next page...');

    var repositoryResponse = await paginationRepository.getNextPage(
      lastDocument: _lastDoc!,
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

    if (_isRepositoryResponseSuccess(context, repositoryResponse)) {
      var data =
          repositoryResponse.data['documents'] as List<Map<String, dynamic>>;
      _paginationData = data.map<T>((doc) => fromMap(doc)).toList();
      _currentPage++;

      if (repositoryResponse.data['firstDocument'] != null) {
        _firstDoc = repositoryResponse.data['firstDocument'];
      }
      if (repositoryResponse.data['lastDocument'] != null) {
        _lastDoc = repositoryResponse.data['lastDocument'];
      }

      setPaginationData(_paginationData);
      _paginationProvider.setPaginationData(_paginationData);
      _paginationProvider.setNextPageResult(_paginationData);
      setCurrentPage(_currentPage);
      setLastDoc(_lastDoc);
    }

    _finalizeLoading();
    return _paginationData;
  }

  Future<dynamic> getPreviousPage({
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
    if (_firstDoc == null) return;

    docsPerPage = docsPerPage ?? this.docsPerPage;
    orderBy = orderBy ?? this.orderBy;
    descending = descending ?? this.descending;

    _initializeLoading(context, 'Loading previous page...');

    var repositoryResponse = await paginationRepository.getPreviousPage(
      firstDocument: _firstDoc!,
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

    if (_isRepositoryResponseSuccess(context, repositoryResponse)) {
      var data =
          repositoryResponse.data['documents'] as List<Map<String, dynamic>>;
      _paginationData = data.map<T>((doc) => fromMap(doc)).toList();
      _currentPage--;

      if (repositoryResponse.data['firstDocument'] != null) {
        _firstDoc = repositoryResponse.data['firstDocument'];
      }
      if (repositoryResponse.data['lastDocument'] != null) {
        _lastDoc = repositoryResponse.data['lastDocument'];
      }

      setPaginationData(_paginationData);
      _paginationProvider.setPaginationData(_paginationData);
      _paginationProvider.setPreviousPageResult(_paginationData);
      setCurrentPage(_currentPage);
      setFirstDoc(_firstDoc);
    }

    _finalizeLoading();
    return _paginationData;
  }

  // **************************************************
  // HELPER FUNCTIONS
  // **************************************************

  void _doThisAtInit(context) {
    _paginationProvider =
        Provider.of<PaginationProvider>(context, listen: false);
    _paginationProvider.setErrorMessage('');
    notifyListeners();
  }

  void _initializeLoading(BuildContext context, String message) {
    _doThisAtInit(context);

    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();
    ProviderUtils.showLoading(context, text: message);
  }

  void _finalizeLoading() {
    _isLoading = false;
    ProviderUtils.hideLoading();
    notifyListeners();
  }

  bool _isRepositoryResponseSuccess(
    BuildContext context,
    dynamic repositoryResponse,
  ) {
    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);
      _paginationProvider.setErrorMessage(repositoryResponse.errorMessage!);
      return false;
    }
    if (repositoryResponse.data['documents'].isEmpty) {
      ProviderUtils.showNoResultsAlert(context);
      return false;
    }
    return true;
  }
}
