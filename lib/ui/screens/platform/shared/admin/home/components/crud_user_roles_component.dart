import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/user_permission_model.dart';
import 'package:siansa_app/models/app/user_role_model.dart';
import 'package:siansa_app/state/providers/user_permission_provider/user_permission_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/user_role_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_user_roles_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_user_roles_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_user_roles_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/utilities/conversions/list/list_conversions.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = UserRoleModel;
const String dataset = DatasetsConstants.USER_ROLES_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDUserRolesComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDUserRolesComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDUserRolesComponentState createState() => _CRUDUserRolesComponentState();
}

class _CRUDUserRolesComponentState extends State<CRUDUserRolesComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _userPermissionOptions = [];

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
    final userRoleProvider =
        Provider.of<UserRoleProvider>(context, listen: false);
    final userPermissionProvider =
        Provider.of<UserPermissionProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await userRoleProvider.pagination.getFirstPage(context: context);

    // Get all the user permissions
    dynamic allUserPermissions = await userPermissionProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );

    // Convert user permission models to option map with keys 'text' and 'value'
    final allUserPermissionsFieldMapping = {
      'text': (UserPermissionModel p) => p.name,
      'value': (UserPermissionModel p) => p.id,
    };
    final userPermissionOptions = ListConversionsUtilities
        .convertTypedListToMappedList<UserPermissionModel>(
      allUserPermissions,
      allUserPermissionsFieldMapping,
    );

    setState(() {
      _data = rowsDataFormat(userRoleProvider.pagination.paginationData);
      _userPermissionOptions = userPermissionOptions;
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
    // Get the UserRoleProvider to access pagination data and methods
    final userRoleProvider = Provider.of<UserRoleProvider>(context);
    // final userRoleData = userRoleProvider.userRole!.toMap();

    final String _dataTitle = AppLocalizations.of(context)!.userRolesTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'id': 'ID',
      'name': AppLocalizations.of(context)!.nameTXT,
      'isSystem': 'Is System',
    };

    Future<void> _reloadFirstPage() async {
      await userRoleProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(userRoleProvider.pagination.paginationData);
      });
    }

    // Define previous and next page functions using the userRoleProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await userRoleProvider.pagination.getPreviousPage(context: context);
      setState(() {
        _data = rowsDataFormat(userRoleProvider.pagination.paginationData);
      });
    }

    Future<void> _getNextPage() async {
      await userRoleProvider.pagination.getNextPage(context: context);
      setState(() {
        _data = rowsDataFormat(userRoleProvider.pagination.paginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await userRoleProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(userRoleProvider.pagination.paginationData);
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

        await userRoleProvider.crud.deleteOneById(context, id);

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

      createFormWidget: () => FormUserRolesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        userPermissionOptions: _userPermissionOptions,
        onSubmit: (data) async {
          print('FormUserRolesSave data');
          print(data);

          // Save data on database
          await userRoleProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormUserRolesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        userPermissionOptions: _userPermissionOptions,
        onSubmit: (data) {
          print('FormUserRolesSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormUserRolesSearchFilter(
        onSubmit: (data) {
          print('FormUserRolesSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormUserRolesOrderBy(
        onSubmit: (value) {
          print('FormUserRolesOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormUserRolesSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        userPermissionOptions: _userPermissionOptions,
        onSubmit: (data) async {
          print('FormUserRolesSave data');
          print(data);

          // Save data on database
          await userRoleProvider.crud.updateOneById(context, data['id'], data);

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
