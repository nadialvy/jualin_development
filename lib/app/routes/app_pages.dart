import 'package:get/get.dart';

import '../modules/authentication/login/login_binding.dart';
import '../modules/authentication/login/login_view.dart';
import '../modules/authentication/on_boarding/on_boarding_binding.dart';
import '../modules/authentication/on_boarding/on_boarding_view.dart';
import '../modules/authentication/register/register_binding.dart';
import '../modules/authentication/register/register_view.dart';
import '../modules/buyer-interface/chat/chat_binding.dart';
import '../modules/buyer-interface/chat/chat_view.dart';
import '../modules/buyer-interface/dashboard/dashboard_binding.dart';
import '../modules/buyer-interface/dashboard/dashboard_view.dart';
import '../modules/buyer-interface/dashboard_2/dashboard_2_binding.dart';
import '../modules/buyer-interface/dashboard_2/dashboard_2_view.dart';
import '../modules/buyer-interface/help/help_binding.dart';
import '../modules/buyer-interface/help/help_view.dart';
import '../modules/buyer-interface/notification/notification_binding.dart';
import '../modules/buyer-interface/notification/notification_view.dart';
import '../modules/buyer-interface/order/order_binding.dart';
import '../modules/buyer-interface/order/order_view.dart';
import '../modules/buyer-interface/profile/profile_binding.dart';
import '../modules/buyer-interface/profile/profile_view.dart';
import '../modules/buyer-interface/setting/setting_binding.dart';
import '../modules/buyer-interface/setting/setting_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/media_preview/image_preview/image_preview_binding.dart';
import '../modules/media_preview/image_preview/image_preview_view.dart';

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
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_2,
      page: () => Dashboard2View(),
      binding: Dashboard2Binding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => HelpView(),
      binding: HelpBinding(),
    ),
  ];
}
