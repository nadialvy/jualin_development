import 'package:get/get.dart';

import 'help_buyer_controller.dart';

class HelpBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpBuyerController>(
      () => HelpBuyerController(),
    );
  }
}
