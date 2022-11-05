import 'package:get/get.dart';

import 'help_seller_controller.dart';

class HelpSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpSellerController>(
      () => HelpSellerController(),
    );
  }
}
