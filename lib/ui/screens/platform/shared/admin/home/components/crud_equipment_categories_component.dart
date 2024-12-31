import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/equipment_category_model.dart';
import 'package:siansa_app/models/app/equipment_subcategory_model.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/equipment_category_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/equipment_subcategory_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_categories_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_categories_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_categories_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/utilities/conversions/list/list_conversions.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = EquipmentCategoryModel;
const String dataset = DatasetsConstants.EQUIPMENT_CATEGORIES_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDEquipmentCategoriesComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDEquipmentCategoriesComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDEquipmentCategoriesComponentState createState() =>
      _CRUDEquipmentCategoriesComponentState();
}

class _CRUDEquipmentCategoriesComponentState
    extends State<CRUDEquipmentCategoriesComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _equipmentSubcategoryOptions = [];

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
    final equipmentCategoryProvider =
        Provider.of<EquipmentCategoryProvider>(context, listen: false);
    final equipmentSubcategoryProvider =
        Provider.of<EquipmentSubcategoryProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await equipmentCategoryProvider.pagination.getFirstPage(context: context);

    // Get all the equipment subcategories
    dynamic allEquipmentSubcategories =
        await equipmentSubcategoryProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );

    // Convert equipment subcategory models to option map with keys 'text' and 'value'
    final allEquipmentSubcategoriesFieldMapping = {
      'text': (EquipmentSubcategoryModel p) => p.name,
      'value': (EquipmentSubcategoryModel p) => p.id,
    };
    final equipmentSubcategoryOptions = ListConversionsUtilities
        .convertTypedListToMappedList<EquipmentSubcategoryModel>(
      allEquipmentSubcategories,
      allEquipmentSubcategoriesFieldMapping,
    );

    setState(() {
      _data =
          rowsDataFormat(equipmentCategoryProvider.pagination.paginationData);
      _equipmentSubcategoryOptions = equipmentSubcategoryOptions;
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
    // Get the EquipmentCategoryProvider to access pagination data and methods
    final equipmentCategoryProvider =
        Provider.of<EquipmentCategoryProvider>(context);
    // final equipmentCategoryData = equipmentCategoryProvider.equipmentCategory!.toMap();

    final String _dataTitle =
        AppLocalizations.of(context)!.equipmentCategoriesTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    Future<void> _reloadFirstPage() async {
      await equipmentCategoryProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(equipmentCategoryProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the equipmentCategoryProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await equipmentCategoryProvider.pagination
          .getPreviousPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(equipmentCategoryProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await equipmentCategoryProvider.pagination.getNextPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(equipmentCategoryProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await equipmentCategoryProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(equipmentCategoryProvider.pagination.paginationData);
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

        await equipmentCategoryProvider.crud.deleteOneById(context, id);

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

      createFormWidget: () => FormEquipmentCategoriesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        equipmentSubcategoryOptions: _equipmentSubcategoryOptions,
        onSubmit: (data) async {
          print('FormEquipmentCategoriesSave data');
          print(data);

          // Save data on database
          await equipmentCategoryProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormEquipmentCategoriesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        equipmentSubcategoryOptions: _equipmentSubcategoryOptions,
        onSubmit: (data) {
          print('FormEquipmentCategoriesSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormEquipmentCategoriesSearchFilter(
        onSubmit: (data) {
          print('FormEquipmentCategoriesSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormEquipmentCategoriesOrderBy(
        onSubmit: (value) {
          print('FormEquipmentCategoriesOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormEquipmentCategoriesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        equipmentSubcategoryOptions: _equipmentSubcategoryOptions,
        onSubmit: (data) async {
          print('FormEquipmentCategoriesSave data');
          print(data);

          // Save data on database
          await equipmentCategoryProvider.crud
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
