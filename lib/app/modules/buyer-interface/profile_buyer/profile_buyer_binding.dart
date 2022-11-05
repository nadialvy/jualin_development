import 'package:get/get.dart';

import 'profile_buyer_controller.dart';

class ProfileBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileBuyerController>(
      () => ProfileBuyerController(),
    );
  }
}
