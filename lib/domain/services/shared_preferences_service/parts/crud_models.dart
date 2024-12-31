part of '../shared_preferences_service.dart';

extension SharedPreferencesCRUDModels on SharedPreferencesService {
  // Create or Update a model by key
  Future<void> saveModel<T>(
    String key,
    T model,
    Map<String, dynamic> Function(T) toMap,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    String modelString = json.encode(toMap(model));
    prefs.setString(key, modelString);
  }

  // Read a model by key
  Future<T?> getModel<T>(
    String key,
    T Function(Map<String, dynamic>) fromMap,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    String? modelString = prefs.getString(key);
    if (modelString != null) {
      Map<String, dynamic> modelMap =
          Map<String, dynamic>.from(json.decode(modelString));
      return fromMap(modelMap);
    }
    return null;
  }

  // Delete a model by key
  Future<void> deleteModel(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Check if a model exists by key
  Future<bool> modelExists(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}

/** EXAMPLE USAGE WITH UserModel
 * 
 * import 'package:siansa_app/models/user_model.dart';
 * 
 * // Save a user model
 * SharedPreferencesService.saveModel<UserModel>(
 *   'user', 
 *   userModel, 
 *   (user) => user.toMap(),
 * );
 * 
 * // Get a user model
 * UserModel? user = await SharedPreferencesService.getModel<UserModel>(
 *   'user', 
 *   (map) => UserModel.fromMap(map),
 * );
 * 
 * // Delete a user model
 * SharedPreferencesService.deleteModel('user');
 * 
 * // Check if a user exists
 * bool exists = await SharedPreferencesService.exists('user');
 * 
 */
