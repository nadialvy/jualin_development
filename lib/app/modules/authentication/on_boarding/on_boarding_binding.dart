import 'package:get/get.dart';

import '../../home/home_controller.dart';
import 'on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.lazyPut<OnBoardingController>(
      () => OnBoardingController(),
    );
  }
}
