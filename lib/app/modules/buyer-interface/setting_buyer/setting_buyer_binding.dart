import 'package:get/get.dart';

import 'setting_buyer_controller.dart';

class SettingBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingBuyerController>(
      () => SettingBuyerController(),
    );
  }
}
