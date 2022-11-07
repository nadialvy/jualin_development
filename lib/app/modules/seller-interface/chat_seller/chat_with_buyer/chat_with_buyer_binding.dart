import 'package:get/get.dart';

import 'chat_with_buyer_controller.dart';

class ChatWithBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWithBuyerController>(
      () => ChatWithBuyerController(),
    );
  }
}
