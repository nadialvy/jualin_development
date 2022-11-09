import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/models/request/response/order_list_entity.dart';
import 'package:jualin_flutter_3/app/modules/seller-interface/call_list/call_list_controller.dart';

import '../../../core/resource/color.dart';

class CallListView extends GetView<CallListController> {
  const CallListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: 'List Panggilan'.text.bold.color(colorBlack).make(),
          leading: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ).onTap(() => Get.back()),
        ),
        body: GetBuilder<CallListController>(
          builder: (controller) => VStack([
            Expanded(
                child: ListView.separated(
                        itemBuilder: (context, index) {
                          return buildCard(context, controller.orderList[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: controller.orderList.length)
                    .pSymmetric()),
          ]),
        ));
  }

  Widget buildCard(BuildContext context, OrderListEntity data) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorNeutral.shade100,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: HStack(
        [
          Image.asset(
            "assets/images/profpict1.png",
            scale: 2,
          ),
          7.widthBox,
          VStack([
            '${data.name}'.text.size(16).bold.make(),
            8.heightBox,
            HStack([
              Image.asset(
                'assets/images/ic_place.png',
                scale: 2,
              ),
              4.widthBox,
              '0.79 Km dari posisi kamu'.text.size(12).maxLines(2).overflow(TextOverflow.ellipsis).make(),
            ]),
            5.heightBox,
          ]).expand(),
          3.heightBox,
          _getStatusChip('0.1 m lalu'),
        ],
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
        crossAlignment: CrossAxisAlignment.center,
      ).p16(),
    ).pLTRB(16, 8, 16, 8);
  }

  Chip _getStatusChip(String status) {
    return Chip(
      backgroundColor: const Color(0xFFD9F3F2),
      label: status.text.size(12).color(const Color(0xFF1D4E89)).bold.make(),
    );
  }
}
