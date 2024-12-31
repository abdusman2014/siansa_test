import 'dart:convert';

class ReportCategoryModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  int createdAt;
  int modifiedAt;

  ReportCategoryModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    required this.description,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static ReportCategoryModel fromMap(Map<String, dynamic> map) {
    return ReportCategoryModel(
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

  factory ReportCategoryModel.fromJson(Map<String, dynamic> json) {
    return ReportCategoryModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert
  factory ReportCategoryModel.convertFromJson(String source) =>
      ReportCategoryModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
