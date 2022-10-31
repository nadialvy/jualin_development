import 'package:get/get.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/on_boarding/bindings/on_boarding_binding.dart';
import '../modules/authentication/on_boarding/views/on_boarding_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/buyer-interface/chat/bindings/chat_binding.dart';
import '../modules/buyer-interface/chat/views/chat_view.dart';
import '../modules/buyer-interface/dashboard/bindings/dashboard_binding.dart';
import '../modules/buyer-interface/dashboard/views/dashboard_view.dart';
import '../modules/buyer-interface/dashboard_2/bindings/dashboard_2_binding.dart';
import '../modules/buyer-interface/dashboard_2/views/dashboard_2_view.dart';
import '../modules/buyer-interface/help/bindings/help_binding.dart';
import '../modules/buyer-interface/help/views/help_view.dart';
import '../modules/buyer-interface/notification/bindings/notification_binding.dart';
import '../modules/buyer-interface/notification/views/notification_view.dart';
import '../modules/buyer-interface/order/bindings/order_binding.dart';
import '../modules/buyer-interface/order/views/order_view.dart';
import '../modules/buyer-interface/profile/bindings/profile_binding.dart';
import '../modules/buyer-interface/profile/views/profile_view.dart';
import '../modules/buyer-interface/setting/bindings/setting_binding.dart';
import '../modules/buyer-interface/setting/views/setting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
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
