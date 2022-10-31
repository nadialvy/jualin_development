// ignore_for_file: unnecessary_question_mark


import 'package:jualin_flutter_3/app/models/request/response/user_profile_entity.dart';

import 'base/json_convert_content.dart';

UserProfileEntity $UserProfileEntityFromJson(Map<String, dynamic> json) {
	final UserProfileEntity userProfileEntity = UserProfileEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		userProfileEntity.status = status;
	}
	final UserProfileData? data = jsonConvert.convert<UserProfileData>(json['data']);
	if (data != null) {
		userProfileEntity.data = data;
	}
	return userProfileEntity;
}

Map<String, dynamic> $UserProfileEntityToJson(UserProfileEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['data'] = entity.data?.toJson();
	return data;
}

UserProfileData $UserProfileDataFromJson(Map<String, dynamic> json) {
	final UserProfileData userProfileData = UserProfileData();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userProfileData.id = id;
	}
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		userProfileData.fullName = fullName;
	}
	final dynamic? firstName = jsonConvert.convert<dynamic>(json['first_name']);
	if (firstName != null) {
		userProfileData.firstName = firstName;
	}
	final dynamic? lastName = jsonConvert.convert<dynamic>(json['last_name']);
	if (lastName != null) {
		userProfileData.lastName = lastName;
	}
	final String? photoProfile = jsonConvert.convert<String>(json['photo_profile']);
	if (photoProfile != null) {
		userProfileData.photoProfile = photoProfile;
	}
	final dynamic? dob = jsonConvert.convert<dynamic>(json['dob']);
	if (dob != null) {
		userProfileData.dob = dob;
	}
	final dynamic? pob = jsonConvert.convert<dynamic>(json['pob']);
	if (pob != null) {
		userProfileData.pob = pob;
	}
	final dynamic? gender = jsonConvert.convert<dynamic>(json['gender']);
	if (gender != null) {
		userProfileData.gender = gender;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		userProfileData.status = status;
	}
	final bool? hasPin = jsonConvert.convert<bool>(json['has_pin']);
	if (hasPin != null) {
		userProfileData.hasPin = hasPin;
	}
	final bool? isConnectGoogle = jsonConvert.convert<bool>(json['is_connect_google']);
	if (isConnectGoogle != null) {
		userProfileData.isConnectGoogle = isConnectGoogle;
	}
	final bool? isConnectApple = jsonConvert.convert<bool>(json['is_connect_apple']);
	if (isConnectApple != null) {
		userProfileData.isConnectApple = isConnectApple;
	}
	final bool? isConnectBelajarId = jsonConvert.convert<bool>(json['is_connect_belajar_id']);
	if (isConnectBelajarId != null) {
		userProfileData.isConnectBelajarId = isConnectBelajarId;
	}
	final dynamic? activatedAt = jsonConvert.convert<dynamic>(json['activated_at']);
	if (activatedAt != null) {
		userProfileData.activatedAt = activatedAt;
	}
	final String? lastLoggedIn = jsonConvert.convert<String>(json['last_logged_in']);
	if (lastLoggedIn != null) {
		userProfileData.lastLoggedIn = lastLoggedIn;
	}
	final List<dynamic>? userRoles = jsonConvert.convertListNotNull<dynamic>(json['user_roles']);
	if (userRoles != null) {
		userProfileData.userRoles = userRoles;
	}
	final List<UserProfileDataUserProviders>? userProviders = jsonConvert.convertListNotNull<UserProfileDataUserProviders>(json['user_providers']);
	if (userProviders != null) {
		userProfileData.userProviders = userProviders;
	}
	final List<UserProfileDataOrganizations>? organizations = jsonConvert.convertListNotNull<UserProfileDataOrganizations>(json['organizations']);
	if (organizations != null) {
		userProfileData.organizations = organizations;
	}
	return userProfileData;
}

Map<String, dynamic> $UserProfileDataToJson(UserProfileData entity) {
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
	data['has_pin'] = entity.hasPin;
	data['is_connect_google'] = entity.isConnectGoogle;
	data['is_connect_apple'] = entity.isConnectApple;
	data['is_connect_belajar_id'] = entity.isConnectBelajarId;
	data['activated_at'] = entity.activatedAt;
	data['last_logged_in'] = entity.lastLoggedIn;
	data['user_roles'] =  entity.userRoles;
	data['user_providers'] =  entity.userProviders?.map((v) => v.toJson()).toList();
	data['organizations'] =  entity.organizations?.map((v) => v.toJson()).toList();
	return data;
}

UserProfileDataUserProviders $UserProfileDataUserProvidersFromJson(Map<String, dynamic> json) {
	final UserProfileDataUserProviders userProfileDataUserProviders = UserProfileDataUserProviders();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userProfileDataUserProviders.id = id;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		userProfileDataUserProviders.type = type;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		userProfileDataUserProviders.value = value;
	}
	return userProfileDataUserProviders;
}

Map<String, dynamic> $UserProfileDataUserProvidersToJson(UserProfileDataUserProviders entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['value'] = entity.value;
	return data;
}

UserProfileDataOrganizations $UserProfileDataOrganizationsFromJson(Map<String, dynamic> json) {
	final UserProfileDataOrganizations userProfileDataOrganizations = UserProfileDataOrganizations();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userProfileDataOrganizations.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userProfileDataOrganizations.name = name;
	}
	final String? logoUrl = jsonConvert.convert<String>(json['logo_url']);
	if (logoUrl != null) {
		userProfileDataOrganizations.logoUrl = logoUrl;
	}
	final UserProfileDataOrganizationsUserGroup? userGroup = jsonConvert.convert<UserProfileDataOrganizationsUserGroup>(json['user_group']);
	if (userGroup != null) {
		userProfileDataOrganizations.userGroup = userGroup;
	}
	return userProfileDataOrganizations;
}

Map<String, dynamic> $UserProfileDataOrganizationsToJson(UserProfileDataOrganizations entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['logo_url'] = entity.logoUrl;
	data['user_group'] = entity.userGroup?.toJson();
	return data;
}

UserProfileDataOrganizationsUserGroup $UserProfileDataOrganizationsUserGroupFromJson(Map<String, dynamic> json) {
	final UserProfileDataOrganizationsUserGroup userProfileDataOrganizationsUserGroup = UserProfileDataOrganizationsUserGroup();
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		userProfileDataOrganizationsUserGroup.fullName = fullName;
	}
	final dynamic? photoUrl = jsonConvert.convert<dynamic>(json['photo_url']);
	if (photoUrl != null) {
		userProfileDataOrganizationsUserGroup.photoUrl = photoUrl;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		userProfileDataOrganizationsUserGroup.type = type;
	}
	return userProfileDataOrganizationsUserGroup;
}

Map<String, dynamic> $UserProfileDataOrganizationsUserGroupToJson(UserProfileDataOrganizationsUserGroup entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['full_name'] = entity.fullName;
	data['photo_url'] = entity.photoUrl;
	data['type'] = entity.type;
	return data;
}