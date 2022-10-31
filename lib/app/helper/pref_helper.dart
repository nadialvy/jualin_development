// ignore_for_file: avoid_positional_boolean_parameters, constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jualin_flutter_3/app/models/request/response/user_profile_entity.dart';


// MAKE KEY KEEP PRIVATE ————————————————————————————————————————————————————————
const _PREF_CURRENT_LANGUAGE = '_PREF_CURRENT_LANGUAGE';
const _PREF_IS_DARK_MODE = '_PREF_IS_DARK_MODE';
const _PREF_IS_LOGINNED = '_PREF_IS_LOGINNED';
const _PREF_TOKEN = '_PREF_TOKEN';
const _PREF_REFRESH_TOKEN = '_PREF_REFRESH_TOKEN';
const _PREF_GOOGLE_TOKEN = '_PREF_GOOGLE_TOKEN';
const _PREF_IS_USER_CONNECT_GOOGLE = '_PREF_IS_USER_CONNECT_GOOGLE';
const _PREF_IS_USER_CONNECT_APPLE = '_PREF_IS_USER_CONNECT_APPLE';
const _PREF_IS_USER_CONNECT_BELAJAR_ID = '_PREF_IS_USER_CONNECT_BELAJAR_ID';
const _PREF_ONBOARDED_USER = '_PREF_ONBOARDED_USER';
// —————————————————————————————————————————————————————————————————————————————

mixin PrefHelper {
  static final _pref = Get.find<GetStorage>();
  static final config = Get.find<GetStorage>();

  // reset / remove preference
  static void resetData() => _pref.erase();
  static void deleteData(String prefKey) => _pref.remove(prefKey);

  // app_current_language
  static String? get currentLanguage => _pref.read(_PREF_CURRENT_LANGUAGE);
  static void setCurrentLanguage(String value) => _pref.write(_PREF_CURRENT_LANGUAGE, value);

  // app_current_theme
  static bool? get isDarkMode => _pref.read(_PREF_IS_DARK_MODE);
  static void setIsDarkMode(bool value) => _pref.write(_PREF_IS_DARK_MODE, value);

  // is_login
  static bool? get isLogin => _pref.read(_PREF_IS_LOGINNED);
  static void setIsLogin(bool value) => _pref.write(_PREF_IS_LOGINNED, value);

  // user_token
  static String? get userToken => _pref.read(_PREF_TOKEN);
  static Future<void> setUserToken(String value) async => _pref.write(_PREF_TOKEN, value);

  // user_refresh_token
  static String? get userRefreshToken => _pref.read(_PREF_REFRESH_TOKEN);
  static Future<void> setUserRefreshToken(String value) async => _pref.write(_PREF_REFRESH_TOKEN, value);

  // user_google_token
  static String? get userGoogleToken => _pref.read(_PREF_GOOGLE_TOKEN);
  static Future<void> setUserGoogleToken(String value) async => _pref.write(_PREF_GOOGLE_TOKEN, value);

  // is_user_connect_to_google
  static bool? get isUserConnectGoogle => _pref.read(_PREF_IS_USER_CONNECT_GOOGLE);
  static void setIsUserConnectGoogle(bool value) => _pref.write(_PREF_IS_USER_CONNECT_GOOGLE, value);

  // is_user_connect_to_apple
  static bool? get isUserConnectApple => _pref.read(_PREF_IS_USER_CONNECT_APPLE);
  static void setIsUserConnectApple(bool value) => _pref.write(_PREF_IS_USER_CONNECT_APPLE, value);

  // is_user_connect_to_belejar_id
  static bool? get isUserConnectBelajarId => _pref.read(_PREF_IS_USER_CONNECT_BELAJAR_ID);
  static void setIsUserConnectBelajarId(bool value) => _pref.write(_PREF_IS_USER_CONNECT_BELAJAR_ID, value);

  // organizationUser
  static UserProfileDataOrganizations? get organizationUser {
    try {
      return UserProfileDataOrganizations.fromJson(json.decode(json.encode(_pref.read(_PREF_ONBOARDED_USER))));
    } catch (e) {
      return UserProfileDataOrganizations();
    }
  }

  static void setOrganizationUser(UserProfileDataOrganizations? value) => _pref.write(_PREF_ONBOARDED_USER, value);
}
