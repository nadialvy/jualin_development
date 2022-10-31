import 'package:get/get.dart';

import '../../chat/controllers/chat_controller.dart';
import '../../dashboard_2/controllers/dashboard_2_controller.dart';
import '../../order/controllers/order_controller.dart';
import '../../setting/controllers/setting_controller.dart';
import '../controllers/dashboard_controller.dart';

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
