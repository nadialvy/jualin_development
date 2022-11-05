// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'order_buyer_controller.dart';

class OrderBuyerView extends GetView<OrderBuyerController> {
  const OrderBuyerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
