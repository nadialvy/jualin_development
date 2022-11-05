import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/chat_seller/chat_seller_controller.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/dashboard_seller/dashboard_seller_controller.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/order_seller/order_seller_controller.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/setting_seller/setting_seller_controller.dart';

import 'persistent_tab_seller_controller.dart';

class PersistentTabSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardSellerController>(() => DashboardSellerController());
    Get.lazyPut<OrderSellerController>(() => OrderSellerController());
    Get.lazyPut<ChatSellerController>(() => ChatSellerController());
    Get.lazyPut<SettingSellerController>(() => SettingSellerController());
    Get.lazyPut<PersistentTabSellerController>(
      () => PersistentTabSellerController(),
    );
  }
}
