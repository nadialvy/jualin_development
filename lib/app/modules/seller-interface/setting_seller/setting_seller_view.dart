import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'setting_seller_controller.dart';

class SettingSellerView extends GetView<SettingSellerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingSellerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingSellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
