import 'package:get/get.dart';

import 'order_seller_controller.dart';

class OrderSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderSellerController>(
      () => OrderSellerController(),
    );
  }
}
