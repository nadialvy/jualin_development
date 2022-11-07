import 'package:get/get.dart';

import 'detail_seller_controller.dart';

class DetailSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSellerController>(
      () => DetailSellerController(),
    );
  }
}
