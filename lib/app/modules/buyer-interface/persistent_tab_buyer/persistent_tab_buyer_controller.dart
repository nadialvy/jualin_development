// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../chat_buyer/chat_buyer_controller.dart';
import '../chat_buyer/chat_buyer_view.dart';
import '../dashboard_buyer/dashboard_buyer_controller.dart';
import '../dashboard_buyer/dashboard_buyer_view.dart';
import '../order_buyer/order_buyer_controller.dart';
import '../order_buyer/order_buyer_view.dart';
import '../setting_buyer/setting_buyer_controller.dart';
import '../setting_buyer/setting_buyer_view.dart';

const MENU_DASHBOARD_BUYER = 0;
const MENU_ORDER_BUYER = 1;
const MENU_CHAT_BUYER = 2;
const MENU_SETTING_BUYER = 3;

var logger = Logger();

class PersistentTabBuyerController extends GetxController {
  final bottomNavigationController = PersistentTabController();
  final pageList = [
    const DashboardBuyerView(),
    const OrderBuyerView(),
    ChatBuyerView(),
    const SettingBuyerView(),
  ];

  var currentIndex = MENU_DASHBOARD_BUYER;

  Future<void> onTabChange(index) async {
    if (index == MENU_DASHBOARD_BUYER && currentIndex != MENU_DASHBOARD_BUYER) {
      await Get.delete<OrderBuyerController>();
      await Get.delete<ChatBuyerController>();
      await Get.delete<SettingBuyerController>();

      Get.put<DashboardBuyerController>(DashboardBuyerController());
      Get.find<DashboardBuyerController>().onReady();

      currentIndex = index;
    } else if (index == MENU_ORDER_BUYER && currentIndex != MENU_ORDER_BUYER) {
      await Get.delete<DashboardBuyerController>();
      await Get.delete<ChatBuyerController>();
      await Get.delete<SettingBuyerController>();

      Get.put<OrderBuyerController>(OrderBuyerController());
      Get.find<OrderBuyerController>().onInit();
      currentIndex = index;
    } else if (index == MENU_CHAT_BUYER && currentIndex != MENU_CHAT_BUYER) {
      await Get.delete<DashboardBuyerController>();
      await Get.delete<OrderBuyerController>();
      await Get.delete<SettingBuyerController>();

      Get.put<ChatBuyerController>(ChatBuyerController());
      Get.find<ChatBuyerController>().onInit();

      currentIndex = index;
    } else if (index == MENU_SETTING_BUYER && currentIndex != MENU_SETTING_BUYER) {
      await Get.delete<DashboardBuyerController>();
      await Get.delete<OrderBuyerController>();
      await Get.delete<ChatBuyerController>();

      Get.put<SettingBuyerController>(SettingBuyerController());
      Get.find<SettingBuyerController>().onReady();

      currentIndex = index;
    }
  }
}
