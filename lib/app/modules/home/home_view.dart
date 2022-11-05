// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/resource/color.dart';
import '../../widgets/index.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: VStack(
          [
            Image.asset('assets/images/choose_rule.png'),
            'Pilih Role'.text.color(colorBlack).size(32).bold.make(),
            9.heightBox,
            'Pilih role sebagai pembeli atau pedagang'.text.align(TextAlign.center).size(16).color(colorBlack).make(),
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.center,
        ).pOnly(bottom: 60),
      ).pSymmetric(h: 50),
      bottomSheet: VStack([
        ExButtonDefault(
          label: 'Sebagai Pembeli',
          isLabelBold: true,
          width: double.infinity,
          radius: 12,
          backgroundColor: colorPrimary,
          onPressed: () => controller.onBoardingAsABuyer(),
        ),
        9.heightBox,
        ExButtonOutline(
          label: 'Sebagai Pedagang',
          labelColor: colorPrimary,
          borderColor: colorPrimary,
          radius: 12,
          isLabelBold: true,
          width: double.infinity,
          onPressed: () => controller.onBoardingAsASeller(),
        ),
      ]).p32(),
    );
  }
}
