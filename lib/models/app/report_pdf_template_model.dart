import 'dart:convert';

class ReportPDFTemplateModel {
  dynamic id;
  bool isSystem;
  List<dynamic> categoryIds;
  List<dynamic> subcategoryIds;
  String name;
  String description;
  List<Map<String, dynamic>> fields;
  int createdAt;
  int modifiedAt;

  ReportPDFTemplateModel({
    required this.id,
    this.isSystem = false,
    required this.categoryIds,
    required this.subcategoryIds,
    required this.name,
    required this.description,
    required this.fields,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static ReportPDFTemplateModel fromMap(Map<String, dynamic> map) {
    return ReportPDFTemplateModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      categoryIds: List<dynamic>.from(map['categoryIds'] ?? []),
      subcategoryIds: List<dynamic>.from(map['subcategoryIds'] ?? []),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      fields: List<Map<String, dynamic>>.from(map['fields'] ?? []),
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
      'fields': fields,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory ReportPDFTemplateModel.fromJson(Map<String, dynamic> json) {
    return ReportPDFTemplateModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory ReportPDFTemplateModel.convertFromJson(String source) =>
      ReportPDFTemplateModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
