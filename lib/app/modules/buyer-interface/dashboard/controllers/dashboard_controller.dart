// ignore_for_file: constant_identifier_names

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';
import 'package:logger/logger.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../chat/controllers/chat_controller.dart';
import '../../chat/views/chat_view.dart';
import '../../dashboard_2/controllers/dashboard_2_controller.dart';
import '../../dashboard_2/views/dashboard_2_view.dart';
import '../../order/controllers/order_controller.dart';
import '../../order/views/order_view.dart';
import '../../setting/controllers/setting_controller.dart';
import '../../setting/views/setting_view.dart';
import 'package:geolocator/geolocator.dart';

const MENU_DASHBOARD2 = 0;
const MENU_ORDER = 1;
const MENU_CHAT = 2;
const MENU_SETTING = 3;

var logger = Logger();

class DashboardController extends GetxController {
  // final userRole = ''.obs;

  final bottomNavigationController = PersistentTabController();
  final pageList = [
    const Dashboard2View(),
    const OrderView(),
    const ChatView(),
    const SettingView(),
  ];

  var currentIndex = MENU_DASHBOARD2;

  void onTabChange(index) async {
    if (index == MENU_DASHBOARD2 && currentIndex != MENU_DASHBOARD2) {
      Get.lazyPut<Dashboard2Controller>(() => Dashboard2Controller());
      Get.find<Dashboard2Controller>().onReady();

      final dashboard2Controller = Get.find<Dashboard2Controller>();
      Position position = await determinePosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      String address = "${placemarks[0].name} - ${placemarks[0].subLocality}";
      dashboard2Controller.updatePosition(position, address);

      await Get.delete<OrderController>();
      await Get.delete<ChatController>();
      await Get.delete<SettingController>();

      currentIndex = index;
    } else if (index == MENU_ORDER && currentIndex != MENU_ORDER) {
      Get.lazyPut<OrderController>(() => OrderController());
      Get.find<OrderController>().onInit();
      await Get.delete<Dashboard2Controller>();
      await Get.delete<ChatController>();
      await Get.delete<SettingController>();

      currentIndex = index;
    } else if (index == MENU_CHAT && currentIndex != MENU_CHAT) {
      Get.lazyPut<ChatController>(() => ChatController());
      Get.find<ChatController>().onInit();

      await Get.delete<Dashboard2Controller>();
      await Get.delete<OrderController>();
      await Get.delete<SettingController>();

      currentIndex = index;
    } else if (index == MENU_SETTING && currentIndex != MENU_SETTING) {
      Get.lazyPut<SettingController>(() => SettingController());
      Get.find<SettingController>().onInit();

      await Get.delete<Dashboard2Controller>();
      await Get.delete<OrderController>();
      await Get.delete<ChatController>();

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
