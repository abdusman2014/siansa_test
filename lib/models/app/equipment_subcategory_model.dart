import 'dart:convert';

class EquipmentSubcategoryModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  List<dynamic> categoryIds;
  int createdAt;
  int modifiedAt;

  EquipmentSubcategoryModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    this.description = '',
    this.categoryIds = const [],
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static EquipmentSubcategoryModel fromMap(Map<String, dynamic> map) {
    return EquipmentSubcategoryModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      categoryIds: List<dynamic>.from(map['categoryIds'] ?? []),
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
      'categoryIds': categoryIds,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory EquipmentSubcategoryModel.fromJson(Map<String, dynamic> json) {
    return EquipmentSubcategoryModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert
  factory EquipmentSubcategoryModel.convertFromJson(String source) =>
      EquipmentSubcategoryModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  // **************************************************
  // TO STRING
  // **************************************************

  @override
  String toString() {
    return toMap().toString();
  }
}
