import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_template_model.dart';
import 'package:siansa_app/state/providers/report_template_provider/subproviders/report_template_crud_provider.dart';
import 'package:siansa_app/state/providers/report_template_provider/subproviders/report_template_pagination_provider.dart';

class ReportTemplateProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final ReportTemplateCRUDProvider _crudProvider;
  late final ReportTemplatePaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = ReportTemplateCRUDProvider(this);
    _paginationProvider = ReportTemplatePaginationProvider(this);
  }

  // sub providers access

  ReportTemplateCRUDProvider get crud => _crudProvider;
  ReportTemplatePaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  ReportTemplateModel? _reportTemplate; // Private user model

  // Getters
  // --------------------------------------------------

  ReportTemplateModel? get reportTemplate => _reportTemplate;

  // Setters
  // --------------------------------------------------

  void setReportTemplate(ReportTemplateModel? reportTemplate) {
    _reportTemplate = reportTemplate;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearReportTemplate() {
    setReportTemplate(null);
  }

  void setReportTemplateFields(Map<String, dynamic> fields) {
    if (_reportTemplate != null) {
      fields.forEach((field, value) {
        if (_reportTemplate!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _reportTemplate!.toJson()[field] = value;
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

  ReportTemplateProvider() {
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
