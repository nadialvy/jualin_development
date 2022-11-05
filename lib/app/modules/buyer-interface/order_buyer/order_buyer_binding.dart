import 'package:get/get.dart';

import 'order_buyer_controller.dart';

class OrderBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBuyerController>(
      () => OrderBuyerController(),
    );
  }
}
