import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'order_seller_controller.dart';

class OrderSellerView extends GetView<OrderSellerController> {
  const OrderSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderSellerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderSellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
