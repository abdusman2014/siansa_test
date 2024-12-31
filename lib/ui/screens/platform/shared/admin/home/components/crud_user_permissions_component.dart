import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/user_permission_model.dart';
import 'package:siansa_app/state/providers/user_permission_provider/user_permission_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_user_permissions_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_user_permissions_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_user_permissions_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = UserPermissionModel;
const String dataset = DatasetsConstants.USER_PERMISSIONS_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDUserPermissionsComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDUserPermissionsComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDUserPermissionsComponentState createState() =>
      _CRUDUserPermissionsComponentState();
}

class _CRUDUserPermissionsComponentState
    extends State<CRUDUserPermissionsComponent> {
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
    final userPermissionProvider =
        Provider.of<UserPermissionProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await userPermissionProvider.pagination.getFirstPage(context: context);

    setState(() {
      _data = rowsDataFormat(userPermissionProvider.pagination.paginationData);
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
    // Get the UserPermissionProvider to access pagination data and methods
    final userPermissionProvider = Provider.of<UserPermissionProvider>(context);
    // final userPermissionData = userPermissionProvider.userPermission!.toMap();

    final String _dataTitle = AppLocalizations.of(context)!.userPermissionsTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    // Fetch user role options or use hard-coded account statuses
    final userPermissionOptions = [
      {'text': 'Users Create', 'value': 'users_create'},
      {'text': 'Users Read', 'value': 'users_read'},
      {'text': 'Users Update', 'value': 'users_update'},
      {'text': 'Users Delete', 'value': 'users_delete'},
    ];

    // Fetch account status options or use hard-coded account statuses
    final accountStatusOptions = [
      {'text': 'Active', 'value': 'active'},
      {'text': 'Inactive', 'value': 'inactive'},
      {'text': 'Pending', 'value': 'pending'},
    ];

    Future<void> _reloadFirstPage() async {
      await userPermissionProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(userPermissionProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the userPermissionProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await userPermissionProvider.pagination.getPreviousPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(userPermissionProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await userPermissionProvider.pagination.getNextPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(userPermissionProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await userPermissionProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data =
            rowsDataFormat(userPermissionProvider.pagination.paginationData);
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

        await userPermissionProvider.crud.deleteOneById(context, id);

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

      createFormWidget: () => FormUserPermissionsSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        onSubmit: (data) async {
          print('FormUserPermissionsSave data');
          print(data);

          // Save data on database
          await userPermissionProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormUserPermissionsSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        onSubmit: (data) {
          print('FormUserPermissionsSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormUserPermissionsSearchFilter(
        onSubmit: (data) {
          print('FormUserPermissionsSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormUserPermissionsOrderBy(
        onSubmit: (value) {
          print('FormUserPermissionsOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormUserPermissionsSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        onSubmit: (data) async {
          print('FormUserPermissionsSave data');
          print(data);

          // Save data on database
          await userPermissionProvider.crud
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
