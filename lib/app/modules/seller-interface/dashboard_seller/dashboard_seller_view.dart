import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'dashboard_seller_controller.dart';

class DashboardSellerView extends GetView<DashboardSellerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halloww'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'yeye',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
