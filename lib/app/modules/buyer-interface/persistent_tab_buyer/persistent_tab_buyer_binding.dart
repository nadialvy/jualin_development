import 'package:get/get.dart';

import '../chat_buyer/chat_buyer_controller.dart';
import '../dashboard_buyer/dashboard_buyer_controller.dart';
import '../order_buyer/order_buyer_controller.dart';
import '../setting_buyer/setting_buyer_controller.dart';
import 'persistent_tab_buyer_controller.dart';

class PersistentTabBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardBuyerController>(() => DashboardBuyerController());
    Get.lazyPut<OrderBuyerController>(() => OrderBuyerController());
    Get.lazyPut<ChatBuyerController>(() => ChatBuyerController());
    Get.lazyPut<SettingBuyerController>(() => SettingBuyerController());
    Get.lazyPut<PersistentTabBuyerController>(
      () => PersistentTabBuyerController(),
    );
  }
}
