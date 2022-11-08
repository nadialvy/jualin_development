// ignore_for_file: constant_identifier_names

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';
import 'package:logger/logger.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../chat_buyer/chat_buyer_controller.dart';
import '../chat_buyer/chat_buyer_view.dart';
import '../dashboard_buyer/dashboard_buyer_controller.dart';
import '../dashboard_buyer/dashboard_buyer_view.dart';
import '../order_buyer/order_buyer_controller.dart';
import '../order_buyer/order_buyer_view.dart';
import '../setting_buyer/setting_buyer_controller.dart';
import '../setting_buyer/setting_buyer_view.dart';
import 'package:geolocator/geolocator.dart';

const MENU_DASHBOARD_BUYER = 0;
const MENU_ORDER_BUYER = 1;
const MENU_CHAT_BUYER = 2;
const MENU_SETTING_BUYER = 3;

var logger = Logger();

class PersistentTabBuyerController extends GetxController {
  final bottomNavigationController = PersistentTabController();
  final pageList = [
    const DashboardBuyerView(),
    const OrderBuyerView(),
    ChatBuyerView(),
    const SettingBuyerView(),
  ];

  var currentIndex = MENU_DASHBOARD_BUYER;

  void onTabChange(index) async {
    if (index == MENU_DASHBOARD_BUYER && currentIndex != MENU_DASHBOARD_BUYER) {
      Get.put<DashboardBuyerController>(DashboardBuyerController());
      Get.find<DashboardBuyerController>().onReady();

      final dashboardBuyerController = Get.find<DashboardBuyerController>();
      Position position = await determinePosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      String address = "${placemarks[0].name} - ${placemarks[0].subLocality}";
      dashboardBuyerController.updatePosition(position, address);

      await Get.delete<OrderBuyerController>();
      await Get.delete<ChatBuyerController>();
      await Get.delete<SettingBuyerController>();

      currentIndex = index;
    } else if (index == MENU_ORDER_BUYER && currentIndex != MENU_ORDER_BUYER) {
      Get.lazyPut<OrderBuyerController>(() => OrderBuyerController());
      Get.find<OrderBuyerController>().onInit();
      await Get.delete<DashboardBuyerController>();
      await Get.delete<ChatBuyerController>();
      await Get.delete<SettingBuyerController>();

      currentIndex = index;
    } else if (index == MENU_CHAT_BUYER && currentIndex != MENU_CHAT_BUYER) {
      Get.lazyPut<ChatBuyerController>(() => ChatBuyerController());
      Get.find<ChatBuyerController>().onInit();

      await Get.delete<DashboardBuyerController>();
      await Get.delete<OrderBuyerController>();
      await Get.delete<SettingBuyerController>();

      currentIndex = index;
    } else if (index == MENU_SETTING_BUYER && currentIndex != MENU_SETTING_BUYER) {
      Get.lazyPut<SettingBuyerController>(() => SettingBuyerController());
      Get.find<SettingBuyerController>().onInit();

      await Get.delete<DashboardBuyerController>();
      await Get.delete<OrderBuyerController>();
      await Get.delete<ChatBuyerController>();

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
    return await Geolocator.getCurrentPosition();
  }
}
