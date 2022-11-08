import 'package:get/get.dart';

import '../chat_buyer/chat_buyer_controller.dart';
import '../order_buyer/order_buyer_controller.dart';
import '../setting_buyer/setting_buyer_controller.dart';
import 'dashboard_buyer_controller.dart';

class DashboardBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingBuyerController>(
      () => SettingBuyerController(),
    );
    Get.lazyPut<DashboardBuyerController>(
      () => DashboardBuyerController(),
    );
    Get.lazyPut<ChatBuyerController>(
      () => ChatBuyerController(),
    );
    Get.lazyPut<OrderBuyerController>(
      () => OrderBuyerController(),
    );
  }
}
