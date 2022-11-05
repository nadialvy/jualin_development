import 'package:get/get.dart';

import 'chat_buyer_controller.dart';

class ChatBuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatBuyerController>(
      () => ChatBuyerController(),
    );
  }
}
