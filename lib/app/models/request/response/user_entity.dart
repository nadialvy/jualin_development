import 'package:jualin_flutter_3/generated/json/base/json_field.dart';
import 'package:jualin_flutter_3/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
  String? uid;
  String? address;
  @JSONField(name: "full_name")
  String? fullName;
  String? role;
  @JSONField(name: "phone_number")
  String? phoneNumber;
  UserPosition? position;
  @JSONField(name: "photo_url")
  String? photoUrl;
  String? email;
  @JSONField(name: "is_login")
  bool? isLogin;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserPosition {
  double? lat;
  double? long;

  UserPosition();

  factory UserPosition.fromJson(Map<String, dynamic> json) => $UserPositionFromJson(json);

  Map<String, dynamic> toJson() => $UserPositionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
