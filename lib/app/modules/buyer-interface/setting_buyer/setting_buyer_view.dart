// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import '../../../helper/_index.dart';
import 'setting_buyer_controller.dart';

class SettingBuyerView extends GetView<SettingBuyerController> {
  const SettingBuyerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Pengaturan'.text.color(colorBlack).size(20).bold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: VStack([
        'Fitur Lainnya'.text.bold.size(16).make().pOnly(bottom: 10),
        buildAnotherFeature().pSymmetric(h: 16),
        'Sistem'.text.bold.size(16).make().pOnly(bottom: 10),
        buildSystem().pSymmetric(h: 16),
      ]).pOnly(bottom: 16, right: 16, left: 16),
    );
  }

  Widget buildAnotherFeature() {
    return VStack([
      HStack([
        ImageIcon(
          AssetImage('assets/images/ic_switch_role.png'),
          size: 20,
          color: colorPrimary,
        ),
        10.widthBox,
        'Pindah Role'.text.size(16).make()
      ])
          .onTap(
            () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
          )
          .pOnly(bottom: 10),
      HStack([
        ImageIcon(
          AssetImage('assets/images/ic_lapak.png'),
          size: 20,
          color: colorPrimary,
        ),
        10.widthBox,
        'Sewakan Lapak'.text.size(16).make()
      ])
          .onTap(
            () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
          )
          .pOnly(bottom: 20),
    ]);
  }

  Widget buildSystem() {
    return VStack([
      HStack([
        ImageIcon(
          AssetImage('assets/images/ic_notification.png'),
          size: 20,
          color: colorPrimary,
        ),
        10.widthBox,
        'Notifikasi'.text.size(16).make().onTap(() => controller.goToNotificationPage())
      ]).pOnly(bottom: 10),
      HStack([
        ImageIcon(
          AssetImage('assets/images/ic_lock.png'),
          size: 22,
          color: colorPrimary,
        ),
        10.widthBox,
        'Privasi'.text.size(16).make()
      ])
          .onTap(
            () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
          )
          .pOnly(bottom: 10),
      HStack([
        ImageIcon(
          AssetImage('assets/images/ic_help.png'),
          size: 20,
          color: colorPrimary,
        ),
        10.widthBox,
        'Bantuan'.text.size(16).make()
      ])
          .onTap(
            () => controller.goToHelpPage(),
          )
          .pOnly(bottom: 10),
      HStack([
        ImageIcon(
          AssetImage('assets/images/ic_info.png'),
          size: 20,
          color: colorPrimary,
        ),
        10.widthBox,
        'Tentang'.text.size(16).make()
      ])
          .onTap(
            () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
          )
          .pOnly(bottom: 10),
    ]);
  }
}
