import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/report_category_model.dart';
import 'package:siansa_app/models/app/report_subcategory_model.dart';
import 'package:siansa_app/models/app/report_template_model.dart';
import 'package:siansa_app/state/providers/report_category_provider/report_category_provider.dart';
import 'package:siansa_app/state/providers/report_subcategory_provider/report_subcategory_provider.dart';
import 'package:siansa_app/state/providers/report_template_provider/report_template_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_report_templates_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_report_templates_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_report_templates_search_filter.dart';
import 'package:siansa_app/utilities/conversions/list/list_conversions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = ReportTemplateModel;
const String dataset = DatasetsConstants.REPORT_TEMPLATES_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDReportTemplatesComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDReportTemplatesComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDReportTemplatesComponentState createState() =>
      _CRUDReportTemplatesComponentState();
}

class _CRUDReportTemplatesComponentState
    extends State<CRUDReportTemplatesComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _reportCategoryOptions = [];
  List<Map<String, dynamic>> _reportSubcategoryOptions = [];

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
    final reportTemplateProvider =
        Provider.of<ReportTemplateProvider>(context, listen: false);
    final reportCategoryProvider =
        Provider.of<ReportCategoryProvider>(context, listen: false);
    final reportSubcategoryProvider =
        Provider.of<ReportSubcategoryProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await reportTemplateProvider.pagination.getFirstPage(context: context);

    // Get all the report categories
    dynamic allReportCategories = await reportCategoryProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );
    // Get all the report subcategories
    dynamic allReportSubcategories =
        await reportSubcategoryProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );

    // Convert report category models to option map with keys 'text' and 'value'
    final allReportCategoriesFieldMapping = {
      'text': (ReportCategoryModel p) => p.name,
      'value': (ReportCategoryModel p) => p.id,
    };
    // Convert report subcategory models to option map with keys 'text' and 'value'
    final allReportSubcategoriesFieldMapping = {
      'text': (ReportSubcategoryModel p) => p.name,
      'value': (ReportSubcategoryModel p) => p.id,
    };

    final reportCategoryOptions = ListConversionsUtilities
        .convertTypedListToMappedList<ReportCategoryModel>(
      allReportCategories,
      allReportCategoriesFieldMapping,
    );
    final reportSubcategoryOptions = ListConversionsUtilities
        .convertTypedListToMappedList<ReportSubcategoryModel>(
      allReportSubcategories,
      allReportSubcategoriesFieldMapping,
    );

    setState(() {
      _data = rowsDataFormat(reportTemplateProvider.pagination.paginationData);
      _reportCategoryOptions = reportCategoryOptions;
      _reportSubcategoryOptions = reportSubcategoryOptions;
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
    // Get the ReportTemplateProvider to access pagination data and methods
    final reportTemplateProvider = Provider.of<ReportTemplateProvider>(context);
    // final reportTemplateData = reportTemplateProvider.reportTemplate!.toMap();

    final String _dataTitle = AppLocalizations.of(context)!.reportTemplatesTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    Future<void> _reloadFirstPage() async {
      await reportTemplateProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportTemplateProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the reportTemplateProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await reportTemplateProvider.pagination.getPreviousPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportTemplateProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await reportTemplateProvider.pagination.getNextPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportTemplateProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await reportTemplateProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(reportTemplateProvider.pagination.paginationData);
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

        await reportTemplateProvider.crud.deleteOneById(context, id);

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

      createFormWidget: () => FormReportTemplatesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        reportCategoryOptions: _reportCategoryOptions,
        reportSubcategoryOptions: _reportSubcategoryOptions,
        onSubmit: (data) async {
          print('FormReportTemplatesSave data');
          print(data);

          // Save data on database
          await reportTemplateProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormReportTemplatesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        reportCategoryOptions: _reportCategoryOptions,
        reportSubcategoryOptions: _reportSubcategoryOptions,
        onSubmit: (data) {
          print('FormReportTemplatesSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormReportTemplatesSearchFilter(
        onSubmit: (data) {
          print('FormReportTemplatesSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormReportTemplatesOrderBy(
        onSubmit: (value) {
          print('FormReportTemplatesOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormReportTemplatesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        reportCategoryOptions: _reportCategoryOptions,
        reportSubcategoryOptions: _reportSubcategoryOptions,
        onSubmit: (data) async {
          print('FormReportTemplatesSave data');
          print(data);

          // Save data on database
          await reportTemplateProvider.crud
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
