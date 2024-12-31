// import 'dart:convert';

// class UserModel {
//   String id;
//   // Auth Info
//   String email;
//   String? username;
//   String? phoneNumber;
//   // User Info
//   String name;
//   String lastName;
//   String fullName;
//   String displayName;
//   DateTime? dateOfBirth;
//   //
//   String userRoleId;
//   List<String> userRoleIds;
//   String photoUrl;
//   // Account Info
//   String accountStatus; // or List accountStatusIds[] ???
//   bool isAccountVerified;
//   bool isEmailVerified;
//   bool isPhoneVerified;
//   bool isTwoFactorEnabled;
//   // App Settings
//   String deviceTokenU;
//   String languageCode;
//   DateTime lastLogin;
//   int createdAt = 0;
//   int modifiedAt = 0;

//   UserModel({
//     required this.id,
//     required this.email,
//     this.username,
//     this.phoneNumber,
//     this.name = '',
//     this.lastName = '',
//     this.fullName = '',
//     this.displayName = '',
//     DateTime? dateOfBirth,
//     this.userRoleId = '',
//     this.userRoleIds = const [],
//     this.photoUrl = '',
//     this.accountStatus = '',
//     this.isAccountVerified = false,
//     this.isEmailVerified = false,
//     this.isPhoneVerified = false,
//     this.isTwoFactorEnabled = false,
//     this.deviceTokenU = '',
//     this.languageCode = 'en',
//     DateTime? lastLogin,
//   })  : dateOfBirth = dateOfBirth,
//         lastLogin = lastLogin ?? DateTime.now(),
//         createdAt = DateTime.now().millisecondsSinceEpoch,
//         modifiedAt = DateTime.now().millisecondsSinceEpoch;

//   // **************************************************
//   // FROM/TO MAP
//   // **************************************************

//   static UserModel fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       id: map['id'] ?? '',
//       email: map['email'] ?? '',
//       username: map['username'] ?? '',
//       phoneNumber: map['phoneNumber'],
//       name: map['name'] ?? '',
//       lastName: map['lastName'] ?? '',
//       fullName: map['fullName'] ?? '',
//       displayName: map['displayName'] ?? '',
//       dateOfBirth: map['dateOfBirth'],
//       userRoleId: map['userRoleId'] ?? '',
//       userRoleIds: map['userRoleIds'] ?? [],
//       photoUrl: map['photoUrl'] ?? '',
//       accountStatus: map['accountStatus'] ?? '',
//       isAccountVerified: map['isAccountVerified'],
//       isEmailVerified: map['isEmailVerified'],
//       isPhoneVerified: map['isPhoneVerified'],
//       isTwoFactorEnabled: map['isTwoFactorEnabled'],
//       deviceTokenU: map['deviceTokenU'] ?? '',
//       languageCode: map['languageCode'] ?? '',
//       lastLogin: map['lastLogin'] != null
//           ? DateTime.parse(map['lastLogin'])
//           : null, // Parse date
//     )
//       // ..createdAt = map['createdAt'] ?? 0
//       // ..modifiedAt = map['modifiedAt'] ?? 0;
//       ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
//       ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'email': email,
//       'username': username,
//       'phoneNumber': phoneNumber,
//       'name': name,
//       'lastName': lastName,
//       'fullName': fullName,
//       'displayName': displayName,
//       'dateOfBirth': dateOfBirth,
//       'userRoleId': userRoleId,
//       'userRoleIds': userRoleIds,
//       'photoUrl': photoUrl,
//       'accountStatus': accountStatus,
//       'isAccountVerified': isAccountVerified,
//       'isEmailVerified': isEmailVerified,
//       'isPhoneVerified': isPhoneVerified,
//       'isTwoFactorEnabled': isTwoFactorEnabled,
//       'deviceTokenU': deviceTokenU,
//       'languageCode': languageCode,
//       'lastLogin': lastLogin?.toIso8601String(), // Convert to string
//       'createdAt':
//           createdAt != 0 ? createdAt : DateTime.now().millisecondsSinceEpoch,
//       'modifiedAt': DateTime.now().millisecondsSinceEpoch,
//     };
//   }

