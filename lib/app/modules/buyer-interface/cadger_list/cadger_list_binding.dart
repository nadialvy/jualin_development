import 'package:get/get.dart';

import 'cadger_list_controller.dart';

class CadgerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CadgerListController>(
      () => CadgerListController(),
    );
  }
}
