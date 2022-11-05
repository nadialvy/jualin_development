import 'package:get/get.dart';

import 'setting_seller_controller.dart';

class SettingSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingSellerController>(
      () => SettingSellerController(),
    );
  }
}
