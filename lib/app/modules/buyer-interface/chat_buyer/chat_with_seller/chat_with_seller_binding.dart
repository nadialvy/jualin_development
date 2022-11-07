import 'package:get/get.dart';

import 'chat_with_seller_controller.dart';

class ChatWithSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWithSellerController>(
      () => ChatWithSellerController(),
    );
  }
}
