import 'package:get/get.dart';

import 'list_all_stall_seller_controller.dart';

class ListAllStallSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAllStallSellerController>(
      () => ListAllStallSellerController(),
    );
  }
}
