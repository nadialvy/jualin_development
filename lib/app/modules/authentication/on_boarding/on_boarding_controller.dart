import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OnBoardingController extends GetxController {
  final userRole = ''.obs;

  @override
  void onInit() {
    userRole.value = Get.arguments['user_role'] ?? '';
    super.onInit();
  }

  void goToHome() async {
    await Get.delete<OnBoardingController>();
    Get.toNamed(Routes.HOME);
  }

  void goToLoginPage() {
    Get.toNamed(Routes.LOGIN, arguments: {'user_role': userRole.value});
  }

  void goToRegisterPage() {
    Get.toNamed(Routes.REGISTER, arguments: {'user_role': userRole.value});
  }
}
