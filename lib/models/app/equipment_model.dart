import 'dart:convert';

class EquipmentModel {
  dynamic id;
  bool isSystem;
  String name;
  String description;
  String? brand;
  dynamic clientId;
  dynamic companyId;
  String? serialNumber; // Optional
  String? model; // Optional
  String? location; // Optional
  List<dynamic> categoryIds;
  List<dynamic> subcategoryIds;
  List<dynamic> ownerUserIds;
  List<dynamic> assignedUserIds;
  List<dynamic> notifiableUserIds;
  int createdAt;
  int modifiedAt;

  EquipmentModel({
    required this.id,
    this.isSystem = false,
    required this.name,
    this.description = '',
    this.brand,
    this.clientId,
    this.companyId,
    this.serialNumber,
    this.model,
    this.location,
    this.categoryIds = const [],
    this.subcategoryIds = const [],
    this.ownerUserIds = const [],
    this.assignedUserIds = const [],
    this.notifiableUserIds = const [],
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static EquipmentModel fromMap(Map<String, dynamic> map) {
    return EquipmentModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      brand: map['brand'] ?? '',
      clientId: map['clientId'],
      companyId: map['companyId'],
      serialNumber: map['serialNumber'],
      model: map['model'],
      location: map['location'],
      categoryIds: map['categoryIds'] ?? [],
      subcategoryIds: map['subcategoryIds'] ?? [],
      ownerUserIds: map['ownerUserIds'] ?? [],
      assignedUserIds: map['assignedUserIds'] ?? [],
      notifiableUserIds: map['notifiableUserIds'] ?? [],
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
      'brand': brand,
      'clientId': clientId,
      'companyId': companyId,
      'serialNumber': serialNumber,
      'model': model,
      'location': location,
      'categoryIds': categoryIds,
      'subcategoryIds': subcategoryIds,
      'ownerUserIds': ownerUserIds,
      'assignedUserIds': assignedUserIds,
      'notifiableUserIds': notifiableUserIds,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert
  factory EquipmentModel.convertFromJson(String source) =>
      EquipmentModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  // **************************************************
  // TO STRING
  // **************************************************

  @override
  String toString() {
    return toMap().toString();
  }
}
