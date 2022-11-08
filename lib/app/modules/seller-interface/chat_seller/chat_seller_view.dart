import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/chat_seller/chat_with_buyer/chat_with_buyer_view.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/chat_seller/chat_with_stall_owner_on_seller/chat_with_stall_owner_on_seller_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import '../../../widgets/index.dart';
import 'chat_seller_controller.dart';

class ChatSellerView extends GetView<ChatSellerController> {
  ChatSellerView({super.key});

  final tabList = [
    const ChatWithBuyerView(),
    const ChatWithStallOwnerOnSellerView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: 'Pesan'.text.size(20).bold.color(colorBlack).make(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                unselectedLabelColor: Colors.black.withOpacity(0.6),
                unselectedLabelStyle: const TextStyle(fontSize: 13),
                indicatorColor: colorPrimary,
                labelColor: colorPrimary,
                isScrollable: true,
                labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(child: Text('Penjual Kelling')),
                  Tab(child: Text('Pemilik Lapak')),
                ],
              ),
            ),
          ),
        ),
        body: controller.obx((state) => TabBarView(children: tabList),
            onError: (e) => ExUiErrorOrEmpty(
                  message: 'Gagal memuat kontent',
                  showBtnRetry: true,
                  callback: () => controller.onInit(),
                )),
      ),
    );
  }
}
