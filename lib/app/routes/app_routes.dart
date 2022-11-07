// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;

  // —————————————————————————————————————————————————————————————————————————————
  // DOCUMENT VIEWER
  // —————————————————————————————————————————————————————————————————————————————
  static const IMAGE_PREVIEW = '/image-preview';

  static const ON_BOARDING = _Paths.ON_BOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;

  ///BUYER SECTION
  static const PERSISTENT_TAB_BUYER = _Paths.PERSISTENT_TAB_BUYER;
  static const ORDER = _Paths.ORDER_BUYER;
  static const CHAT = _Paths.CHAT_BUYER;
  static const SETTING = _Paths.SETTING_BUYER;
  static const DASHBOARD_BUYER = _Paths.DASHBOARD_BUYER;
  static const PROFILE_BUYER = _Paths.PROFILE_BUYER;
  static const NOTIFICATION_BUYER = _Paths.NOTIFICATION_BUYER;
  static const HELP_BUYER = _Paths.HELP_BUYER;
  static const CHAT_WITH_SELLER = _Paths.CHAT_BUYER + _Paths.CHAT_WITH_SELLER;
  static const CHAT_WITH_STALL_OWNER =
      _Paths.CHAT_BUYER + _Paths.CHAT_WITH_STALL_OWNER;
  static const NOTIF_DASHBOARD =
      _Paths.DASHBOARD_BUYER + _Paths.NOTIF_DASHBOARD;

  ///SELLER SECTION
  static const DASHBOARD_SELLER = _Paths.DASHBOARD_SELLER;
  static const PERSISTENT_TAB_SELLER = _Paths.PERSISTENT_TAB_SELLER;
  static const ORDER_SELLER = _Paths.ORDER_SELLER;
  static const CHAT_SELLER = _Paths.CHAT_SELLER;
  static const SETTING_SELLER = _Paths.SETTING_SELLER;
  static const PROFILE_SELLER = _Paths.PROFILE_SELLER;
  static const NOTIFICATION_SELLER = _Paths.NOTIFICATION_SELLER;
  static const HELP_SELLER = _Paths.HELP_SELLER;
  static const CHAT_WITH_BUYER = _Paths.CHAT_SELLER + _Paths.CHAT_WITH_BUYER;
  static const CHAT_WITH_STALL_OWNER_ON_SELLER =
      _Paths.CHAT_SELLER + _Paths.CHAT_WITH_STALL_OWNER_ON_SELLER;
  static const NOTIF_DASHBOARD_SELLER = _Paths.DASHBOARD_SELLER + _Paths.NOTIF_DASHBOARD_SELLER;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ON_BOARDING = '/on-boarding';
  static const LOGIN = '/login';
  static const REGISTER = '/register';

  ///BUYER SECTION
  static const PERSISTENT_TAB_BUYER = '/persistent-tab-buyer';
  static const ORDER_BUYER = '/order-buyer';
  static const CHAT_BUYER = '/chat-buyer';
  static const SETTING_BUYER = '/setting-buyer';
  static const DASHBOARD_BUYER = '/dashboard-buyer';
  static const PROFILE_BUYER = '/profile-buyer';
  static const NOTIFICATION_BUYER = '/notification-buyer';
  static const HELP_BUYER = '/help-buyer';
  static const CHAT_WITH_STALL_OWNER = '/chat-stall-owner';
  static const CHAT_WITH_SELLER = '/chat-with-seller';

  ///SELLER SECTION
  static const DASHBOARD_SELLER = '/dashboard-seller';
  static const PERSISTENT_TAB_SELLER = '/persistent-tab-seller';
  static const ORDER_SELLER = '/order-seller';
  static const CHAT_SELLER = '/chat-seller';
  static const SETTING_SELLER = '/setting-seller';
  static const PROFILE_SELLER = '/profile-seller';
  static const NOTIFICATION_SELLER = '/notification-seller';
  static const HELP_SELLER = '/help-seller';
  static const NOTIF_DASHBOARD = '/notif-dashboard';
  static const CHAT_WITH_BUYER = '/chat-with-buyer';
  static const CHAT_WITH_STALL_OWNER_ON_SELLER =
      '/chat-with-stall-owner-on-seller';
  static const NOTIF_DASHBOARD_SELLER = '/notif-dashboard-seller';
}
