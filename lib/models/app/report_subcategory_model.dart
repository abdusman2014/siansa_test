import 'dart:convert';

class ReportSubcategoryModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  List<dynamic> categoryIds;
  int createdAt;
  int modifiedAt;

  ReportSubcategoryModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    required this.description,
    required this.categoryIds,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static ReportSubcategoryModel fromMap(Map<String, dynamic> map) {
    return ReportSubcategoryModel(
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

  factory ReportSubcategoryModel.fromJson(Map<String, dynamic> json) {
    return ReportSubcategoryModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory ReportSubcategoryModel.convertFromJson(String source) =>
      ReportSubcategoryModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
