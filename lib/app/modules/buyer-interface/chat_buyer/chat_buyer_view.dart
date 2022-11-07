// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/core/resource/color.dart';
import 'package:jualin_flutter_3/app/widgets/ex_ui_error_or_empty.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chat_buyer_controller.dart';
import 'chat_with_seller/chat_with_seller_view.dart';
import 'chat_with_stall_owner/chat_with_stall_owner_view.dart';

class ChatBuyerView extends GetView<ChatBuyerController> {
  ChatBuyerView({Key? key}) : super(key: key);

  final tabList = [
    ChatWithSellerView(),
    ChatWithStallOwnerView(),
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
            preferredSize: Size.fromHeight(55),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                unselectedLabelColor: Colors.black.withOpacity(0.6),
                unselectedLabelStyle: TextStyle(fontSize: 13),
                indicatorColor: colorPrimary,
                labelColor: colorPrimary,
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
