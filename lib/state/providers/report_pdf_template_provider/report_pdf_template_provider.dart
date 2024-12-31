import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/report_pdf_template_model.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/subproviders/report_pdf_template_crud_provider.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/subproviders/report_pdf_template_pagination_provider.dart';

class ReportPDFTemplateProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final ReportPDFTemplateCRUDProvider _crudProvider;
  late final ReportPDFTemplatePaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = ReportPDFTemplateCRUDProvider(this);
    _paginationProvider = ReportPDFTemplatePaginationProvider(this);
  }

  // sub providers access

  ReportPDFTemplateCRUDProvider get crud => _crudProvider;
  ReportPDFTemplatePaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  ReportPDFTemplateModel? _reportPDFTemplate; // Private user model

  // Getters
  // --------------------------------------------------

  ReportPDFTemplateModel? get reportPDFTemplate => _reportPDFTemplate;

  // Setters
  // --------------------------------------------------

  void setReportPDFTemplate(ReportPDFTemplateModel? reportPDFTemplate) {
    _reportPDFTemplate = reportPDFTemplate;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearReportPDFTemplate() {
    setReportPDFTemplate(null);
  }

  void setReportPDFTemplateFields(Map<String, dynamic> fields) {
    if (_reportPDFTemplate != null) {
      fields.forEach((field, value) {
        if (_reportPDFTemplate!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _reportPDFTemplate!.toJson()[field] = value;
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

  ReportPDFTemplateProvider() {
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
