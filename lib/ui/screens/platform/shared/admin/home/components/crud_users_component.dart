import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/models/app/user_model.dart';
import 'package:siansa_app/models/app/user_role_model.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/user_role_provider.dart';
import 'package:siansa_app/ui/components/crud_component/crud_component.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_users_save.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_users_order_by.dart';
import 'package:siansa_app/ui/screens/platform/shared/admin/home/widgets/form_users_search_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:siansa_app/utilities/conversions/list/list_conversions.dart';

// - - - - - - - - - - - - - - - - - - - - - - - - - - -
typedef ModelType = UserModel;
const String dataset = DatasetsConstants.USERS_DATASET;
// - - - - - - - - - - - - - - - - - - - - - - - - - - -

class CRUDUsersComponent extends StatefulWidget {
  final String? authUserRoleId;

  const CRUDUsersComponent({
    Key? key,
    required this.authUserRoleId,
  }) : super(key: key);

  @override
  _CRUDUsersComponentState createState() => _CRUDUsersComponentState();
}

class _CRUDUsersComponentState extends State<CRUDUsersComponent> {
  final String _dataset = dataset;

  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _userRoleOptions = [];
  List<Map<String, dynamic>> _accountStatusOptions = [
    {
      'text': 'Active',
      'value': 'active',
    },
    {
      'text': 'Inactive',
      'value': 'inactive',
    },
    {
      'text': 'Pending',
      'value': 'pending',
    },
  ];

