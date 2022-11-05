import 'package:get/get.dart';

import '../chat/chat_controller.dart';
import '../dashboard_2/dashboard_2_controller.dart';
import '../order/order_controller.dart';
import '../setting/setting_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dashboard2Controller>(() => Dashboard2Controller());
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
