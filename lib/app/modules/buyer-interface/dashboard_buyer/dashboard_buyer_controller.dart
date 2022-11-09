import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../routes/app_pages.dart';

var logger = Logger();

class DashboardBuyerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final tfSearch = TextEditingController();

  final rcDashboard = RefreshController();

  Future<void> onRefreshDashboard() async {
    streamUser();
    rcDashboard.refreshCompleted();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    Position position = await determinePosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    String address = "${placemarks[0].name} - ${placemarks[0].subLocality}";
    updatePosition(position, address);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("user").doc(uid).snapshots();
  }

  void goToProfilePage() => Get.toNamed(Routes.PROFILE_BUYER);
  void goToNotificationPage() => Get.toNamed(Routes.NOTIF_DASHBOARD);

  void goToPitchmanList() => Get.toNamed(Routes.PITCHMAN_LIST);

  void goToCadgerList() => Get.toNamed(Routes.CADGER_LIST);

  void goToMapSellerlocation() => Get.toNamed(Routes.MAPS_SELLER_LOCATION);

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

  Future<void> updatePosition(Position position, String address) async {
    String uid = auth.currentUser!.uid;

    try {
      await firestore.collection("user").doc(uid).update({
        "position": {"lat": position.latitude, "long": position.longitude},
        "address": address
      });
    } catch (e) {
      SnackbarHelper.danger(e.toString());
    }
  }
}
