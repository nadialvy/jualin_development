import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/models/request/response/list_seller_entity.dart';
import 'package:jualin_flutter_3/app/modules/buyer-interface/pitchman_list/pitchman_list_controller.dart';
import 'package:jualin_flutter_3/app/widgets/ex_ui_load_more.dart';
// import 'package:jualin_flutter_3/app/widgets/ex_ui_loading.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/resource/color.dart';

var logger = Logger();

class PitchmanListView extends GetView<PitchmanListController> {
  const PitchmanListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: 'List Pedagang Keliling'.text.bold.color(colorBlack).make(),
          leading: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ).onTap(() => Get.back()),
        ),
        body: Obx(
          () => VStack([
            Expanded(
                child: ListView.separated(
                        itemBuilder: (context, index) {
                          return buildCard(context, controller.listSeller[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: controller.listSeller.length)
                    .pSymmetric()),
          ]),
        ));
  }

  Widget buildCard(BuildContext context, ListSellerEntity data) {
    final dataUser = controller.listUser.where((e) => e.uid == data.uid).toList();
    final title = '${dataUser[0].fullName} - ${data.name}';
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
              title.text.size(16).bold.make(),
              8.heightBox,
              HStack([
                Image.asset(
                  'assets/images/ic_place.png',
                  scale: 2,
                ),
                4.widthBox,
                '0.79 Km dari posisi kamu'.text.size(14).make(),
              ]),
              5.heightBox,
            ]).expand()
          ],
          crossAlignment: CrossAxisAlignment.start,
        ),
        3.heightBox,
        HStack(
          [
            HStack([
              Icon(
                Icons.star,
                color: colorWarning.shade500,
              ),
              3.widthBox,
              '${data.products![0].rating}'.text.size(12).semiBold.make(),
            ]),
            HStack(
              [
                Chip(
                  backgroundColor: const Color(0xFFD9F3F2),
                  label: '${data.operationalHour?.open ?? '-'} - ${data.operationalHour?.close ?? '-'}'.text.size(12).color(const Color(0xFF1D4E89)).bold.make(),
                ),
                2.widthBox,
                _getStatusChip(''),
              ],
            ),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ]).p16(),
    ).pLTRB(16, 8, 16, 8).onTap(() => controller.goToDetailSeller(data, title));
  }

  Chip _getStatusChip(String status) {
    Color backgroundColor;
    String statusText;
    Color? statusTextColor;
    switch (status) {
      case 'closed':
        backgroundColor = const Color(0xFFFFDCDC);
        statusText = 'Tutup';
        statusTextColor = const Color(0xFFEB373E);
        break;
      case 'empty':
        backgroundColor = const Color(0xFFFFF1C9);
        statusText = 'Stok Habis';
        statusTextColor = const Color(0xFFF4B601);
        break;
      default:
        backgroundColor = const Color(0xFFCBFFA2);
        statusText = 'Buka';
        statusTextColor = const Color(0xFF119634);
        break;
    }
    return Chip(
      backgroundColor: backgroundColor,
      label: statusText.text.size(12).color(statusTextColor).bold.make(),
    );
  }
}
