// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);

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
