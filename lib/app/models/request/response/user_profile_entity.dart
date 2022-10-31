import 'dart:convert';
import '../../../../generated/json/base/json_field.dart';
import '../../../../generated/json/user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity {
  String? status;
  UserProfileData? data;

  UserProfileEntity();

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) => $UserProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProfileData {
  String? id;
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "first_name")
  dynamic firstName;
  @JSONField(name: "last_name")
  dynamic lastName;
  @JSONField(name: "photo_profile")
  String? photoProfile;
  dynamic dob;
  dynamic pob;
  dynamic gender;
  String? status;
  @JSONField(name: "has_pin")
  bool? hasPin;
  @JSONField(name: "is_connect_google")
  bool? isConnectGoogle;
  @JSONField(name: "is_connect_apple")
  bool? isConnectApple;
  @JSONField(name: "is_connect_belajar_id")
  bool? isConnectBelajarId;
  @JSONField(name: "activated_at")
  dynamic activatedAt;
  @JSONField(name: "last_logged_in")
  String? lastLoggedIn;
  @JSONField(name: "user_roles")
  List<dynamic>? userRoles;
  @JSONField(name: "user_providers")
  List<UserProfileDataUserProviders>? userProviders;
  List<UserProfileDataOrganizations>? organizations;

  UserProfileData();

  factory UserProfileData.fromJson(Map<String, dynamic> json) => $UserProfileDataFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProfileDataUserProviders {
  String? id;
  String? type;
  String? value;

  UserProfileDataUserProviders();

  factory UserProfileDataUserProviders.fromJson(Map<String, dynamic> json) => $UserProfileDataUserProvidersFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileDataUserProvidersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProfileDataOrganizations {
  String? id;
  String? name;
  @JSONField(name: "logo_url")
  String? logoUrl;
  @JSONField(name: "user_group")
  UserProfileDataOrganizationsUserGroup? userGroup;

  UserProfileDataOrganizations();

  factory UserProfileDataOrganizations.fromJson(Map<String, dynamic> json) => $UserProfileDataOrganizationsFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileDataOrganizationsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProfileDataOrganizationsUserGroup {
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "photo_url")
  dynamic photoUrl;
  String? type;

  UserProfileDataOrganizationsUserGroup();

  factory UserProfileDataOrganizationsUserGroup.fromJson(Map<String, dynamic> json) => $UserProfileDataOrganizationsUserGroupFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileDataOrganizationsUserGroupToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
