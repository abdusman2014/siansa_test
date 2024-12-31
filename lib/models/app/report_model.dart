import 'dart:convert';

class ReportModel {
  dynamic id;
  bool isSystem;
  dynamic reportTemplateId;
  dynamic createdByUserId;
  dynamic reviewedByUserId;
  dynamic approvedByUserId;
  dynamic confirmedByUserId;
  dynamic cancelledByUserId;
  List<Map<String, dynamic>> inputGroups;
  dynamic reportStatusId;
  int createdAt;
  int modifiedAt;

  ReportModel({
    required this.id,
    this.isSystem = false,
    required this.reportTemplateId,
    required this.createdByUserId,
    this.reviewedByUserId,
    this.approvedByUserId,
    this.confirmedByUserId,
    this.cancelledByUserId,
    required this.inputGroups,
    required this.reportStatusId,
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static ReportModel fromMap(Map<String, dynamic> map) {
    return ReportModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      reportTemplateId: map['reportTemplateId'],
      createdByUserId: map['createdByUserId'],
      reviewedByUserId: map['reviewedByUserId'],
      approvedByUserId: map['approvedByUserId'],
      confirmedByUserId: map['confirmedByUserId'],
      cancelledByUserId: map['cancelledByUserId'],
      inputGroups: List<Map<String, dynamic>>.from(map['inputGroups'] ?? []),
      reportStatusId: map['reportStatusId'],
    )
      ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isSystem': isSystem,
      'reportTemplateId': reportTemplateId,
      'createdByUserId': createdByUserId,
      'reviewedByUserId': reviewedByUserId,
      'approvedByUserId': approvedByUserId,
      'confirmedByUserId': confirmedByUserId,
      'cancelledByUserId': cancelledByUserId,
      'inputGroups': inputGroups,
      'reportStatusId': reportStatusId,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory ReportModel.convertFromJson(String source) =>
      ReportModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
