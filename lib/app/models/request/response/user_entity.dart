import 'dart:convert';

import '../../../../generated/json/base/json_field.dart';
import '../../../../generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  String? status;
  UserData? data;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserData {
  String? id;
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  @JSONField(name: "photo_profile")
  String? photoProfile;
  String? dob;
  String? pob;
  String? gender;
  String? status;
  @JSONField(name: "activated_at")
  String? activatedAt;
  @JSONField(name: "last_logged_in")
  String? lastLoggedIn;
  @JSONField(name: "user_roles")
  List<dynamic>? userRoles;
  @JSONField(name: "user_providers")
  List<UserDataUserProviders>? userProviders;
  @JSONField(name: "email")
  String? email;
  @JSONField(name: "phone")
  String? phone;
  @JSONField(name: "latitude")
  String? latitude;
  @JSONField(name: "longitude")
  String? longitude;

  UserData();

  factory UserData.fromJson(Map<String, dynamic> json) => $UserDataFromJson(json);

  Map<String, dynamic> toJson() => $UserDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserDataUserProviders {
  String? type;
  String? id;
  @JSONField(name: "sso_id")
  String? ssoId;
  @JSONField(name: "sso_refresh_token")
  String? ssoRefreshToken;
  @JSONField(name: "deleted_at")
  String? deletedAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  String? value;
  @JSONField(name: "user_id")
  String? userId;
  @JSONField(name: "sso_access_token")
  String? ssoAccessToken;
  @JSONField(name: "verified_at")
  String? verifiedAt;
  @JSONField(name: "created_at")
  String? createdAt;

  UserDataUserProviders();

  factory UserDataUserProviders.fromJson(Map<String, dynamic> json) => $UserDataUserProvidersFromJson(json);

  Map<String, dynamic> toJson() => $UserDataUserProvidersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
