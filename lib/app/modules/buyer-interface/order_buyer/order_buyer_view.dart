// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import 'order_buyer_controller.dart';

class OrderBuyerView extends GetView<OrderBuyerController> {
  const OrderBuyerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Saldo'.text.color(colorBlack).size(20).bold.make().pOnly(top: 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: VStack([
          buildContainer(wallet()),
          24.heightBox,
          'Pesanan Sekarang'.text.size(18).bold.make(),
          8.heightBox,
          buildContainer(buildCard()),
          24.heightBox,
          buildTitle('Riwayat Pesanan'),
          8.heightBox,
          buildContainer(buildCard()),
          8.heightBox,
          buildContainer(buildCard())
        ]).p16().scrollVertical(),
      ),
    );
  }

  Widget wallet() {
    return VStack([
      'Saldo E-Wallet'.text.color(colorBlack).bold.size(18).make(),
      16.heightBox,
      HStack([
        VStack([
          'LinkAja'.text.color(colorBlack).semiBold.size(16).make(),
          'Rp500'.text.color(colorNeutral).size(14).make(),
        ]).expand(),
        Chip(
          label: '+ Isi Ulang'.text.color(colorPrimaryDark).semiBold.make(),
          backgroundColor: Color(0xFFD9F3F2),
        ),
      ]),
      8.heightBox,
      HStack([
        VStack([
          'OVO'.text.color(colorBlack).semiBold.size(16).make(),
          '-'.text.color(colorNeutral).size(14).make(),
        ]).expand(),
        Chip(
          label: '+ Hubungkan'.text.color(colorPrimaryDark).semiBold.make(),
          backgroundColor: Color(0xFFD9F3F2),
        ),
      ])
    ]).p16();
  }

  Widget buildContainer(Widget children) {
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
        child: VStack([children]));
  }

  Widget buildCard() {
    return SizedBox(
      width: double.infinity,
      child: VStack([
        HStack([
          Image.asset(
            'assets/images/profpict1.png',
            scale: 2,
          ),
          7.widthBox,
          VStack([
            'Mang Ujang - Seblak Setan'.text.size(16).bold.make(),
            5.heightBox,
            'Seblak Angel, Seblak Setan Lv.1'.text.size(12).make(),
          ])
        ]),
        HStack([
          'Rp24.000'.text.color(colorBlack).bold.size(12).make().expand(),
          _getStatusChip(''),
        ])
      ]).pLTRB(16, 16, 16, 8),
    );
  }

  Widget buildTitle(String title) {
    return HStack(
      [
        title.text.size(18).bold.make(),
        'Lihat semua >'.text.size(12).color(colorNeutral.shade400).make(),
      ],
      alignment: MainAxisAlignment.spaceBetween,
      axisSize: MainAxisSize.max,
      crossAlignment: CrossAxisAlignment.center,
    );
  }

  Chip _getStatusChip(String status) {
    Color backgroundColor;
    String statusText;
    Color? statusTextColor;
    switch (status) {
      case 'canceled':
        backgroundColor = Color(0xFFFFDCDC);
        statusText = 'Gagal';
        statusTextColor = Color(0xFFEB373E);
        break;
      case 'waiting':
        backgroundColor = Color(0xFFFFF1C9);
        statusText = 'Menunggu Datang';
        statusTextColor = Color(0xFFF4B601);
        break;
      default:
        backgroundColor = Color(0xFFCBFFA2);
        statusText = 'Terbayar';
        statusTextColor = Color(0xFF119634);
        break;
    }
    return Chip(
      backgroundColor: backgroundColor,
      label: statusText.text.size(12).color(statusTextColor).bold.make(),
    );
  }
}
