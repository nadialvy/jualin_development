import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/core/base/base_controller.dart';

import '../../../routes/app_pages.dart';

class OnBoardingController extends BaseController {
  final userRole = ''.obs;

  @override
  void onInit() {
    userRole.value = Get.arguments['user_role'] ?? '';
    super.onInit();
  }

  void goToHome() {
    Get.delete<OnBoardingController>();
    Get.toNamed(Routes.HOME);
  }

  void goToLoginPage() {
    Get.toNamed(Routes.LOGIN, arguments: {'user_role': userRole.value});
  }

  void goToRegisterPage() {
    Get.toNamed(Routes.REGISTER, arguments: {'user_role': userRole.value});
  }
}
