import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:siansa_app/constants/user_roles_constants.dart';
import 'package:siansa_app/models/state/repositories/repository_response_model.dart';
import 'package:siansa_app/models/app/user_model.dart';
import 'package:siansa_app/navigation/helpers/get_route_helper.dart';
import 'package:siansa_app/state/providers/provider_utils.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_crud_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_profile_provider.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/state/repositories/crud_repository.dart';
import 'package:siansa_app/state/repositories/user_repository/user_repository.dart';

class UserAuthProvider with ChangeNotifier {
  // **************************************************
  // Init other providers:
  // **************************************************

  final UserProvider userProvider;
  UserAuthProvider(this.userProvider);

  final _CRUDRepository = CRUDRepository(DatasetsConstants.USERS_DATASET);

  // **************************************************
  // Methods from other providers:
  // **************************************************

  // Accessing userRole directly
  String get getAuthUserRoleId => userProvider.getAuthUserRoleId!;

  // **************************************************
  // Methods from this provider:
  // **************************************************

  // auth-related methods

  // --------------------------------------------------
  // REGISTER WITH EMAIL
  // --------------------------------------------------

  Future<void> registerWithEmail({
    required BuildContext context,
    required String name,
    required String lastName,
    required String email,
    required String password,
    String userRoleId = UserRoleIdsConstants.CLIENT_ROLE_ID,
  }) async {
    ProviderUtils.showLoading(context, text: 'Creating Account...');

    // Attempt to register the user in.
    var repositoryResponse =
        await UserRepository().auth.registerWithEmail(email, password);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);
      ProviderUtils.hideLoading();
      return;
    }

    String userId = repositoryResponse.data!['user']['uid'].toString();

    // Creating a user model instance
    UserModel userModel = UserModel(
      id: userId,
      name: name,
      lastName: lastName,
      email: email,
      userRoleId: userRoleId,
    );

    // Convert user model instance to a Map
    Map<String, dynamic> userMap = userModel.toMap();

    // Attempt to create the user data.
    var repositoryResponse2 = await _CRUDRepository.createOne(userMap);

    if (!repositoryResponse2.success) {
      ProviderUtils.showError(context, repositoryResponse2.errorMessage!);
      ProviderUtils.hideLoading();
      return;
    }

    userProvider.setAuthUser(userModel);
    userProvider.setAuthUserFields({"userRoleId": userModel.userRoleId});

    notifyListeners();
    ProviderUtils.hideLoading();

    // Navigate to the home page.
    String homeScreenRoute = GetRouteHelper.homeScreenRouteByUserRoleId(
      userProvider.getAuthUserRoleId,
    );
    context.go(homeScreenRoute);
  }

  // --------------------------------------------------
  // REGISTER WITH GOOGLE
  // --------------------------------------------------

  Future<void> registerWithGoogle({
    required BuildContext context,
  }) async {
    //
  }

  // --------------------------------------------------
  // REGISTER WITH FACEBOOK
  // --------------------------------------------------

  Future<void> registerWithFacebook({
    required BuildContext context,
  }) async {
    //
  }

  // --------------------------------------------------
  // SIGNIN WITH EMAIL
  // --------------------------------------------------

  Future<void> signInWithEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    ProviderUtils.showLoading(context, text: 'Signin In...');

    // Attempt to log the user in.
    var repositoryResponse =
        await UserRepository().auth.signInWithEmail(email, password);

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);
      ProviderUtils.hideLoading();
      return;
    }

    String userId = repositoryResponse.data!['user']['uid'].toString();

    // Attempt to get the user data.
    var repositoryResponse2 = await _CRUDRepository.readOneById(userId);

    if (!repositoryResponse2.success) {
      ProviderUtils.showError(context, repositoryResponse2.errorMessage!);
      ProviderUtils.hideLoading();
      return;
    }

    var userData = repositoryResponse2.data!;

    UserModel userModel = UserModel.fromMap(userData);

    userProvider.setAuthUser(userModel);
    userProvider.setAuthUserFields({"userRoleId": userModel.userRoleId});

    notifyListeners();
    ProviderUtils.hideLoading();

    // Navigate to the home page.
    String homeScreenRoute = GetRouteHelper.homeScreenRouteByUserRoleId(
      userProvider.getAuthUserRoleId,
    );
    context.go(homeScreenRoute);
  }

  // --------------------------------------------------
  // SIGNIN WITH GOOGLE
  // --------------------------------------------------

  Future<void> signInWithGoogle({
    required BuildContext context,
  }) async {
    //
  }

  // --------------------------------------------------
  // SIGNIN WITH FACEBOOK
  // --------------------------------------------------

  Future<void> signInWithFacebook({
    required BuildContext context,
  }) async {
    //
  }

  // --------------------------------------------------
  // SEND EMAIL VERIFICATION
  // --------------------------------------------------

  Future<void> sendEmailVerification({
    required BuildContext context,
    required String email,
  }) async {
    //
  }

  // --------------------------------------------------
  // RESET PASSWORD
  // --------------------------------------------------

  Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    //
  }

  // --------------------------------------------------
  // UPDATE PASSWORD
  // --------------------------------------------------

  Future<void> updatePassword({
    required BuildContext context,
    required String email,
  }) async {
    //
  }

  // --------------------------------------------------
  // SIGN OUT
  // --------------------------------------------------

  Future<void> signOut(BuildContext context) async {
    ProviderUtils.showLoading(context, text: 'Signing Out...');

    var repositoryResponse = await UserRepository().auth.signOut();

    ProviderUtils.hideLoading();

    if (!repositoryResponse.success) {
      ProviderUtils.showError(context, repositoryResponse.errorMessage!);
      ProviderUtils.hideLoading();
      return;
    }

    userProvider.setClearAuthUser();

    // The next file redirects user to login screen if user is null:
    // lib/auth/authentication_wrapper.dart

    // if (repositoryResponse.success) {
    //   userProvider.setClearAuthUser();
    //   ProviderUtils.hideLoading();
    //   // The next file redirects user to login screen if user is null:
    //   // lib/auth/authentication_wrapper.dart
    // } else {
    //   ProviderUtils.showError(context, repositoryResponse.errorMessage!);
    // }
  }

  // --------------------------------------------------
  // DELETE USER
  // --------------------------------------------------

  Future<dynamic> deleteUser(String uid) async {
    //
  }
}
