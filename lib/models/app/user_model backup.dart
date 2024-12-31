import 'dart:convert';

class UserModel {
  String id;
  String email;
  String phoneNumber;
  String name;
  String lastName;
  String displayName;
  String userRoleId;
  String photoUrl;
  String deviceTokenU;
  int createdAt = 0;
  int modifiedAt = 0;

  UserModel({
    required this.id,
    required this.email,
    this.phoneNumber = '',
    this.name = '',
    this.lastName = '',
    this.displayName = '',
    this.userRoleId = '',
    this.photoUrl = '',
    this.deviceTokenU = '',
  })  : createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  // static UserModel fromMap(Map<String, dynamic> map) {
  //   UserModel user = UserModel(
  //     id: map['id'] ?? '',
  //     email: map['email'] ?? '',
  //     phoneNumber: map['phoneNumber'] as String?,
  //     name: map['name'] as String?,
  //     lastName: map['lastName'] as String?,
  //     displayName: map['displayName'] as String?,
  //     userRoleId: map['userRoleId'] as String?,
  //     photoUrl: map['photoUrl'] as String?,
  //     deviceTokenU: map['deviceTokenU'] as String?,
  //   );
  //   user.createdAt = map['createdAt'] ?? 0;
  //   user.modifiedAt = map['modifiedAt'] ?? 0;
  //   return user;
  // }
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      name: map['name'] ?? '',
      lastName: map['lastName'] ?? '',
      displayName: map['displayName'] ?? '',
      userRoleId: map['userRoleId'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      deviceTokenU: map['deviceTokenU'] ?? '',
    )
      // ..createdAt = map['createdAt'] ?? 0
      // ..modifiedAt = map['modifiedAt'] ?? 0;
      ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  // Map<String, dynamic> toMap() {
  //   Map<String, dynamic> data = {};
  //   data['id'] = id; // Assuming id will always be non-null
  //   data['email'] = email;
  //   data['phoneNumber'] = phoneNumber;
  //   data['name'] = name;
  //   data['lastName'] = lastName;
  //   data['displayName'] = displayName;
  //   data['userRoleId'] = userRoleId;
  //   data['photoUrl'] = photoUrl;
  //   data['deviceTokenU'] = deviceTokenU;
  //   if (createdAt != 0) data['createdAt'] = createdAt;
  //   if (modifiedAt != 0) data['modifiedAt'] = modifiedAt;
  //   return data;
  // }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'name': name,
      'lastName': lastName,
      'displayName': displayName,
      'userRoleId': userRoleId,
      'photoUrl': photoUrl,
      'deviceTokenU': deviceTokenU,
      'createdAt':
          createdAt != 0 ? createdAt : DateTime.now().millisecondsSinceEpoch,
      'modifiedAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'],
  //     email: json['email'],
  //     phoneNumber: json['phoneNumber'],
  //     name: json['name'],
  //     lastName: json['lastName'],
  //     displayName: json['displayName'],
  //     userRoleId: json['userRoleId'],
  //     photoUrl: json['photoUrl'],
  //     deviceTokenU: json['deviceTokenU'],
  //   );
  // }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      name: json['name'] ?? '',
      lastName: json['lastName'] ?? '',
      displayName: json['displayName'] ?? '',
      userRoleId: json['userRoleId'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      deviceTokenU: json['deviceTokenU'] ?? '',
    )
      ..createdAt = json['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt =
          json['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  // String toJson() {
  //   final map = toMap();
  //   return map
  //       .toString(); // You can also use jsonEncode(map) from dart:convert for proper JSON format
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'phoneNumber': phoneNumber,
  //     'name': name,
  //     'lastName': lastName,
  //     'displayName': displayName,
  //     'userRoleId': userRoleId,
  //     'photoUrl': photoUrl,
  //     'deviceTokenU': deviceTokenU,
  //   };
  // }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'name': name,
      'lastName': lastName,
      'displayName': displayName,
      'userRoleId': userRoleId,
      'photoUrl': photoUrl,
      'deviceTokenU': deviceTokenU,
      'createdAt':
          createdAt != 0 ? createdAt : DateTime.now().millisecondsSinceEpoch,
      'modifiedAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  // using dart:convert

  /// Converts a JSON string to a UserModel instance
  factory UserModel.convertFromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  /// Converts the object to a JSON string
  String convertToJson() => json.encode(toMap());

  @override
  String toString() {
    return toMap().toString();
  }
}
