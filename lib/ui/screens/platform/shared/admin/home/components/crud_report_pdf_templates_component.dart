import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/report_pdf_template_model.dart';
import 'package:siansa_app/state/providers/report_pdf_template_provider/report_pdf_template_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_report_pdf_templates_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_report_pdf_templates_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_report_pdf_templates_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = ReportPDFTemplateModel;
const String dataset = DatasetsConstants.REPORT_PDF_TEMPLATES_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDReportPDFTemplatesComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDReportPDFTemplatesComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDReportPDFTemplatesComponentState createState() =>
      _CRUDReportPDFTemplatesComponentState();
}

class _CRUDReportPDFTemplatesComponentState
    extends State<CRUDReportPDFTemplatesComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];

  final List<String> _visibleColumns = [
    'name',
    'isSystem',
  ];

  bool _isPreviewEnabled = true;
  bool _isEditEnabled = true;
  bool _isDeleteEnabled = true;
  bool _isShareEnabled = true;
  bool _isDownloadEnabled = true;
  bool _isDownloadPDFEnabled = true;
  bool _isDownloadCSVEnabled = true;

  @override
  void initState() {
    super.initState();

    // Load initial data asynchronously
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setInitialData();
    });
  }

  Future<void> _setInitialData() async {
    final reportPDFTemplateProvider =
        Provider.of<ReportPDFTemplateProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await reportPDFTemplateProvider.pagination.getFirstPage(context: context);

    setState(() {
      _data =
          rowsDataFormat(reportPDFTemplateProvider.pagination.paginationData);
    });
  }

  List<Map<String, dynamic>> rowsDataFormat(
    List<ModelType> paginationData,
  ) {
    List<Map<String, dynamic>> paginationDataToMapsList =
        paginationData.map((item) {
      return item.toMap();
    }).toList();
    return paginationDataToMapsList;
  }

  @override
  Widget build(BuildContext context) {
    // Get the ReportPDFTemplateProvider to access pagination data and methods
    final reportPDFTemplateProvider =
        Provider.of<ReportPDFTemplateProvider>(context);
    // final reportPDFTemplateData = reportPDFTemplateProvider.reportPDFTemplate!.toMap();

    final String _dataTitle =
        AppLocalizations.of(context)!.reportPDFTemplatesTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    Future<void> _reloadFirstPage() async {
      await reportPDFTemplateProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportPDFTemplateProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the reportPDFTemplateProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await reportPDFTemplateProvider.pagination
          .getPreviousPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportPDFTemplateProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await reportPDFTemplateProvider.pagination.getNextPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportPDFTemplateProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await reportPDFTemplateProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportPDFTemplateProvider.pagination.paginationData);
      });
    }

    return CrudComponent(
      // ------------------------------
      // DATA
      // ------------------------------

      title: _dataTitle,
      data: _data,
      columnsDisplayText: _columnsDisplayText,
      visibleColumns: _visibleColumns,

      // ------------------------------
      // CALLBACKS
      // ------------------------------

      onSearch: _getSearchResults,
      onNextPage: _getNextPage,
      onPreviousPage: _getPreviousPage,

      onDelete: (String id) async {
        print('CRUD $_dataTitle, delete id: $id');

        await reportPDFTemplateProvider.crud.deleteOneById(context, id);

        await _reloadFirstPage();
      },
      onShare: (Map<String, dynamic> data) {
        print('CRUD $_dataTitle, share id: ${data['id'] ?? '_'}');
      },
      onDownload: (Map<String, dynamic> data) {
        print('CRUD $_dataTitle, download id: ${data['id'] ?? '_'}');
      },
      onDownloadPDF: (Map<String, dynamic> data) {
        print('CRUD $_dataTitle, download PDF id: ${data['id'] ?? '_'}');
      },
      onDownloadCSV: (Map<String, dynamic> data) {
        print('CRUD $_dataTitle, download CSV id: ${data['id'] ?? '_'}');
      },

      // ------------------------------
      // FLAGS
      // ------------------------------

      isPreviewEnabled: _isPreviewEnabled,
      isEditEnabled: _isEditEnabled,
      isDeleteEnabled: _isDeleteEnabled,
      isShareEnabled: _isShareEnabled,
      isDownloadEnabled: _isDownloadEnabled,
      isDownloadPDFEnabled: _isDownloadPDFEnabled,
      isDownloadCSVEnabled: _isDownloadCSVEnabled,

      // ------------------------------
      // WIDGETS
      // ------------------------------

      createFormWidget: () => FormReportPDFTemplatesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        onSubmit: (data) async {
          print('FormReportPDFTemplatesSave data');
          print(data);

          // Save data on database
          await reportPDFTemplateProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormReportPDFTemplatesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        onSubmit: (data) {
          print('FormReportPDFTemplatesSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormReportPDFTemplatesSearchFilter(
        onSubmit: (data) {
          print('FormReportPDFTemplatesSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormReportPDFTemplatesOrderBy(
        onSubmit: (value) {
          print('FormReportPDFTemplatesOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormReportPDFTemplatesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        onSubmit: (data) async {
          print('FormReportPDFTemplatesSave data');
          print(data);

          // Save data on database
          await reportPDFTemplateProvider.crud
              .updateOneById(context, data['id'], data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
        themeColor: Colors.lightBlue,
      ),

      // ------------------------------
      // TEXT STRINGS
      // ------------------------------

      alertCreateTitle: 'Create $_dataTitle',
      alertReadTitle: 'Read $_dataTitle',
      alertFilterTitle: 'Filter $_dataTitle',
      alertOrderByTitle: 'Order $_dataTitle By',
      alertUpdateTitle: 'Update $_dataTitle',
      alertDeleteTitle: 'Delete $_dataTitle',
      alertDeleteMessage: 'Are you sure you want to delete this $_dataTitle?',

      // ------------------------------
      // TEXT WIDGETS
      // ------------------------------

      // alertCreateTitleTextWidget: const Text(
      //   'alertCreateTitleTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      // alertReadTitleTextWidget: const Text(
      //   'alertReadTitleTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      // alertFilterTitleTextWidget: const Text(
      //   'alertFilterTitleTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      // alertOrderByTitleTextWidget: const Text(
      //   'alertOrderByTitleTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      // alertUpdateTitleTextWidget: const Text(
      //   'alertUpdateTitleTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      // alertDeleteTitleTextWidget: const Text(
      //   'alertDeleteTitleTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      // alertDeleteMessageTextWidget: const Text(
      //   'alertDeleteMessageTextWidget',
      //   style: TextStyle(color: Colors.red),
      // ),
      //
    );
  }
}
