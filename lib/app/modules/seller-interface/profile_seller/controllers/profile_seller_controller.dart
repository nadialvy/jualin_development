import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';
import 'package:logger/logger.dart';

import '../../../../routes/app_pages.dart';

var logger = Logger();

class ProfileSellerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;
    logger.i(uid);

    try {
      yield* firestore.collection("user").doc(uid).snapshots();
    } catch (e) {
      SnackbarHelper.danger(e.toString());
    }
  }

  Future<void> logOut() async {
    ExLoading.show();
    try {
      await FirebaseAuth.instance.signOut();
      ExLoading.dismiss();
      await Get.offAllNamed(Routes.HOME);
    } catch (e) {
      // force logout
      ExLoading.dismiss();
      await Get.offAllNamed(Routes.HOME);
    }
  }
}
