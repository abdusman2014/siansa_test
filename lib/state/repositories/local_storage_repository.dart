import 'package:siansa_app/domain/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:siansa_app/models/state/repositories/repository_response_model.dart';
import 'package:siansa_app/state/repositories/repository_utils.dart';

class LocalStorageRepository {
  // final _sharedPreferencesService = SharedPreferencesService();
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();

  // **************************************************
  // CRUD LOCAL STORAGE KEYS AND VALUES
  // **************************************************

  Future<dynamic> saveKeyValue(String key, dynamic value) async {
    try {
      await _sharedPreferencesService.saveKeyValue(key, value);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<dynamic> readKeyValue(String key) async {
    try {
      final serviceResponse = await _sharedPreferencesService.readKeyValue(key);
      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<dynamic> updateKeyValue(String key, dynamic value) async {
    try {
      await _sharedPreferencesService.updateKeyValue(key, value);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<dynamic> deleteKeyValue(String key) async {
    try {
      await _sharedPreferencesService.deleteKeyValue(key);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  // **************************************************
  // CRUD LOCAL STORAGE MODELS
  // **************************************************

  Future<dynamic> saveModel<T>(
    String key,
    T model,
    Map<String, dynamic> Function(T) toMap,
  ) async {
    try {
      await _sharedPreferencesService.saveModel(key, model, toMap);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<RepositoryResponseModel> getModel<T>(
    String key,
    T Function(Map<String, dynamic>) fromMap,
  ) async {
    try {
      final serviceResponse =
          await _sharedPreferencesService.getModel(key, fromMap);
      return RepositoryUtils.responseSuccess(data: serviceResponse);
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }

  Future<dynamic> deleteModel<T>(String key) async {
    try {
      await _sharedPreferencesService.deleteModel(key);
      return RepositoryUtils.responseSuccess();
    } catch (e) {
      return RepositoryUtils.responseError(errorMessage: e.toString());
    }
  }
}

/* EXAMPLE USAGE FROM THE PROVIDERS LAYER:
testingLocalStorage() async {
    dynamic repRes1 = await LocalStorageRepository().readKeyValue("test");
    print(repRes1.data);

    await LocalStorageRepository().saveKeyValue("test", 234);

    dynamic repRes2 = await LocalStorageRepository().readKeyValue("test");
    print(repRes2.data);

    await LocalStorageRepository().updateKeyValue("test", "hola");

    dynamic repRes3 = await LocalStorageRepository().readKeyValue("test");
    print(repRes3.data);

    await LocalStorageRepository().updateKeyValue("test", 12.99);

    dynamic repRes4 = await LocalStorageRepository().readKeyValue("test");
    print(repRes4.data);

    await LocalStorageRepository().updateKeyValue(
      "test",
      [
        1,
        "dss",
        21.2,
        {"hi": "tes"}
      ],
    );

    dynamic repRes5 = await LocalStorageRepository().readKeyValue("test");
    print(repRes5.data);

    await LocalStorageRepository().updateKeyValue("test", true);

    dynamic repRes6 = await LocalStorageRepository().readKeyValue("test");
    print(repRes6.data);

    await LocalStorageRepository().deleteKeyValue("test");

    dynamic repRes7 = await LocalStorageRepository().readKeyValue("test");
    print(repRes7.data);
  }
  */
