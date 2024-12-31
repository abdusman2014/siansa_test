import 'dart:convert';

class UserRoleModel {
  dynamic id;
  bool isSystem;
  String name;
  List<dynamic> userPermissionIds;
  int createdAt;
  int modifiedAt;

  UserRoleModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    this.userPermissionIds = const [],
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static UserRoleModel fromMap(Map<String, dynamic> map) {
    return UserRoleModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      name: map['name'] ?? '',
      userPermissionIds: List<dynamic>.from(map['userPermissionIds'] ?? []),
    )
      ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isSystem': isSystem,
      'name': name,
      'userPermissionIds': userPermissionIds,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
      // 'createdAt':
      //     createdAt != 0 ? createdAt : DateTime.now().millisecondsSinceEpoch,
      // 'modifiedAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory UserRoleModel.fromJson(Map<String, dynamic> json) {
    return UserRoleModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert

  /// Converts a JSON string to a UserRoleModel instance
  factory UserRoleModel.convertFromJson(String source) =>
      UserRoleModel.fromMap(json.decode(source));

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
