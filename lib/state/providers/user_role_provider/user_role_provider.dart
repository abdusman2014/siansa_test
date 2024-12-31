import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/user_role_model.dart';
import 'package:siansa_app/state/providers/user_role_provider/subproviders/user_role_crud_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/subproviders/user_role_pagination_provider.dart';

class UserRoleProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final UserRoleCRUDProvider _crudProvider;
  late final UserRolePaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = UserRoleCRUDProvider(this);
    _paginationProvider = UserRolePaginationProvider(this);
  }

  // sub providers access

  UserRoleCRUDProvider get crud => _crudProvider;
  UserRolePaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  UserRoleModel? _userRole; // Private user model

  // Getters
  // --------------------------------------------------

  UserRoleModel? get userRole => _userRole;

  // Setters
  // --------------------------------------------------

  void setUserRole(UserRoleModel? userRole) {
    _userRole = userRole;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearUserRole() {
    setUserRole(null);
  }

  void setUserRoleFields(Map<String, dynamic> fields) {
    if (_userRole != null) {
      fields.forEach((field, value) {
        if (_userRole!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _userRole!.toJson()[field] = value;
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

  UserRoleProvider() {
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
