import 'dart:convert';

class ReportTemplateModel {
  dynamic id;
  bool isSystem;
  List<dynamic> categoryIds;
  List<dynamic> subcategoryIds;
  String name;
  String description;
  List<Map<String, dynamic>> inputGroups;
  int createdAt;
  int modifiedAt;

  ReportTemplateModel({
    required this.id,
    this.isSystem = false,
    required this.categoryIds,
    required this.subcategoryIds,
    required this.name,
    required this.description,
    required this.inputGroups,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static ReportTemplateModel fromMap(Map<String, dynamic> map) {
    return ReportTemplateModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      categoryIds: List<dynamic>.from(map['categoryIds'] ?? []),
      subcategoryIds: List<dynamic>.from(map['subcategoryIds'] ?? []),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      inputGroups: List<Map<String, dynamic>>.from(map['inputGroups'] ?? []),
    )
      ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isSystem': isSystem,
      'categoryIds': categoryIds,
      'subcategoryIds': subcategoryIds,
      'name': name,
      'description': description,
      'inputGroups': inputGroups,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory ReportTemplateModel.fromJson(Map<String, dynamic> json) {
    return ReportTemplateModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory ReportTemplateModel.convertFromJson(String source) =>
      ReportTemplateModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
