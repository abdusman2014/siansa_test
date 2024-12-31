import 'package:firebase_auth/firebase_auth.dart';
import 'package:siansa_app/domain/services/firebase_service/modules/firebase_auth_service.dart';
import 'package:siansa_app/models/state/repositories/repository_response_model.dart';
import 'package:siansa_app/state/repositories/repository_utils.dart';
import 'package:siansa_app/utilities/firebase_utils/firebase_utils.dart';

class UserAuthRepository {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  Future<RepositoryResponseModel<dynamic>> registerWithEmail(
    String email,
    String password,
  ) async {
    email = email.toLowerCase();

    try {
      UserCredential? serviceResponse =
          await _firebaseAuthService.registerWithEmail(
        email,
        password,
      );

      // Convert UserCredential to Map
      Map<String, dynamic> userCredentialMap = {
        'user': serviceResponse?.user != null
            ? {
                'uid': serviceResponse?.user?.uid,
                'email': serviceResponse?.user?.email,
                'displayName': serviceResponse?.user?.displayName,
                'photoURL': serviceResponse?.user?.photoURL,
                'phoneNumber': serviceResponse?.user?.phoneNumber,
                'emailVerified': serviceResponse?.user?.emailVerified,
              }
            : null,
        'additionalUserInfo': serviceResponse?.additionalUserInfo != null
            ? {
                'isNewUser': serviceResponse?.additionalUserInfo?.isNewUser,
                'providerId': serviceResponse?.additionalUserInfo?.providerId,
                'profile': serviceResponse?.additionalUserInfo?.profile,
              }
            : null,
        'credential': serviceResponse?.credential != null
            ? {
                'providerId': serviceResponse?.credential?.providerId,
                'signInMethod': serviceResponse?.credential?.signInMethod,
              }
            : null,
      };

      // Save locally in SharedPreferences?
      // ...

      return RepositoryUtils.responseSuccess(data: userCredentialMap);
    } on FirebaseAuthException catch (e) {
      return RepositoryUtils.responseFirebaseAuthError(e);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // Future<RepositoryResponseModel<dynamic>> registerWithGoogle() async {}

  // Future<RepositoryResponseModel<dynamic>> registerWithFacebook() async {}

  Future<RepositoryResponseModel<dynamic>> signInWithEmail(
    String email,
    String password,
  ) async {
    email = email.toLowerCase();

    try {
      UserCredential? serviceResponse =
          await _firebaseAuthService.signInWithEmail(
        email,
        password,
      );

      // Convert UserCredential to Map
      Map<String, dynamic> userCredentialMap = {
        'user': serviceResponse?.user != null
            ? {
                'uid': serviceResponse?.user?.uid,
                'email': serviceResponse?.user?.email,
                'displayName': serviceResponse?.user?.displayName,
                'photoURL': serviceResponse?.user?.photoURL,
                'phoneNumber': serviceResponse?.user?.phoneNumber,
                'emailVerified': serviceResponse?.user?.emailVerified,
              }
            : null,
        'additionalUserInfo': serviceResponse?.additionalUserInfo != null
            ? {
                'isNewUser': serviceResponse?.additionalUserInfo?.isNewUser,
                'providerId': serviceResponse?.additionalUserInfo?.providerId,
                'profile': serviceResponse?.additionalUserInfo?.profile,
              }
            : null,
        'credential': serviceResponse?.credential != null
            ? {
                'providerId': serviceResponse?.credential?.providerId,
                'signInMethod': serviceResponse?.credential?.signInMethod,
              }
            : null,
      };

      // Save locally in SharedPreferences?
      // ...

      return RepositoryUtils.responseSuccess(data: userCredentialMap);
    } on FirebaseAuthException catch (e) {
      return RepositoryUtils.responseFirebaseAuthError(e);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // Future<RepositoryResponseModel<dynamic>> signInWithGoogle() async {}

  // Future<RepositoryResponseModel<dynamic>> signInWithFacebook() async {}

  // Future<RepositoryResponseModel<dynamic>> sendEmailVerification() async {}

  // Future<RepositoryResponseModel<dynamic>> resetPassword() async {}

  // Future<RepositoryResponseModel<dynamic>> updatePassword() async {}

  Future<RepositoryResponseModel<dynamic>> signOut() async {
    try {
      await _firebaseAuthService.signOut();
      return RepositoryUtils.responseSuccess();
    } on FirebaseAuthException catch (e) {
      return RepositoryUtils.responseFirebaseAuthError(e);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    } finally {
      // Clean up resources, update UI state, etc.
    }
  }

  // Future<RepositoryResponseModel<dynamic>> deleteUserAccount() async {}
  // Future<RepositoryResponseModel<dynamic>> deleteUser() async {}
}
