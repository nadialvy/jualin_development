import 'package:get/get.dart';

import 'chat_with_stall_owner_on_seller_controller.dart';

class ChatWithStallOwnerOnSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWithStallOwnerOnSellerController>(
      () => ChatWithStallOwnerOnSellerController(),
    );
  }
}
