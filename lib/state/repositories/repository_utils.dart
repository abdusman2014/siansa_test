import 'dart:io';
// import 'dart:js_util'; // does not works on iOS // Required for jsArrayToDartList

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:siansa_app/models/state/repositories/repository_response_model.dart';
import 'package:siansa_app/utilities/firebase_utils/firebase_utils.dart';

class RepositoryUtils {
  // Function to handle response success
  // static RepositoryResponseModel<Map<String, dynamic>> responseSuccess({
  static RepositoryResponseModel<dynamic> responseSuccess({
    dynamic data,
  }) {
    return RepositoryResponseModel(
      success: true,
      // TODO:
      // Set default to an empty map or list if data is null? Or leave it as null?
      data: data,
    );
  }

  // Function to handle response failed
  static RepositoryResponseModel<Map<String, dynamic>> responseError({
    String errorMessage = 'Something happened...',
  }) {
    // errorMessage = errorMessage.toString();
    // if (errorMessage.isEmpty) errorMessage = 'Something happened...';
    return RepositoryResponseModel(
      success: false,
      errorMessage: errorMessage,
    );
  }

  // Function to handle response SocketException error
  static RepositoryResponseModel<Map<String, dynamic>> responseSocketError(
    SocketException e,
  ) {
    return RepositoryResponseModel(
      success: false,
      errorMessage: e.toString(),
    );
  }

  // Function to handle response FirebaseAuthException error
  static RepositoryResponseModel<Map<String, dynamic>>
      responseFirebaseAuthError(
    FirebaseAuthException e,
  ) {
    String errorMessage = FirebaseUtils.getFirebaseErrorCode(e.code);
    return RepositoryResponseModel(
      success: false,
      errorMessage: errorMessage,
    );
  }

  // // Function to handle response FirebaseFirestoreException error
  // static RepositoryResponseModel<Map<String, dynamic>> responseFirestoreError(
  //   FirebaseFirestoreException e,
  // ) {
  //   return RepositoryResponseModel(
  //     success: false,
  //     errorMessage: errorMessage,
  //   );
  // }

  // // Function to handle response FirebaseStorageException error
  // static RepositoryResponseModel<Map<String, dynamic>> responseFirebaseStorageError(
  //   FirebaseFirestoreException e,
  // ) {
  //   return RepositoryResponseModel(
  //     success: false,
  //     errorMessage: errorMessage,
  //   );
  // }

  // // Function to handle response FirebaseFunctionsException error
  // static RepositoryResponseModel<Map<String, dynamic>> responseFirebaseFunctionsError(
  //   FirebaseFirestoreException e,
  // ) {
  //   return RepositoryResponseModel(
  //     success: false,
  //     errorMessage: errorMessage,
  //   );
  // }

  // // Function to handle response FirebaseRemoteConfException error
  // static RepositoryResponseModel<Map<String, dynamic>> responseFirebaseRemoteConfError(
  //   FirebaseFirestoreException e,
  // ) {
  //   return RepositoryResponseModel(
  //     success: false,
  //     errorMessage: errorMessage,
  //   );
  // }

  // // Function to handle response FirebaseDatabaseException error
  // static RepositoryResponseModel<Map<String, dynamic>> responseFirebaseDatabaseError(
  //   FirebaseFirestoreException e,
  // ) {
  //   return RepositoryResponseModel(
  //     success: false,
  //     errorMessage: errorMessage,
  //   );
  // }

  // OTHER UTILS

  // Utility function to convert JSArray to Dart List
  static List<Map<String, dynamic>> jsArrayToDartList(jsArray) {
    return List<Map<String, dynamic>>.from(
        jsArray.map((item) => Map<String, dynamic>.from(item)));
  }
}
