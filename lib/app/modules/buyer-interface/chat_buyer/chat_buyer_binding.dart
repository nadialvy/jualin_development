import 'package:get/get.dart';

import '../dashboard_buyer/dashboard_buyer_controller.dart';
import '../order_buyer/order_buyer_controller.dart';
import '../setting_buyer/setting_buyer_controller.dart';
import 'chat_buyer_controller.dart';

class ChatBuyerBinding extends Bindings {
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
