import 'package:get/get.dart';

import '../modules/authentication/login/login_binding.dart';
import '../modules/authentication/login/login_view.dart';
import '../modules/authentication/on_boarding/on_boarding_binding.dart';
import '../modules/authentication/on_boarding/on_boarding_view.dart';
import '../modules/authentication/register/register_binding.dart';
import '../modules/authentication/register/register_view.dart';
import '../modules/buyer-interface/chat_buyer/chat_buyer_binding.dart';
import '../modules/buyer-interface/chat_buyer/chat_buyer_view.dart';
import '../modules/buyer-interface/dashboard_buyer/dashboard_buyer_binding.dart';
import '../modules/buyer-interface/dashboard_buyer/dashboard_buyer_view.dart';
import '../modules/buyer-interface/help_buyer/help_buyer_binding.dart';
import '../modules/buyer-interface/help_buyer/help_buyer_view.dart';
import '../modules/buyer-interface/notification_buyer/notification_buyer_binding.dart';
import '../modules/buyer-interface/notification_buyer/notification_view.dart';
import '../modules/buyer-interface/order_buyer/order_buyer_binding.dart';
import '../modules/buyer-interface/order_buyer/order_buyer_view.dart';
import '../modules/buyer-interface/persistent_tab_buyer/persistent_tab_buyer_binding.dart';
import '../modules/buyer-interface/persistent_tab_buyer/persistent_tab_buyer_view.dart';
import '../modules/buyer-interface/profile_buyer/profile_buyer_binding.dart';
import '../modules/buyer-interface/profile_buyer/profile_buyer_view.dart';
import '../modules/buyer-interface/setting_buyer/setting_buyer_binding.dart';
import '../modules/buyer-interface/setting_buyer/setting_buyer_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/media_preview/image_preview/image_preview_binding.dart';
import '../modules/media_preview/image_preview/image_preview_view.dart';
import '../modules/seller-interface/chat_seller/chat_seller_binding.dart';
import '../modules/seller-interface/chat_seller/chat_seller_view.dart';
import '../modules/seller-interface/dashboard_seller/dashboard_seller_binding.dart';
import '../modules/seller-interface/dashboard_seller/dashboard_seller_view.dart';
import '../modules/seller-interface/order_seller/order_seller_binding.dart';
import '../modules/seller-interface/order_seller/order_seller_view.dart';
import '../modules/seller-interface/persistent_tab_seller/persistent_tab_seller_binding.dart';
import '../modules/seller-interface/persistent_tab_seller/persistent_tab_seller_view.dart';
import '../modules/seller-interface/setting_seller/setting_seller_binding.dart';
import '../modules/seller-interface/setting_seller/setting_seller_view.dart';

// ignore_for_file: constant_identifier_names, prefer_const_constructors

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    // MEDIA PREVIEW
    GetPage(
      name: Routes.IMAGE_PREVIEW,
      page: () => ImagePreviewView(),
      binding: ImagePreviewBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PERSISTENT_TAB_BUYER,
      page: () => PersistentTabBuyerView(),
      binding: PersistentTabBuyerBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_BUYER,
      page: () => OrderBuyerView(),
      binding: OrderBuyerBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_BUYER,
      page: () => ChatBuyerView(),
      binding: ChatBuyerBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_BUYER,
      page: () => SettingBuyerView(),
      binding: SettingBuyerBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_BUYER,
      page: () => DashboardBuyerView(),
      binding: DashboardBuyerBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_BUYER,
      page: () => ProfileBuyerView(),
      binding: ProfileBuyerBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_BUYER,
      page: () => NotificationBuyerView(),
      binding: NotificationBuyerBinding(),
    ),
    GetPage(
      name: _Paths.HELP_BUYER,
      page: () => HelpBuyerView(),
      binding: HelpBuyerBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_SELLER,
      page: () => DashboardSellerView(),
      binding: DashboardSellerBinding(),
    ),
    GetPage(
      name: _Paths.PERSISTENT_TAB_SELLER,
      page: () => PersistentTabSellerView(),
      binding: PersistentTabSellerBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SELLER,
      page: () => OrderSellerView(),
      binding: OrderSellerBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SELLER,
      page: () => ChatSellerView(),
      binding: ChatSellerBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_SELLER,
      page: () => SettingSellerView(),
      binding: SettingSellerBinding(),
    ),
  ];
}
