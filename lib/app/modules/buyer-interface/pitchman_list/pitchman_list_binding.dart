import 'package:get/get.dart';

import 'pitchman_list_controller.dart';

class PitchmanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PitchmanListController>(
      () => PitchmanListController(),
    );
  }
}