  final List<String> _visibleColumns = [
    'name',
    'lastName',
    'email',
    'userRoleId',
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
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userRoleProvider =
        Provider.of<UserRoleProvider>(context, listen: false);

    // Call the pagination function to fetch the first page
    await userProvider.pagination.getFirstPage(context: context);

    // Get all the user roles
    dynamic allUserRoles = await userRoleProvider.crud.readAll(
      context: context,
      orderBy: 'name',
    );

    // Conver user permission models to option map with keys 'text' and 'value'
    final allUserRolesFieldMapping = {
      'text': (UserRoleModel p) => p.name,
      'value': (UserRoleModel p) => p.id,
    };
    final userRoleOptions =
        ListConversionsUtilities.convertTypedListToMappedList<UserRoleModel>(
      allUserRoles,
      allUserRolesFieldMapping,
    );

    setState(() {
      // _data = DemoData.users;
      _data = rowsDataFormat(userProvider.pagination.getPaginationData);
      _userRoleOptions = userRoleOptions;
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
    // Get the UserProvider to access pagination data and methods
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.getAuthUser!.toMap();

    final String _dataTitle = AppLocalizations.of(context)!.usersTXT;

    final Map<String, dynamic> _columnsDisplayText = {
      'isSystem': 'Is System',
      'id': 'ID',
      'email': AppLocalizations.of(context)!.emailTXT,
      'username': AppLocalizations.of(context)!.usernameTXT,
      'phoneNumber': AppLocalizations.of(context)!.phoneNumberTXT,
      'name': AppLocalizations.of(context)!.nameTXT,
      'lastName': AppLocalizations.of(context)!.lastNameTXT,
      'fullName': 'Full Name',
      'displayName': 'Display Name',
      'dateOfBirth': 'Date of Birth',
      'userRoleId': AppLocalizations.of(context)!.userRoleTXT,
      'userRoleIds': 'User Role IDs',
      'photoUrl': 'Photo URL',
      'accountStatus': 'Account Status',
      'isAccountVerified': 'Account Verified?',
      'isEmailVerified': 'Email Verified?',
      'isPhoneVerified': 'Phone Verified?',
      'isTwoFactorEnabled': 'Two Factor Enabled?',
      'deviceTokenU': 'Device Token U',
      'languageCode': 'Language Code',
      'lastLogin': 'Last Login',
      'createdAt': 'Created At',
      'modifiedAt': 'Modified At',
    };

    Future<void> _reloadFirstPage() async {
      await userProvider.pagination.getFirstPage(context: context);
      setState(() {
        _data = rowsDataFormat(userProvider.pagination.getPaginationData);
      });
    }

    // Define previous and next page functions using the userProvider's pagination methods
    Future<void> _getPreviousPage() async {
      await userProvider.pagination.getPreviousPage(context: context);
      setState(() {
        _data = rowsDataFormat(userProvider.pagination.getPaginationData);
      });
    }

    Future<void> _getNextPage() async {
      await userProvider.pagination.getNextPage(context: context);
      setState(() {
        _data = rowsDataFormat(userProvider.pagination.getPaginationData);
      });
    }

    Future<void> _getSearchResults(searchString) async {
      await userProvider.pagination.getFirstPage(
        context: context,
        // equalityFilters: {
        //   // 'id': searchString,
        //   // 'username': searchString,
        //   // 'email': searchString,
        //   // 'phoneNumber': searchString,
        //   // //
        //   // 'name': searchString,
        //   // 'lastName': searchString,
        //   // 'fullName': searchString,
        //   //
        //   'userRoleId': searchString,
        //   // 'userRoleIds': searchString,
        //   // 'accountStatus': searchString,
        //   // //
        //   // 'createdAt': searchString,
        //   // 'modifiedAt': searchString,
        //   // 'dateOfBirth': searchString,
        //   // 'lastLogin': searchString,
        //   // //
        //   // 'photoUrl': searchString,
        //   // 'displayName': searchString,
        //   // 'deviceTokenU': searchString,
        //   // 'languageCode': searchString,
        //   // //
        //   // 'isAccountVerified': searchString,
        //   // 'isEmailVerified': searchString,
        //   // 'isPhoneVerified': searchString,
        //   // 'isSystem': searchString,
        //   // 'isTwoFactorEnabled': searchString,
        // },
        // searchTerm: searchString,
        // searchFields: [
        //   // 'id',
        //   // 'username',
        //   // 'email',
        //   // 'phoneNumber',
        //   //
        //   // 'name',
        //   // 'lastName',
        //   // 'fullName',
        //   // //
        //   'userRoleId',
        //   // 'userRoleIds',
        //   // 'accountStatus',
        //   // //
        //   // 'createdAt',
        //   // 'modifiedAt',
        //   // 'dateOfBirth',
        //   // 'lastLogin',
        //   // //
        //   // 'photoUrl',
        //   // 'displayName',
        //   // 'deviceTokenU',
        //   // 'languageCode',
        //   // //
        //   // 'isAccountVerified',
        //   // 'isEmailVerified',
        //   // 'isPhoneVerified',
        //   // 'isSystem',
        //   // 'isTwoFactorEnabled',
        // ],
      );
      setState(() {
        _data = rowsDataFormat(userProvider.pagination.getPaginationData);
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

      onDelete: (String id) {
        print('CRUD $_dataTitle, delete id: $id');
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

      createFormWidget: () => FormUsersSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: const {},
        userRoleOptions: _userRoleOptions,
        accountStatusOptions: _accountStatusOptions,
        onSubmit: (data) async {
          print('FormUsersSave data');
          print(data);

          // Save data on database
          await userProvider.crud.createOne(context, data);

          await _reloadFirstPage();

          // After successfully data save, close the dialog
          Navigator.of(context).pop(); // Close dialog
        },
      ),
      readContentWidget: (data) => FormUsersSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        userRoleOptions: _userRoleOptions,
        accountStatusOptions: _accountStatusOptions,
        onSubmit: (data) {
          print('FormUsersSave data');
          print(data);

          // After successfully data save, close the dialog
          // Navigator.of(context).pop(); // Close dialog
        },
        areInputsDisabled: true,
        shouldHideSubmitButton: true,
        themeColor: Colors.blue.shade700,
      ),
      filterFormWidget: FormUsersSearchFilter(
        onSubmit: (data) {
          print('FormUsersSearchFilter data');
          print(data);
          Navigator.of(context).pop();
        },
      ),
      orderByFormWidget: FormUsersOrderBy(
        onSubmit: (value) {
          print('FormUsersOrderBy value');
          print(value);
          Navigator.of(context).pop();
        },
      ),
      updateFormWidget: (data) => FormUsersSave(
        authUserRoleId: widget.authUserRoleId,
        initialValues: data,
        userRoleOptions: _userRoleOptions,
        accountStatusOptions: _accountStatusOptions,
        onSubmit: (data) async {
          print('FormUsersSave data');
          print(data);

          // Save data on database
          await userProvider.crud.updateOneById(context, data['id'], data);

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
