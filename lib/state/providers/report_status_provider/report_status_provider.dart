import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_status_model.dart';
import 'package:siansa_app/state/providers/report_status_provider/subproviders/report_status_crud_provider.dart';
import 'package:siansa_app/state/providers/report_status_provider/subproviders/report_status_pagination_provider.dart';

class ReportStatusProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final ReportStatusCRUDProvider _crudProvider;
  late final ReportStatusPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = ReportStatusCRUDProvider(this);
    _paginationProvider = ReportStatusPaginationProvider(this);
  }

  // sub providers access

  ReportStatusCRUDProvider get crud => _crudProvider;
  ReportStatusPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  ReportStatusModel? _reportStatus; // Private user model

  // Getters
  // --------------------------------------------------

  ReportStatusModel? get reportStatus => _reportStatus;

  // Setters
  // --------------------------------------------------

  void setReportStatus(ReportStatusModel? reportStatus) {
    _reportStatus = reportStatus;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearReportStatus() {
    setReportStatus(null);
  }

  void setReportStatusFields(Map<String, dynamic> fields) {
    if (_reportStatus != null) {
      fields.forEach((field, value) {
        if (_reportStatus!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _reportStatus!.toJson()[field] = value;
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

  ReportStatusProvider() {
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
