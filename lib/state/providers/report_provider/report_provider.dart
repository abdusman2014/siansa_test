import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_model.dart';
import 'package:siansa_app/state/providers/report_provider/subproviders/report_crud_provider.dart';
import 'package:siansa_app/state/providers/report_provider/subproviders/report_pagination_provider.dart';

class ReportProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final ReportCRUDProvider _crudProvider;
  late final ReportPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = ReportCRUDProvider(this);
    _paginationProvider = ReportPaginationProvider(this);
  }

  // sub providers access

  ReportCRUDProvider get crud => _crudProvider;
  ReportPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  ReportModel? _report; // Private user model

  // Getters
  // --------------------------------------------------

  ReportModel? get report => _report;

  // Setters
  // --------------------------------------------------

  void setReport(ReportModel? report) {
    _report = report;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearReport() {
    setReport(null);
  }

  void setReportFields(Map<String, dynamic> fields) {
    if (_report != null) {
      fields.forEach((field, value) {
        if (_report!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _report!.toJson()[field] = value;
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

  ReportProvider() {
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
