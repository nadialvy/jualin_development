import 'package:get/get.dart';

import '../modules/authentication/login/login_binding.dart';
import '../modules/authentication/login/login_view.dart';
import '../modules/authentication/on_boarding/on_boarding_binding.dart';
import '../modules/authentication/on_boarding/on_boarding_view.dart';
import '../modules/authentication/register/register_binding.dart';
import '../modules/authentication/register/register_view.dart';
import '../modules/buyer-interface/cadger_list/cadger_list_binding.dart';
import '../modules/buyer-interface/cadger_list/cadger_list_view.dart';
import '../modules/buyer-interface/chat_buyer/chat_buyer_binding.dart';
import '../modules/buyer-interface/chat_buyer/chat_buyer_view.dart';
import '../modules/buyer-interface/chat_buyer/chat_with_seller/chat_with_seller_binding.dart';
import '../modules/buyer-interface/chat_buyer/chat_with_seller/chat_with_seller_view.dart';
import '../modules/buyer-interface/chat_buyer/chat_with_stall_owner/chat_with_stall_owner_binding.dart';
import '../modules/buyer-interface/chat_buyer/chat_with_stall_owner/chat_with_stall_owner_view.dart';
import '../modules/buyer-interface/dashboard_buyer/dashboard_buyer_binding.dart';
import '../modules/buyer-interface/dashboard_buyer/dashboard_buyer_view.dart';
import '../modules/buyer-interface/dashboard_buyer/maps_seller_location/maps_seller_location_binding.dart';
import '../modules/buyer-interface/dashboard_buyer/maps_seller_location/maps_seller_location_view.dart';
import '../modules/buyer-interface/dashboard_buyer/notif_dashboard/notif_dashboard_binding.dart';
import '../modules/buyer-interface/dashboard_buyer/notif_dashboard/notif_dashboard_view.dart';
import '../modules/buyer-interface/detail_seller/detail_seller_binding.dart';
import '../modules/buyer-interface/detail_seller/detail_seller_view.dart';
import '../modules/buyer-interface/help_buyer/help_buyer_binding.dart';
import '../modules/buyer-interface/help_buyer/help_buyer_view.dart';
import '../modules/buyer-interface/notification_buyer/notification_buyer_binding.dart';
import '../modules/buyer-interface/notification_buyer/notification_view.dart';
import '../modules/buyer-interface/order_buyer/order_buyer_binding.dart';
import '../modules/buyer-interface/order_buyer/order_buyer_view.dart';
import '../modules/buyer-interface/persistent_tab_buyer/persistent_tab_buyer_binding.dart';
import '../modules/buyer-interface/persistent_tab_buyer/persistent_tab_buyer_view.dart';
import '../modules/buyer-interface/pitchman_list/pitchman_list_binding.dart';
import '../modules/buyer-interface/pitchman_list/pitchman_list_view.dart';
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
import '../modules/seller-interface/chat_seller/chat_with_buyer/chat_with_buyer_binding.dart';
import '../modules/seller-interface/chat_seller/chat_with_buyer/chat_with_buyer_view.dart';
import '../modules/seller-interface/chat_seller/chat_with_stall_owner_on_seller/chat_with_stall_owner_on_seller_binding.dart';
import '../modules/seller-interface/chat_seller/chat_with_stall_owner_on_seller/chat_with_stall_owner_on_seller_view.dart';
import '../modules/seller-interface/dashboard_seller/dashboard_seller_binding.dart';
import '../modules/seller-interface/dashboard_seller/dashboard_seller_view.dart';
import '../modules/seller-interface/dashboard_seller/notif_dashboard_seller/notif_dashboard_seller_binding.dart';
import '../modules/seller-interface/dashboard_seller/notif_dashboard_seller/notif_dashboard_seller_view.dart';
import '../modules/seller-interface/help_seller/help_seller_binding.dart';
import '../modules/seller-interface/help_seller/help_seller_view.dart';
import '../modules/seller-interface/notification_seller/notification_seller_binding.dart';
import '../modules/seller-interface/notification_seller/notification_seller_view.dart';
import '../modules/seller-interface/order_seller/order_seller_binding.dart';
import '../modules/seller-interface/order_seller/order_seller_view.dart';
import '../modules/seller-interface/persistent_tab_seller/persistent_tab_seller_binding.dart';
import '../modules/seller-interface/persistent_tab_seller/persistent_tab_seller_view.dart';
import '../modules/seller-interface/profile_seller/bindings/profile_seller_binding.dart';
import '../modules/seller-interface/profile_seller/views/profile_seller_view.dart';
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
      children: [
        GetPage(
          name: _Paths.CHAT_WITH_STALL_OWNER,
          page: () => ChatWithStallOwnerView(),
          binding: ChatWithStallOwnerBinding(),
        ),
        GetPage(
          name: _Paths.CHAT_WITH_SELLER,
          page: () => ChatWithSellerView(),
          binding: ChatWithSellerBinding(),
        ),
      ],
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
      children: [
        GetPage(
          name: _Paths.NOTIF_DASHBOARD,
          page: () => NotifDashboardView(),
          binding: NotifDashboardBinding(),
        ),
        GetPage(
          name: _Paths.MAPS_SELLER_LOCATION,
          page: () => MapsSellerLocationView(),
          binding: MapsSellerLocationBinding(),
        ),
      ],
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
      children: [
        GetPage(
          name: _Paths.NOTIF_DASHBOARD_SELLER,
          page: () => NotifDashboardSellerView(),
          binding: NotifDashboardSellerBinding(),
        ),
      ],
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
      children: [
        GetPage(
          name: _Paths.CHAT_WITH_BUYER,
          page: () => ChatWithBuyerView(),
          binding: ChatWithBuyerBinding(),
        ),
        GetPage(
          name: _Paths.CHAT_WITH_STALL_OWNER_ON_SELLER,
          page: () => ChatWithStallOwnerOnSellerView(),
          binding: ChatWithStallOwnerOnSellerBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SETTING_SELLER,
      page: () => SettingSellerView(),
      binding: SettingSellerBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SELLER,
      page: () => ProfileSellerView(),
      binding: ProfileSellerBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SELLER,
      page: () => NotificationSellerView(),
      binding: NotificationSellerBinding(),
    ),
    GetPage(
      name: _Paths.HELP_SELLER,
      page: () => HelpSellerView(),
      binding: HelpSellerBinding(),
    ),
    GetPage(
      name: _Paths.PITCHMAN_LIST,
      page: () => PitchmanListView(),
      binding: PitchmanListBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SELLER,
      page: () => DetailSellerView(),
      binding: DetailSellerBinding(),
    ),
    GetPage(
      name: _Paths.CADGER_LIST,
      page: () => const CadgerListView(),
      binding: CadgerListBinding(),
    ),
  ];
}
