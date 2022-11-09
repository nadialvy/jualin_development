import 'package:get/get.dart';

import 'list_all_stall_buyer_controller.dart';

class ListAllStallBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAllStallBuyerController>(
      () => ListAllStallBuyerController(),
    );
  }
}
