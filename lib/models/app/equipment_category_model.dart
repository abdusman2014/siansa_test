import 'dart:convert';

class EquipmentCategoryModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  int createdAt;
  int modifiedAt;

  EquipmentCategoryModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    this.description = '',
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static EquipmentCategoryModel fromMap(Map<String, dynamic> map) {
    return EquipmentCategoryModel(
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

  factory EquipmentCategoryModel.fromJson(Map<String, dynamic> json) {
    return EquipmentCategoryModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert
  factory EquipmentCategoryModel.convertFromJson(String source) =>
      EquipmentCategoryModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  // **************************************************
  // TO STRING
  // **************************************************

  @override
  String toString() {
    return toMap().toString();
  }
}
