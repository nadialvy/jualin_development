import 'package:get/get.dart';

import 'notification_seller_controller.dart';

class NotificationSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationSellerController>(
      () => NotificationSellerController(),
    );
  }
}
