

import 'package:jualin_flutter_3/app/models/request/response/user_entity.dart';
import 'package:jualin_flutter_3/generated/json/base/json_convert_content.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		userEntity.status = status;
	}
	final UserData? data = jsonConvert.convert<UserData>(json['data']);
	if (data != null) {
		userEntity.data = data;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['data'] = entity.data?.toJson();
	return data;
}

UserData $UserDataFromJson(Map<String, dynamic> json) {
	final UserData userData = UserData();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userData.id = id;
	}
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		userData.fullName = fullName;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		userData.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		userData.lastName = lastName;
	}
	final String? photoProfile = jsonConvert.convert<String>(json['photo_profile']);
	if (photoProfile != null) {
		userData.photoProfile = photoProfile;
	}
	final String? dob = jsonConvert.convert<String>(json['dob']);
	if (dob != null) {
		userData.dob = dob;
	}
	final String? pob = jsonConvert.convert<String>(json['pob']);
	if (pob != null) {
		userData.pob = pob;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		userData.gender = gender;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		userData.status = status;
	}
	final String? activatedAt = jsonConvert.convert<String>(json['activated_at']);
	if (activatedAt != null) {
		userData.activatedAt = activatedAt;
	}
	final String? lastLoggedIn = jsonConvert.convert<String>(json['last_logged_in']);
	if (lastLoggedIn != null) {
		userData.lastLoggedIn = lastLoggedIn;
	}
	final List<dynamic>? userRoles = jsonConvert.convertListNotNull<dynamic>(json['user_roles']);
	if (userRoles != null) {
		userData.userRoles = userRoles;
	}
	final List<UserDataUserProviders>? userProviders = jsonConvert.convertListNotNull<UserDataUserProviders>(json['user_providers']);
	if (userProviders != null) {
		userData.userProviders = userProviders;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userData.email = email;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		userData.phone = phone;
	}
	final String? latitude = jsonConvert.convert<String>(json['latitude']);
	if (latitude != null) {
		userData.latitude = latitude;
	}
	final String? longitude = jsonConvert.convert<String>(json['longitude']);
	if (longitude != null) {
		userData.longitude = longitude;
	}
	return userData;
}

Map<String, dynamic> $UserDataToJson(UserData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['full_name'] = entity.fullName;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['photo_profile'] = entity.photoProfile;
	data['dob'] = entity.dob;
	data['pob'] = entity.pob;
	data['gender'] = entity.gender;
	data['status'] = entity.status;
	data['activated_at'] = entity.activatedAt;
	data['last_logged_in'] = entity.lastLoggedIn;
	data['user_roles'] =  entity.userRoles;
	data['user_providers'] =  entity.userProviders?.map((v) => v.toJson()).toList();
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}

UserDataUserProviders $UserDataUserProvidersFromJson(Map<String, dynamic> json) {
	final UserDataUserProviders userDataUserProviders = UserDataUserProviders();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		userDataUserProviders.type = type;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userDataUserProviders.id = id;
	}
	final String? ssoId = jsonConvert.convert<String>(json['sso_id']);
	if (ssoId != null) {
		userDataUserProviders.ssoId = ssoId;
	}
	final String? ssoRefreshToken = jsonConvert.convert<String>(json['sso_refresh_token']);
	if (ssoRefreshToken != null) {
		userDataUserProviders.ssoRefreshToken = ssoRefreshToken;
	}
	final String? deletedAt = jsonConvert.convert<String>(json['deleted_at']);
	if (deletedAt != null) {
		userDataUserProviders.deletedAt = deletedAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		userDataUserProviders.updatedAt = updatedAt;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		userDataUserProviders.value = value;
	}
	final String? userId = jsonConvert.convert<String>(json['user_id']);
	if (userId != null) {
		userDataUserProviders.userId = userId;
	}
	final String? ssoAccessToken = jsonConvert.convert<String>(json['sso_access_token']);
	if (ssoAccessToken != null) {
		userDataUserProviders.ssoAccessToken = ssoAccessToken;
	}
	final String? verifiedAt = jsonConvert.convert<String>(json['verified_at']);
	if (verifiedAt != null) {
		userDataUserProviders.verifiedAt = verifiedAt;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		userDataUserProviders.createdAt = createdAt;
	}
	return userDataUserProviders;
}

Map<String, dynamic> $UserDataUserProvidersToJson(UserDataUserProviders entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['id'] = entity.id;
	data['sso_id'] = entity.ssoId;
	data['sso_refresh_token'] = entity.ssoRefreshToken;
	data['deleted_at'] = entity.deletedAt;
	data['updated_at'] = entity.updatedAt;
	data['value'] = entity.value;
	data['user_id'] = entity.userId;
	data['sso_access_token'] = entity.ssoAccessToken;
	data['verified_at'] = entity.verifiedAt;
	data['created_at'] = entity.createdAt;
	return data;
}