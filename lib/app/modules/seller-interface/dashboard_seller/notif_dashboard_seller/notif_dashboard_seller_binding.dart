import 'package:get/get.dart';

import 'notif_dashboard_seller_controller.dart';

class NotifDashboardSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifDashboardSellerController>(
      () => NotifDashboardSellerController(),
    );
  }
}
