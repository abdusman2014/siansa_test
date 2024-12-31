import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_subcategory_model.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/subproviders/report_subcategory_crud_provider.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/subproviders/report_subcategory_pagination_provider.dart';

class ReportSubcategoryProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final ReportSubcategoryCRUDProvider _crudProvider;
  late final ReportSubcategoryPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = ReportSubcategoryCRUDProvider(this);
    _paginationProvider = ReportSubcategoryPaginationProvider(this);
  }

  // sub providers access

  ReportSubcategoryCRUDProvider get crud => _crudProvider;
  ReportSubcategoryPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  ReportSubcategoryModel? _reportSubcategory; // Private user model

  // Getters
  // --------------------------------------------------

  ReportSubcategoryModel? get reportSubcategory => _reportSubcategory;

  // Setters
  // --------------------------------------------------

  void setReportSubcategory(ReportSubcategoryModel? reportSubcategory) {
    _reportSubcategory = reportSubcategory;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearReportSubcategory() {
    setReportSubcategory(null);
  }

  void setReportSubcategoryFields(Map<String, dynamic> fields) {
    if (_reportSubcategory != null) {
      fields.forEach((field, value) {
        if (_reportSubcategory!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _reportSubcategory!.toJson()[field] = value;
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

  ReportSubcategoryProvider() {
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
