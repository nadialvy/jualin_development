import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/models/request/response/order_list_entity.dart';

import '../../../core/resource/color.dart';
import 'order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: 'List Pesanan'.text.bold.color(colorBlack).make(),
          leading: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ).onTap(() => Get.back()),
        ),
        body: GetBuilder<OrderListController>(
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
      child: VStack([
        HStack(
          [
            Image.asset(
              "assets/images/profpict1.png",
              scale: 2,
            ),
            7.widthBox,
            VStack([
              '${data.name}'.text.size(16).bold.make(),
              8.heightBox,
              '${data.orders!.length}x ${data.orders![0].name}'.text.size(14).make(),
              5.heightBox,
            ]).expand()
          ],
          crossAlignment: CrossAxisAlignment.start,
        ),
        3.heightBox,
        HStack(
          [
            'Rp${data.total?.toInt()}'.text.size(12).bold.make(),
            HStack(
              [
                Chip(
                  backgroundColor: const Color(0xFFD9F3F2),
                  label: '0.3 km'.text.size(12).color(const Color(0xFF1D4E89)).bold.make(),
                ),
                2.widthBox,
                _getStatusChip('cod'),
              ],
            ),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ]).p16(),
    ).pLTRB(16, 8, 16, 8);
  }

  Chip _getStatusChip(String status) {
    Color backgroundColor;
    String statusText;
    Color? statusTextColor;
    switch (status) {
      case 'closed':
        backgroundColor = const Color(0xFFFFDCDC);
        statusText = 'Gagal';
        statusTextColor = const Color(0xFFEB373E);
        break;
      case 'empty':
        backgroundColor = const Color(0xFFFFF1C9);
        statusText = 'Sedang dibuatkan';
        statusTextColor = const Color(0xFFF4B601);
        break;
      case 'cod':
        backgroundColor = const Color(0xFFF3F6FE);
        statusText = 'Bayar Langsung';
        statusTextColor = const Color(0xFF1D4E89);
        break;
      default:
        backgroundColor = const Color(0xFFCBFFA2);
        statusText = 'Terbayar';
        statusTextColor = const Color(0xFF119634);
        break;
    }
    return Chip(
      backgroundColor: backgroundColor,
      label: statusText.text.size(12).color(statusTextColor).bold.make(),
    );
  }
}
