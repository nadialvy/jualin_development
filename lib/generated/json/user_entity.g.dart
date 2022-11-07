import 'package:jualin_flutter_3/generated/json/base/json_convert_content.dart';
import 'package:jualin_flutter_3/app/models/request/response/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		userEntity.uid = uid;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userEntity.address = address;
	}
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		userEntity.fullName = fullName;
	}
	final String? role = jsonConvert.convert<String>(json['role']);
	if (role != null) {
		userEntity.role = role;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phone_number']);
	if (phoneNumber != null) {
		userEntity.phoneNumber = phoneNumber;
	}
	final UserPosition? position = jsonConvert.convert<UserPosition>(json['position']);
	if (position != null) {
		userEntity.position = position;
	}
	final String? photoUrl = jsonConvert.convert<String>(json['photo_url']);
	if (photoUrl != null) {
		userEntity.photoUrl = photoUrl;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userEntity.email = email;
	}
	final bool? isLogin = jsonConvert.convert<bool>(json['is_login']);
	if (isLogin != null) {
		userEntity.isLogin = isLogin;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	data['address'] = entity.address;
	data['full_name'] = entity.fullName;
	data['role'] = entity.role;
	data['phone_number'] = entity.phoneNumber;
	data['position'] = entity.position?.toJson();
	data['photo_url'] = entity.photoUrl;
	data['email'] = entity.email;
	data['is_login'] = entity.isLogin;
	return data;
}

UserPosition $UserPositionFromJson(Map<String, dynamic> json) {
	final UserPosition userPosition = UserPosition();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		userPosition.lat = lat;
	}
	final double? long = jsonConvert.convert<double>(json['long']);
	if (long != null) {
		userPosition.long = long;
	}
	return userPosition;
}

Map<String, dynamic> $UserPositionToJson(UserPosition entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['long'] = entity.long;
	return data;
}