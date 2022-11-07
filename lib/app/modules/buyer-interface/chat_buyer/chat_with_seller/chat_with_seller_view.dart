// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/core/resource/color.dart';
import 'package:jualin_flutter_3/app/helper/snackbar_helper.dart';

import 'chat_with_seller_controller.dart';

class ChatWithSellerView extends GetView<ChatWithSellerController> {
  const ChatWithSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        chatWithSeller('assets/images/ch_3.png', 'Bu Iif', 'Sipp makasih buu', '14:08', true),
        chatWithSeller('assets/images/ch_1.png', 'Mang Adit', 'Ditunggu ya...', '13:08', false),
        chatWithSeller('assets/images/ch_2.png', 'Pak Jamal', 'Yoi bang', 'Yesterday', true),
      ]),
    );
  }

  Widget chatWithSeller(String urlImage, String name, String chat, String time, bool read) {
    return HStack([
      Image.asset(
        urlImage,
        scale: 2.5,
      ),
      7.widthBox,
      VStack([
        name.text.size(14).bold.make(),
        5.heightBox,
        chat.text.size(12).make(),
      ]),
      Spacer(),
      VStack(
        [
          time.text.size(14).bold.make(),
          5.heightBox,
          read ? '✓✓'.text.size(14).color(colorPrimary).make() : '✓✓'.text.size(14).color(colorNeutralDark).make(),
        ],
        alignment: MainAxisAlignment.end,
        crossAlignment: CrossAxisAlignment.end,
      ),
    ]).pSymmetric(v: 10, h: 16).onTap(() => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('));
  }
}
