import 'dart:convert';

class UserPermissionModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  int createdAt;
  int modifiedAt;

  UserPermissionModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    required this.description,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static UserPermissionModel fromMap(Map<String, dynamic> map) {
    return UserPermissionModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    )
      ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isSystem': isSystem,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory UserPermissionModel.fromJson(Map<String, dynamic> json) {
    return UserPermissionModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert

  /// Converts a JSON string to a UserPermissionModel instance
  factory UserPermissionModel.convertFromJson(String source) =>
      UserPermissionModel.fromMap(json.decode(source));

  /// Converts the object to a JSON string
  String convertToJson() => json.encode(toMap());

  // **************************************************
  // TO STRING
  // **************************************************

  @override
  String toString() {
    return toMap().toString();
  }

  // **************************************************
  // CLASS METHODS
  // **************************************************
}
