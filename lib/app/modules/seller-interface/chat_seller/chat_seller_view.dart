import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'chat_seller_controller.dart';

class ChatSellerView extends GetView<ChatSellerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatSellerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChatSellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
