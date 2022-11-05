import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../core/constants/type_user.dart';
import '../../routes/app_pages.dart';
class HomeController extends GetxController {
  final userRole = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _user;

  void onBoardingAsABuyer() {
    ExLoading.show();
    userRole.value = UserType.BUYER;
    Get.toNamed(Routes.ON_BOARDING, arguments: {'user_role': userRole.value});
  }

  void onBoardingAsASeller() {
    ExLoading.show();
    userRole.value = UserType.SELLER;
    Get.toNamed(Routes.ON_BOARDING, arguments: {'user_role': userRole.value});
  }

  void onready() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges()); //keep tracking what user do, ex: login, logout, etc
    ever(_user, _initialScreen); // listening any changes all the time
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Get.toNamed(Routes.HOME));
    } else {
      Get.offAll(() => Get.toNamed(Routes.DASHBOARD));
    }
  }
}
