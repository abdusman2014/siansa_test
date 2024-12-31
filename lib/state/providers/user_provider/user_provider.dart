import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/models/app/user_model.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_crud_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_auth_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_profile_provider.dart';
import 'package:siansa_app/state/repositories/stream_repository.dart';

class UserProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final UserAuthProvider _authProvider;
  late final UserCRUDProvider _crudProvider;
  late final UserPaginationProvider _paginationProvider;
  late final UserProfileProvider _profileProvider;

  void _initializeSubProviders() {
    _authProvider = UserAuthProvider(this);
    _crudProvider = UserCRUDProvider(this);
    _paginationProvider = UserPaginationProvider(this);
    _profileProvider = UserProfileProvider(this);
  }

  // sub providers access

  UserAuthProvider get auth => _authProvider;
  UserCRUDProvider get crud => _crudProvider;
  UserPaginationProvider get pagination => _paginationProvider;
  UserProfileProvider get profile => _profileProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  UserModel? _authUser; // Private user model
  String? _authUserId;
  String? _authUserRoleId;
  String? _authUserPhoneNumber;

  // Getters
  // --------------------------------------------------

  UserModel? get getAuthUser => _authUser;

  String? get getAuthUserId => _authUser?.id;
  //     _authUserId ?? ';

  String? get getAuthUserRoleId => _authUser?.userRoleId;
  // _authUser?.userRoleId ?? UserRoleIdsConstants.GUEST_ROLE_ID;
  //     _authUserRoleId ?? UserRoleIdsConstants.GUEST_ROLE_ID;

  String? get getAuthUserPhoneNumber => _authUser?.phoneNumber;
  //      _authUser?.phoneNumber ?? '';
  //      _authUserPhoneNumber ?? '';

  // Setters
  // --------------------------------------------------

  void setAuthUser(UserModel? authUser) {
    _authUser = authUser;
    _authUserId = _authUser?.id;
    _authUserRoleId = _authUser?.userRoleId;
    // _authUser?.userRoleId ?? UserRoleIdsConstants.GUEST_ROLE_ID;
    _authUserPhoneNumber = _authUser?.phoneNumber;
    notifyListeners();
  }

  void setClearAuthUser() {
    setAuthUser(null);
    setAuthUserId(null);
    setAuthUserRoleId(null);
    setAuthUserPhoneNumber(null);
    setAuthUserFields({});
    notifyListeners();
  }

  void setAuthUserId(String? id) {
    _authUserId = id;
    notifyListeners();
  }

  void setAuthUserRoleId(String? roleId) {
    _authUserRoleId = roleId;
    notifyListeners();
  }

  void setAuthUserPhoneNumber(String? phoneNumber) {
    _authUserPhoneNumber = phoneNumber;
    notifyListeners();
  }

  void setAuthUserFields(Map<String, dynamic> fields) {
    if (_authUser != null) {
      fields.forEach((field, value) {
        if (_authUser!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _authUser!.toJson()[field] = value;
        } else {
          // print('Error: Field $field does not exist in user object.');
        }
      });

      notifyListeners(); // Notify listeners after the fields update
    } else {
      // print('Error: No user object found to update.');
    }
  }

  // **************************************************
  // Constructor (If needed / Loads initial data)
  // **************************************************

  UserProvider() {
    _initializeSubProviders();

    // Stream User only if user is logged in...
    _auth.authStateChanges().listen((User? user) {
          if (user != null) {
            streamAuthUserData(user.uid);
          }
          notifyListeners();
        } as void Function(User? event)?);
  }

  // **************************************************
  // Dispose method
  // **************************************************

  @override
  void dispose() {
    // Cancel the stream when the provider is disposed of
    _userSubscription?.cancel();
    super.dispose();
  }

  // **************************************************
  // Private Methods/Helpers (if necessary)
  // **************************************************

  // Stream
  // --------------------------------------------------

  final StreamRepository _streamRepository = StreamRepository();
  StreamSubscription<UserModel?>? _userSubscription;

  // Stream user data and notify listeners when it changes
  void streamAuthUserData(String userId) {
    // Cancel any previous stream before starting a new one
    _userSubscription?.cancel();

    _userSubscription = _streamRepository
        .streamDocument<UserModel>(
      collectionName: DatasetsConstants.USERS_DATASET,
      documentId: userId,
      fromMap: (data) => UserModel.fromMap(data),
    )
        .listen((userData) {
      setAuthUser(userData!);
      notifyListeners(); // Notify the UI of changes
    });
  }

  // Cancel the stream subscription when no longer needed
  void cancelAuthUserStream() {
    _userSubscription?.cancel();
  }

  // **************************************************
  // Public Methods (to manipulate data/state)
  // **************************************************

  // You can add additional methods here that might coordinate actions
  // between the auth and profile providers if necessary.

  // **************************************************
  // **************************************************
}