//   // **************************************************
//   // FROM/TO JSON
//   // **************************************************

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'] ?? '',
//       email: json['email'] ?? '',
//       username: json['username'] ?? '',
//       phoneNumber: json['phoneNumber'],
//       name: json['name'] ?? '',
//       lastName: json['lastName'] ?? '',
//       fullName: json['fullName'] ?? '',
//       displayName: json['displayName'] ?? '',
//       dateOfBirth: json['dateOfBirth'],
//       userRoleId: json['userRoleId'] ?? '',
//       userRoleIds: json['userRoleIds'] ?? [],
//       photoUrl: json['photoUrl'] ?? '',
//       accountStatus: json['accountStatus'] ?? '',
//       isAccountVerified: json['isAccountVerified'],
//       isEmailVerified: json['isEmailVerified'],
//       isPhoneVerified: json['isPhoneVerified'],
//       isTwoFactorEnabled: json['isTwoFactorEnabled'],
//       deviceTokenU: json['deviceTokenU'] ?? '',
//       languageCode: json['languageCode'] ?? '',
//       lastLogin: json['lastLogin'] != null
//           ? DateTime.parse(json['lastLogin'])
//           : null, // Parse date
//     )
//       ..createdAt = json['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
//       ..modifiedAt =
//           json['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'email': email,
//       'username': username,
//       'phoneNumber': phoneNumber,
//       'name': name,
//       'lastName': lastName,
//       'fullName': fullName,
//       'displayName': displayName,
//       'dateOfBirth': dateOfBirth,
//       'userRoleId': userRoleId,
//       'userRoleIds': userRoleIds,
//       'photoUrl': photoUrl,
//       'accountStatus': accountStatus,
//       'isAccountVerified': isAccountVerified,
//       'isEmailVerified': isEmailVerified,
//       'isPhoneVerified': isPhoneVerified,
//       'isTwoFactorEnabled': isTwoFactorEnabled,
//       'deviceTokenU': deviceTokenU,
//       'languageCode': languageCode,
//       'lastLogin': lastLogin?.toIso8601String(), // Convert to string
//       'createdAt':
//           createdAt != 0 ? createdAt : DateTime.now().millisecondsSinceEpoch,
//       'modifiedAt': DateTime.now().millisecondsSinceEpoch,
//     };
//   }

//   /// from/to json using dart:convert

//   /// Converts a JSON string to a UserModel instance
//   factory UserModel.convertFromJson(String source) =>
//       UserModel.fromMap(json.decode(source));

//   /// Converts the object to a JSON string
//   String convertToJson() => json.encode(toMap());

//   // **************************************************
//   // TO STRING
//   // **************************************************

//   @override
//   String toString() {
//     return toMap().toString();
//   }

//   // **************************************************
//   // CLASS METHODS
//   // **************************************************

