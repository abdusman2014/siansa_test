import 'dart:convert';

class ReportStatusModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  String color;
  int createdAt;
  int modifiedAt;

  ReportStatusModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    required this.description,
    required this.color,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static ReportStatusModel fromMap(Map<String, dynamic> map) {
    return ReportStatusModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      color: map['color'] ?? '',
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
      'color': color,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory ReportStatusModel.fromJson(Map<String, dynamic> json) {
    return ReportStatusModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory ReportStatusModel.convertFromJson(String source) =>
      ReportStatusModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
