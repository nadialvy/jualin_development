import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationBuyerController>(
      () => NotificationBuyerController(),
    );
  }
}
