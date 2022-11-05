import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'order_seller_controller.dart';

class OrderSellerView extends GetView<OrderSellerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderSellerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderSellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
