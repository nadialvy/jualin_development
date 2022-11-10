// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import 'help_buyer_controller.dart';

class HelpBuyerView extends GetView<HelpBuyerController> {
  const HelpBuyerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Bantuan'.text.color(colorBlack).bold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: colorBlack,
        ).onTap(
          () => Get.back(),
        ),
      ),
      body: VStack(
        [
          HStack([
            'Laporkan Masalah'.text.size(16).make(),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: colorNeutralLight,
              size: 20,
            ),
          ]).onTap(() => controller.goToReportProblemView()),
          HStack([
            'Pusat Bantuan'.text.size(16).make(),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: colorNeutralLight,
              size: 20,
            ),
          ]),
        ],
      ).p16(),
    );
  }
}
