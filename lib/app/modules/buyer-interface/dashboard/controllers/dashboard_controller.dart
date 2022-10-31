// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../chat/controllers/chat_controller.dart';
import '../../chat/views/chat_view.dart';
import '../../dashboard_2/controllers/dashboard_2_controller.dart';
import '../../dashboard_2/views/dashboard_2_view.dart';
import '../../order/controllers/order_controller.dart';
import '../../order/views/order_view.dart';
import '../../setting/controllers/setting_controller.dart';
import '../../setting/views/setting_view.dart';

const MENU_DASHBOARD2 = 0;
const MENU_ORDER = 1;
const MENU_CHAT = 2;
const MENU_SETTING = 3;

class DashboardController extends GetxController {
  // final userRole = ''.obs;
  final bottomNavigationController = PersistentTabController();
  final pageList = [
    const Dashboard2View(),
    const OrderView(),
    const ChatView(),
    const SettingView(),
  ];

  var currentIndex = MENU_DASHBOARD2;

  void onTabChange(index) {
    if (index == MENU_DASHBOARD2 && currentIndex != MENU_DASHBOARD2) {
      Get.find<Dashboard2Controller>().onReady();
      currentIndex = index;
    } else if (index == MENU_ORDER && currentIndex != MENU_ORDER) {
      Get.find<OrderController>().onInit();
      currentIndex = index;
    } else if (index == MENU_CHAT && currentIndex != MENU_CHAT) {
      Get.find<ChatController>().onInit();
      currentIndex = index;
    } else if (index == MENU_SETTING && currentIndex != MENU_SETTING) {
      Get.find<SettingController>().onInit();
      currentIndex = index;
    }
  }
}
