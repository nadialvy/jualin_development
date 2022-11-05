import 'package:get/get.dart';

import '../controllers/profile_seller_controller.dart';

class ProfileSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSellerController>(
      () => ProfileSellerController(),
    );
  }
}
