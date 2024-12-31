import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/equipment_category_model.dart';
import 'package:siansa_app/models/app/equipment_subcategory_model.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/equipment_category_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/equipment_subcategory_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_subcategories_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_subcategories_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_subcategories_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/utilities/conversions/list/list_conversions.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = EquipmentSubcategoryModel;
const String dataset = DatasetsConstants.EQUIPMENT_SUBCATEGORIES_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDEquipmentSubcategoriesComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDEquipmentSubcategoriesComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDEquipmentSubcategoriesComponentState createState() =>
      _CRUDEquipmentSubcategoriesComponentState();
}

class _CRUDEquipmentSubcategoriesComponentState
    extends State<CRUDEquipmentSubcategoriesComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _equipmentCategoryOptions = [];

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
    final equipmentSubcategoryProvider =
        Provider.of<EquipmentSubcategoryProvider>(context, listen: false);
    final equipmentCategoryProvider =
        Provider.of<EquipmentCategoryProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await equipmentSubcategoryProvider.pagination
        .getFirstPage(context: context);

    // Get all the equipment categories
    dynamic allEquipmentCategories =
        await equipmentCategoryProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );

    // Convert equipment category models to option map with keys 'text' and 'value'
    final allEquipmentCategoriesFieldMapping = {
      'text': (EquipmentCategoryModel p) => p.name,
      'value': (EquipmentCategoryModel p) => p.id,
    };
    final equipmentCategoryOptions = ListConversionsUtilities
        .convertTypedListToMappedList<EquipmentCategoryModel>(
      allEquipmentCategories,
      allEquipmentCategoriesFieldMapping,
    );

    setState(() {
      _data = rowsDataFormat(
          equipmentSubcategoryProvider.pagination.paginationData);
      _equipmentCategoryOptions = equipmentCategoryOptions;
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
    // Get the EquipmentSubcategoryProvider to access pagination data and methods
    final equipmentSubcategoryProvider =
        Provider.of<EquipmentSubcategoryProvider>(context);
    // final equipmentSubcategoryData = equipmentSubcategoryProvider.equipmentSubcategory!.toMap();

    final String _dataTitle =
        AppLocalizations.of(context)!.equipmentSubcategoriesTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    Future<void> _reloadFirstPage() async {
      await equipmentSubcategoryProvider.pagination
          .getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(
            equipmentSubcategoryProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the equipmentSubcategoryProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await equipmentSubcategoryProvider.pagination
          .getPreviousPage(context: context);
      setState(() {
        _data = rowsDataFormat(
            equipmentSubcategoryProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await equipmentSubcategoryProvider.pagination
          .getNextPage(context: context);
      setState(() {
        _data = rowsDataFormat(
            equipmentSubcategoryProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await equipmentSubcategoryProvider.pagination
          .getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(
            equipmentSubcategoryProvider.pagination.paginationData);
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

        await equipmentSubcategoryProvider.crud.deleteOneById(context, id);

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

      createFormWidget: () => FormEquipmentSubcategoriesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        equipmentCategoryOptions: _equipmentCategoryOptions,
        onSubmit: (data) async {
          print('FormEquipmentSubcategoriesSave data');
          print(data);

          // Save data on database
          await equipmentSubcategoryProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormEquipmentSubcategoriesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        equipmentCategoryOptions: _equipmentCategoryOptions,
        onSubmit: (data) {
          print('FormEquipmentSubcategoriesSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormEquipmentSubcategoriesSearchFilter(
        onSubmit: (data) {
          print('FormEquipmentSubcategoriesSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormEquipmentSubcategoriesOrderBy(
        onSubmit: (value) {
          print('FormEquipmentSubcategoriesOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormEquipmentSubcategoriesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        equipmentCategoryOptions: _equipmentCategoryOptions,
        onSubmit: (data) async {
          print('FormEquipmentSubcategoriesSave data');
          print(data);

          // Save data on database
          await equipmentSubcategoryProvider.crud
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
