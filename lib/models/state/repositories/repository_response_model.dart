import 'dart:convert';

class RepositoryResponseModel<T> {
  final bool success; // success is required and should never be null
  final T? data; // Can be null or any type of data
  final String? errorMessage; // Can be null

  RepositoryResponseModel({
    required this.success, // Always required
    this.data,
    this.errorMessage,
  }) : assert(
          (success && errorMessage == null) ||
              (!success && errorMessage != null),
          'If success is true, errorMessage must be null. If success is false, errorMessage must not be null.',
        );

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  // Create a model from a Map
  factory RepositoryResponseModel.fromMap(Map<String, dynamic> map) {
    return RepositoryResponseModel<T>(
      success: map['success'],
      data: map[
          'data'], // Assuming data is a simple type, else handle deserialization for complex types
      errorMessage: map['errorMessage'],
    );
  }

  // Convert the model to a Map
  Map<String, dynamic> toMap() {
    return {
      'success': success,
      // Assuming data can be serialized, you might need to handle this if T is complex
      'data': data,
      'errorMessage': errorMessage,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  // Create a model from JSON
  factory RepositoryResponseModel.fromJson(String source) {
    final map = source as Map<String,
        dynamic>; // Assuming the source is already parsed JSON (or you can jsonDecode(source))
    return RepositoryResponseModel.fromMap(map);
  }

  // Convert the model to JSON
  String toJson() {
    final map = toMap();
    return map
        .toString(); // You can also use jsonEncode(map) from dart:convert for proper JSON format
  }

  // using dart:convert

  /// Converts a JSON string to a RepositoryResponseModel instance
  factory RepositoryResponseModel.convertFromJson(String source) =>
      RepositoryResponseModel.fromMap(json.decode(source));

  /// Converts the object to a JSON string
  String convertToJson() => json.encode(toMap());
}
