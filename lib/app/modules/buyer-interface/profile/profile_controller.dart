import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("user").doc(uid).snapshots();
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
