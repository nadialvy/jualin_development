// ignore_for_file: constant_identifier_names

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/dashboard_seller/dashboard_seller_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../helper/_index.dart';
import '../chat_seller/chat_seller_controller.dart';
import '../chat_seller/chat_seller_view.dart';
import '../dashboard_seller/dashboard_seller_controller.dart';
import '../order_seller/order_seller_controller.dart';
import '../order_seller/order_seller_view.dart';
import '../setting_seller/setting_seller_controller.dart';
import '../setting_seller/setting_seller_view.dart';

const MENU_DASHBOARD_SELLER = 0;
const MENU_ORDER_SELLER = 1;
const MENU_CHAT_SELLER = 2;
const MENU_SETTING_SELLER = 3;

class PersistentTabSellerController extends GetxController {
  final bottomNavigationController = PersistentTabController();
  final pageList = [
    const DashboardSellerView(),
    const OrderSellerView(),
    ChatSellerView(),
    const SettingSellerView(),
  ];

  var currentIndex = MENU_DASHBOARD_SELLER;

  void onTabChange(index) async {
    if (index == MENU_DASHBOARD_SELLER && currentIndex != MENU_DASHBOARD_SELLER) {
      Get.put(DashboardSellerController());
      Get.find<DashboardSellerController>().onReady();

      final dashboardSellerController = Get.find<DashboardSellerController>();
      Position position = await determinePosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      String address = "${placemarks[0].name} - ${placemarks[0].subLocality}";
      dashboardSellerController.updatePosition(position, address);

      await Get.delete<OrderSellerController>();
      await Get.delete<ChatSellerController>();
      await Get.delete<SettingSellerController>();

      currentIndex = index;
    } else if (index == MENU_ORDER_SELLER && currentIndex != MENU_ORDER_SELLER) {
      Get.lazyPut<OrderSellerController>(() => OrderSellerController());
      Get.find<OrderSellerController>().onInit();
      // await Get.delete<DashboardSellerController>();
      await Get.delete<ChatSellerController>();
      await Get.delete<SettingSellerController>();

      currentIndex = index;
    } else if (index == MENU_CHAT_SELLER && currentIndex != MENU_CHAT_SELLER) {
      Get.lazyPut<ChatSellerController>(() => ChatSellerController());
      Get.find<ChatSellerController>().onInit();

      // await Get.delete<DashboardSellerController>();
      await Get.delete<OrderSellerController>();
      await Get.delete<SettingSellerController>();

      currentIndex = index;
    } else if (index == MENU_SETTING_SELLER && currentIndex != MENU_SETTING_SELLER) {
      Get.lazyPut<SettingSellerController>(() => SettingSellerController());
      Get.find<SettingSellerController>().onInit();

      // await Get.delete<DashboardSellerController>();
      await Get.delete<OrderSellerController>();
      await Get.delete<ChatSellerController>();

      currentIndex = index;
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      SnackbarHelper.danger("Anda belum menyalakan lokasi!");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        SnackbarHelper.danger("Perizinan lokasi ditolak");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      SnackbarHelper.danger("Perizinan lokasi ditolak secara permanen, kami tidak bisa mengirim perizinan lokasi");
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
