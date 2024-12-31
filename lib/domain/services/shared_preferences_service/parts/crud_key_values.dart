part of '../shared_preferences_service.dart';

extension SharedPreferencesCRUDKeyValues on SharedPreferencesService {
  // Save any dynamic value
  Future<void> saveKeyValue(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else {
      // For any other type (e.g., Map or List), save as JSON
      String jsonValue = json.encode(value);
      prefs.setString(key, jsonValue);
    }
  }

  // Read dynamic value
  Future<dynamic> readKeyValue(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(key)) {
      dynamic value = prefs.get(key);
      if (value is String && _isJsonString(value)) {
        return json.decode(value); // Decode JSON back into dynamic object
      }
      return value;
    }
    return null;
  }

  // Update dynamic value (reuses saveData)
  Future<void> updateKeyValue(String key, dynamic value) async {
    return saveKeyValue(key, value);
  }

  // Delete a key
  Future<void> deleteKeyValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Check if a key exists
  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  // Helper method to check if a string is a JSON-encoded object
  bool _isJsonString(String str) {
    try {
      json.decode(str);
      return true;
    } catch (_) {
      return false;
    }
  }
}

/**
 * Explanation:
 * saveData: Saves data for a key, with special handling for complex types like maps or lists, which are converted to JSON strings.
 * readData: Reads and returns the data, and if it’s a JSON string, it’s decoded back to its original form.
 * updateData: Uses saveData for updating existing values.
 * deleteData: Deletes the value for the given key.
 * containsKey: Checks if the given key exists in SharedPreferences.
 * 
 * EXAMPLE 1: Saving and Retrieving a String
 * 
 * Saving a string value:
 * await SharedPreferencesService.saveData('username', 'Gerardo');
 * 
 * Retrieving the string value:
 * String? username = await SharedPreferencesService.readData('username');
 * print('Username: $username');
 * 
 * EXAMPLE 2: Saving and Retrieving an Integer
 * 
 * Saving an integer value:
 * await SharedPreferencesService.saveData('age', 30);
 * 
 * Retrieving the integer value:
 * int? age = await SharedPreferencesService.readData('age');
 * print('Age: $age');
 * 
 * EXAMPLE 3: Saving and Retrieving a Map (as JSON)
 * Saving a map (object) value:
 * Map<String, dynamic> userInfo = {
 *   'name': 'Gerardo',
 *   'email': 'gerardo@example.com',
 * };
 * await SharedPreferencesService.saveData('user_info', userInfo);
 * 
 * Retrieving the map value:
 * Map<String, dynamic>? userInfo = await SharedPreferencesService.readData('user_info');
 * print('User Info: $userInfo');
 * 
 * Example 4: Updating a Key
 * Updating a string value:
 * await SharedPreferencesService.updateData('username', 'Gerardo Gallegos');
 * 
 * Retrieving the updated value:
 * String? updatedUsername = await SharedPreferencesService.readData('username');
 * print('Updated Username: $updatedUsername');
 * 
 * Example 5: Deleting a Key
 * Deleting the value:
 * await SharedPreferencesService.deleteData('username');
 * 
 * Checking if the key still exists:
 * bool hasKey = await SharedPreferencesService.containsKey('username');
 * print('Does username key exist? $hasKey'); // Should print false
 * 
 * Example 6: Saving and Retrieving a List
 * 
 * Saving a list of strings:
 * List<String> favoriteColors = ['Red', 'Blue', 'Green'];
 * await SharedPreferencesService.saveData('colors', favoriteColors);
 * 
 * Retrieving the list of strings:
 * List<String>? colors = await SharedPreferencesService.readData('colors');
 * print('Favorite Colors: $colors');
 */