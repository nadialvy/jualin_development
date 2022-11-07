import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../../../core/resource/color.dart';
import '../../../../helper/_index.dart';
import 'notif_dashboard_seller_controller.dart';

class NotifDashboardSellerView extends GetView<NotifDashboardSellerController> {
  const NotifDashboardSellerView({super.key});

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
        ),
      ),
      body: VStack([
        HStack(
          [
            'Baru'.text.size(16).bold.make(),
            const Spacer(),
            '3 menit yang lalu'.text.size(12).color(colorNeutral).make(),
          ],
        ),
        16.heightBox,
        notifCard('assets/images/ch_1.png', 'Jarjit SIngh - Memesan menu', true),
        notifCard('assets/images/ch_3.png', 'Bu Rina - Memanggilmu dan Memesan menu', true),
        notifCard('assets/images/ch_9.png', 'Pak Junet - Memesan meny', true),
        notifCard('assets/images/ch_2.png', 'Mang Adit - Memanggilmu ke tempat', true),
        18.heightBox,
        'Terbaca'.text.size(16).bold.make(),
        16.heightBox,
        notifCard('assets/images/ch_10.png', 'Mas Yuda - =Memesan menu', false), //kasih tanda kalau ini pesan siaran
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
                  ? 'Lihat Pesanan'.text.size(13).bold.color(colorPrimary).make().onTap(() => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('))
                  : 'Lihat Pesanan'.text.size(13).bold.color(colorNeutralDark).make().onTap(() => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;(')),
            ]).expand()
          ]).pSymmetric(v: 10, h: 10),
        ).pOnly(bottom: 10).expand(),
      ],
    );
  }
}
