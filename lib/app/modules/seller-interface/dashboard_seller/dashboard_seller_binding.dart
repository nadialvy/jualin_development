import 'package:get/get.dart';

import 'dashboard_seller_controller.dart';

class DashboardSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardSellerController>(
      () => DashboardSellerController(),
    );
  }
}
