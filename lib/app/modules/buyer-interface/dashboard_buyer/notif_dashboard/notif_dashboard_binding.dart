import 'package:get/get.dart';

import 'notif_dashboard_controller.dart';

class NotifDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifDashboardController>(
      () => NotifDashboardController(),
    );
  }
}
