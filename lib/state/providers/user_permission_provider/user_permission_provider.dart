import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/user_permission_model.dart';
import 'package:siansa_app/state/providers/user_permission_provider/subproviders/user_permission_crud_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/subproviders/user_permission_pagination_provider.dart';

class UserPermissionProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final UserPermissionCRUDProvider _crudProvider;
  late final UserPermissionPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = UserPermissionCRUDProvider(this);
    _paginationProvider = UserPermissionPaginationProvider(this);
  }

  // sub providers access

  UserPermissionCRUDProvider get crud => _crudProvider;
  UserPermissionPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  UserPermissionModel? _userPermission; // Private user model

  // Getters
  // --------------------------------------------------

  UserPermissionModel? get userPermission => _userPermission;

  // Setters
  // --------------------------------------------------

  void setUserPermission(UserPermissionModel? userPermission) {
    _userPermission = userPermission;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearUserPermission() {
    setUserPermission(null);
  }

  void setUserPermissionFields(Map<String, dynamic> fields) {
    if (_userPermission != null) {
      fields.forEach((field, value) {
        if (_userPermission!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _userPermission!.toJson()[field] = value;
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

  UserPermissionProvider() {
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
