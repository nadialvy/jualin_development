import 'package:get/get.dart';

import 'dashboard_buyer_controller.dart';

class DashboardBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardBuyerController>(
      () => DashboardBuyerController(),
    );
  }
}
