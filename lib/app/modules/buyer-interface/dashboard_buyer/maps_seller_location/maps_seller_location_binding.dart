import 'package:get/get.dart';

import 'maps_seller_location_controller.dart';

class MapsSellerLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsSellerLocationController>(
      () => MapsSellerLocationController(),
    );
  }
}
