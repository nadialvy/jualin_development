import 'package:get/get.dart';

import 'chat_with_stall_owner_controller.dart';

class ChatWithStallOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWithStallOwnerController>(
      () => ChatWithStallOwnerController(),
    );
  }
}
