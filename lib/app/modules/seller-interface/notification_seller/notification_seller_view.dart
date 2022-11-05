import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'notification_seller_controller.dart';

class NotificationSellerView extends GetView<NotificationSellerController> {
  const NotificationSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationSellerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotificationSellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
