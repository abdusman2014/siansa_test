import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/equipment_category_model.dart';
import 'package:siansa_app/models/app/equipment_model.dart';
import 'package:siansa_app/models/app/equipment_subcategory_model.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/equipment_category_provider.dart';
import 'package:siansa_app/state/providers/equipment_provider/equipment_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/equipment_subcategory_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_equipment_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/utilities/conversions/list/list_conversions.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = EquipmentModel;
const String dataset = DatasetsConstants.EQUIPMENT_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDEquipmentComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDEquipmentComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDEquipmentComponentState createState() => _CRUDEquipmentComponentState();
}

class _CRUDEquipmentComponentState extends State<CRUDEquipmentComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _equipmentCategoryOptions = [];
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
    final equipmentProvider =
        Provider.of<EquipmentProvider>(context, listen: false);
    final equipmentCategoryProvider =
        Provider.of<EquipmentCategoryProvider>(context, listen: false);
    final equipmentSubcategoryProvider =
        Provider.of<EquipmentSubcategoryProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await equipmentProvider.pagination.getFirstPage(context: context);

    // Get all the equipment categories
    dynamic allEquipmentCategories =
        await equipmentCategoryProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );
    // Get all the equipment subcategories
    dynamic allEquipmentSubcategories =
        await equipmentSubcategoryProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );

    // Convert equipment category models to option map with keys 'text' and 'value'
    final allEquipmentCategoriesFieldMapping = {
      'text': (EquipmentCategoryModel p) => p.name,
      'value': (EquipmentCategoryModel p) => p.id,
    };
    // Convert equipment subcategory models to option map with keys 'text' and 'value'
    final allEquipmentSubcategoriesFieldMapping = {
      'text': (EquipmentSubcategoryModel p) => p.name,
      'value': (EquipmentSubcategoryModel p) => p.id,
    };

    final equipmentCategoryOptions = ListConversionsUtilities
        .convertTypedListToMappedList<EquipmentCategoryModel>(
      allEquipmentCategories,
      allEquipmentCategoriesFieldMapping,
    );
    final equipmentSubcategoryOptions = ListConversionsUtilities
        .convertTypedListToMappedList<EquipmentSubcategoryModel>(
      allEquipmentSubcategories,
      allEquipmentSubcategoriesFieldMapping,
    );

    setState(() {
      _data = rowsDataFormat(equipmentProvider.pagination.paginationData);
      _equipmentCategoryOptions = equipmentCategoryOptions;
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
    // Get the EquipmentProvider to access pagination data and methods
    final equipmentProvider = Provider.of<EquipmentProvider>(context);
    // final equipmentData = equipmentProvider.equipment!.toMap();

    final String _dataTitle = AppLocalizations.of(context)!.equipmentTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    Future<void> _reloadFirstPage() async {
      await equipmentProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(equipmentProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the equipmentProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await equipmentProvider.pagination.getPreviousPage(context: context);
      setState(() {
        _data = rowsDataFormat(equipmentProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await equipmentProvider.pagination.getNextPage(context: context);
      setState(() {
        _data = rowsDataFormat(equipmentProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await equipmentProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(equipmentProvider.pagination.paginationData);
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

        await equipmentProvider.crud.deleteOneById(context, id);

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

      createFormWidget: () => FormEquipmentSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        equipmentCategoryOptions: _equipmentCategoryOptions,
        equipmentSubcategoryOptions: _equipmentSubcategoryOptions,
        onSubmit: (data) async {
          print('FormEquipmentSave data');
          print(data);

          // Save data on database
          await equipmentProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormEquipmentSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        equipmentCategoryOptions: _equipmentCategoryOptions,
        equipmentSubcategoryOptions: _equipmentSubcategoryOptions,
        onSubmit: (data) {
          print('FormEquipmentSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormEquipmentSearchFilter(
        onSubmit: (data) {
          print('FormEquipmentSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormEquipmentOrderBy(
        onSubmit: (value) {
          print('FormEquipmentOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormEquipmentSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        equipmentCategoryOptions: _equipmentCategoryOptions,
        equipmentSubcategoryOptions: _equipmentSubcategoryOptions,
        onSubmit: (data) async {
          print('FormEquipmentSave data');
          print(data);

          // Save data on database
          await equipmentProvider.crud.updateOneById(context, data['id'], data);

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
