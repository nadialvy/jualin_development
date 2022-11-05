import 'package:get/get.dart';

import 'chat_seller_controller.dart';

class ChatSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatSellerController>(
      () => ChatSellerController(),
    );
  }
}