//   void updateLastLogin() {
//     lastLogin = DateTime.now();
//   }
// }

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  dynamic id;
  bool isSystem;
  // Auth Info
  String email;
  String? username;
  String? phoneNumber;
  String? phoneCountryCode;
  String? phoneFullNumberE164;
  String? password;
  // User Info
  String name;
  String lastName;
  String fullName;
  String displayName;
  DateTime? dateOfBirth;
  //
  dynamic userRoleId;
  List<dynamic> userRoleIds;
  String photoUrl;
  // Account Info
  dynamic accountStatusId;
  bool isAccountVerified;
  bool isEmailVerified;
  bool isPhoneVerified;
  bool isTwoFactorEnabled;
  // App Settings
  String deviceTokenU;
  String languageCode;
  // DateTime lastLogin;
  int lastLogin;
  int createdAt;
  int modifiedAt;

  UserModel({
    required this.id,
    this.isSystem = false,
    required this.email,
    this.username,
    this.phoneNumber,
    this.phoneCountryCode,
    this.phoneFullNumberE164,
    this.password = '',
    this.name = '',
    this.lastName = '',
    this.fullName = '',
    this.displayName = '',
    // DateTime? dateOfBirth,
    this.dateOfBirth,
    this.userRoleId,
    this.userRoleIds = const [],
    this.photoUrl = '',
    this.accountStatusId,
    this.isAccountVerified = false,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.isTwoFactorEnabled = false,
    this.deviceTokenU = '',
    this.languageCode = 'en',
    DateTime? lastLogin,
  })  :
        //dateOfBirth = dateOfBirth,
        // lastLogin = lastLogin ?? DateTime.now(),
        lastLogin = DateTime.now().millisecondsSinceEpoch,
        createdAt = DateTime.now().millisecondsSinceEpoch,
        modifiedAt = DateTime.now().millisecondsSinceEpoch;

  // **************************************************
  // FROM/TO MAP
  // **************************************************

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      isSystem: map['isSystem'] ?? false,
      email: map['email'] ?? '',
      username: map['username'],
      phoneNumber: map['phoneNumber'],
      phoneCountryCode: map['phoneCountryCode'],
      phoneFullNumberE164: map['phoneFullNumberE164'],
      password: map['password'],
      name: map['name'] ?? '',
      lastName: map['lastName'] ?? '',
      fullName: map['fullName'] ?? '',
      displayName: map['displayName'] ?? '',
      dateOfBirth: map['dateOfBirth'] == null
          ? null
          : (map['dateOfBirth'] as Timestamp).toDate(),
      userRoleId: map['userRoleId'],
      userRoleIds: List<dynamic>.from(map['userRoleIds'] ?? []),
      photoUrl: map['photoUrl'] ?? '',
      accountStatusId: map['accountStatusId'],
      isAccountVerified: map['isAccountVerified'] ?? false,
      isEmailVerified: map['isEmailVerified'] ?? false,
      isPhoneVerified: map['isPhoneVerified'] ?? false,
      isTwoFactorEnabled: map['isTwoFactorEnabled'] ?? false,
      deviceTokenU: map['deviceTokenU'] ?? '',
      languageCode: map['languageCode'] ?? 'en',
      // lastLogin: map['lastLogin'] == null
      //     ? DateTime.now(),
      //     : (map['lastLogin'] as Timestamp).toDate(),
    )
      ..lastLogin = map['lastLogin'] ?? DateTime.now().millisecondsSinceEpoch
      ..createdAt = map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch
      ..modifiedAt = map['modifiedAt'] ?? DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isSystem': isSystem,
      'email': email,
      'username': username,
      'phoneNumber': phoneNumber,
      'phoneCountryCode': phoneCountryCode,
      'phoneFullNumberE164': phoneFullNumberE164,
      'password': password,
      'name': name,
      'lastName': lastName,
      'fullName': fullName,
      'displayName': displayName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'userRoleId': userRoleId,
      'userRoleIds': userRoleIds,
      'photoUrl': photoUrl,
      'accountStatusId': accountStatusId,
      'isAccountVerified': isAccountVerified,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'isTwoFactorEnabled': isTwoFactorEnabled,
      'deviceTokenU': deviceTokenU,
      'languageCode': languageCode,
      // 'lastLogin': lastLogin.toIso8601String(),
      'lastLogin': lastLogin,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
  }

  // **************************************************
  // FROM/TO JSON
  // **************************************************

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  /// from/to json using dart:convert

  factory UserModel.convertFromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  String convertToJson() => json.encode(toMap());

  // **************************************************
  // TO STRING
  // **************************************************

  @override
  String toString() {
    return toMap().toString();
  }

  // **************************************************
  // CLASS METHODS
  // **************************************************

  void updateLastLogin() {
    // lastLogin = DateTime.now();
    lastLogin = DateTime.now().millisecondsSinceEpoch;
  }
}
