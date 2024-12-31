import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_category_model.dart';
import 'package:siansa_app/state/providers/report_category_provider/subproviders/report_category_crud_provider.dart';
import 'package:siansa_app/state/providers/report_category_provider/subproviders/report_category_pagination_provider.dart';

class ReportCategoryProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final ReportCategoryCRUDProvider _crudProvider;
  late final ReportCategoryPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = ReportCategoryCRUDProvider(this);
    _paginationProvider = ReportCategoryPaginationProvider(this);
  }

  // sub providers access

  ReportCategoryCRUDProvider get crud => _crudProvider;
  ReportCategoryPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  ReportCategoryModel? _reportCategory; // Private user model

  // Getters
  // --------------------------------------------------

  ReportCategoryModel? get reportCategory => _reportCategory;

  // Setters
  // --------------------------------------------------

  void setReportCategory(ReportCategoryModel? reportCategory) {
    _reportCategory = reportCategory;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearReportCategory() {
    setReportCategory(null);
  }

  void setReportCategoryFields(Map<String, dynamic> fields) {
    if (_reportCategory != null) {
      fields.forEach((field, value) {
        if (_reportCategory!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _reportCategory!.toJson()[field] = value;
        } else {
          // print('Error: Field $field does not exist in user role object.');
        }
      });

      notifyListeners(); // Notify listeners after the fields update
    } else {
      // print('Error: No user role object found to update.');
    }
  }

  // **************************************************
  // Constructor (If needed / Loads initial data)
  // **************************************************

  ReportCategoryProvider() {
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
