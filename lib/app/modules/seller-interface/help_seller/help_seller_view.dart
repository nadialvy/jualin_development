import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'help_seller_controller.dart';

class HelpSellerView extends GetView<HelpSellerController> {
  const HelpSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpSellerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HelpSellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
