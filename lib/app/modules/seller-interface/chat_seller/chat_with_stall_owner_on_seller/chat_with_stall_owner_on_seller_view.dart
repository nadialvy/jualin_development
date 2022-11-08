import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/resource/color.dart';
import '../../../../helper/_index.dart';
import 'chat_with_stall_owner_on_seller_controller.dart';

class ChatWithStallOwnerOnSellerView extends GetView<ChatWithStallOwnerOnSellerController> {
  const ChatWithStallOwnerOnSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        chatWithStallOwner('assets/images/ch_4.png', 'Bu Dina', 'Sipp makasih buu', '12:08', false),
      ]),
    );
  }

  Widget chatWithStallOwner(String urlImage, String name, String chat, String time, bool read) {
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
      const Spacer(),
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
