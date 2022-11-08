import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../routes/app_pages.dart';

var logger = Logger();

class DashboardSellerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final tfSearch = TextEditingController();

  final rcDashboard = RefreshController();

  Future<void> onRefreshDashboard() async {
    streamUser();
    rcDashboard.refreshCompleted();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("user").doc(uid).snapshots();
  }

  void goToProfilePage() {
    logger.i('go to profile page');
    Get.toNamed(Routes.PROFILE_SELLER);
  }

  void goToNotifPage() {

    logger.i('go to notifs');
    Get.toNamed(Routes.NOTIF_DASHBOARD_SELLER);
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
