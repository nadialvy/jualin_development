import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/modules/buyer-interface/detail_seller/detail_seller_controller.dart';
import 'package:jualin_flutter_3/app/widgets/index.dart';
import 'package:logger/logger.dart';

import '../../../core/resource/color.dart';

var logger = Logger();

class DetailSellerView extends GetView<DetailSellerController> {
  const DetailSellerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 40, 39, 39),
        elevation: 0,
        shadowColor: Colors.transparent,
        title: '${controller.title}'.text.bold.maxLines(3).overflow(TextOverflow.ellipsis).color(colorBlack).make(),
        leading: const Icon(
          Icons.arrow_back,
          color: colorBlack,
        ).onTap(() => Get.back()),
      ),
      body: GetBuilder<DetailSellerController>(
        builder: (controller) => SafeArea(
            child: VStack(
          [
            SizedBox(
              width: 400,
              height: 400,
              child: Image.asset(
                "assets/images/profpict1.png",
                fit: BoxFit.fill,
              ),
            ).centered(),
            8.heightBox,
            const ExButtonDefault(
              leftIcon: Icon(Icons.map_rounded),
              label: 'Lacak Lokasi Penjual',
              radius: 12,
            ).wFull(context).centered(),
            VStack([
              'Deskripsi'.text.size(18).bold.make(),
              2.heightBox,
              '${controller.dataSeller.value.description}'.text.size(14).make(),
            ]).pSymmetric(v: 16),
            'Detail'.text.size(18).bold.make(),
            VStack([
              HStack([
                const Icon(
                  Icons.route,
                  size: 30,
                  color: Color(0xFF1D4E89),
                ),
                6.widthBox,
                VStack(
                  [
                    'Rute'.text.size(14).color(const Color(0xFF1D4E89)).make(),
                    'Sawojajar - Belimbing'.text.size(14).make(),
                  ],
                )
              ])
            ]).pOnly(top: 2),
            VStack([
              HStack([
                const Icon(
                  Icons.timelapse,
                  size: 30,
                  color: Color(0xFF1D4E89),
                ),
                6.widthBox,
                VStack(
                  [
                    'Jam Buka'.text.size(14).color(const Color(0xFF1D4E89)).make(),
                    '${controller.dataSeller.value.operationalHour?.open} - ${controller.dataSeller.value.operationalHour?.close}'.text.size(14).make(),
                  ],
                )
              ])
            ]).pOnly(top: 16),
            VStack([
              HStack([
                const Icon(
                  Icons.star,
                  size: 30,
                  color: Color(0xFF1D4E89),
                ),
                6.widthBox,
                VStack(
                  [
                    'Ulasan'.text.size(14).color(const Color(0xFF1D4E89)).make(),
                    '${controller.dataSeller.value.products?[0].rating}  (${controller.dataSeller.value.reviews?.length} Ulasan)'.text.size(14).make(),
                  ],
                )
              ])
            ]).pOnly(top: 16),
          ],
          alignment: MainAxisAlignment.center,
        )).pSymmetric(h: 16).scrollVertical(),
      ),
      bottomNavigationBar: HStack(
        [
          ExButtonOutline(
            label: 'Lihat Produk',
            isLabelBold: true,
            labelColor: colorBlack,
            onPressed: () {},
          ).expand(),
          16.widthBox,
          ExButtonDefault(
            label: 'Panggil ke Tempat Saya',
            labelSize: 12,
            onPressed: () {},
          ).expand(),
        ],
        alignment: MainAxisAlignment.spaceBetween,
      ).p16(),
    );
  }
}
