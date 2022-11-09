import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/resource/color.dart';
import 'notif_dashboard_controller.dart';

class NotifDashboardView extends GetView<NotifDashboardController> {
  const NotifDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Notifikasi'.text.bold.color(colorBlack).size(20).make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: colorBlack,
        ).onTap(() => Get.back()),
      ),
      body: VStack([
        HStack(
          [
            'Baru'.text.size(16).bold.make(),
            const Spacer(),
            '23 menit yang lalu'.text.size(12).color(colorNeutral).make(),
          ],
        ),
        16.heightBox,
        notifCard('assets/images/ch_7.png', 'Mang Adit - Seblak Setan ada di 500m dari posisi kamu nih! Beli kuy!!', true),
        notifCard('assets/images/ch_8.png', 'Pak Yono - Tukang Semir Sepatu ada di 500m dari posisi kamu', true),
        18.heightBox,
        'Terbaca'.text.size(16).bold.make(),
        16.heightBox,
        notifCard('assets/images/ch_9.png', 'Pak Jandi - Tukang Sayur ada di 500m dari posisi kamu, Gass Beli!!!', false),
        notifCard('assets/images/ch_7.png', 'Mang Adit - Seblak Setan ada di 500m dari posisi kamu', false),
        notifCard('assets/images/ch_10.png', 'Mas Yuda - Martabak Telor Special - Stock Habis ;((', false), //kasih tanda kalau ini pesan siaran
      ]).p(16),
    );
  }

  Widget notifCard(String image, String content, bool isNew) {
    return HStack(
      [
        Container(
          decoration: BoxDecoration(
            color: isNew ? colorPrimary.shade100 : colorNeutralLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: HStack([
            Image.asset(
              image,
              scale: 2,
            ),
            7.widthBox,
            VStack([
              content.text.size(14).make(),
              5.heightBox,
              isNew
                  ? 'Panggil Penjual ke Tempat Saya'.text.size(13).bold.color(colorPrimary).make().onTap(() => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('))
                  : 'Panggil Penjual ke Tempat Saya'.text.size(13).bold.color(colorNeutralDark).make().onTap(() => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;(')),
            ]).expand()
          ]).pSymmetric(v: 10, h: 10),
        ).pOnly(bottom: 10).expand(),
      ],
    );
  }
}
