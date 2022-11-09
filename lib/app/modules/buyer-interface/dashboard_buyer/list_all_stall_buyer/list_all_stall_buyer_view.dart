import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/core/resource/color.dart';
import 'package:velocity_x/velocity_x.dart';

import 'list_all_stall_buyer_controller.dart';

class ListAllStallBuyerView extends GetView<ListAllStallBuyerController> {
  const ListAllStallBuyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Lapak'.text.bold.size(18).color(colorBlack).make(),
        leading: const Icon(Icons.arrow_back, color: colorBlack).onTap(() => Get.back()),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: VStack([
        buildCardLapak('Lapak Komersil', 'Rp1.000.000/bulan', 'Jl. Pasar Minggu Kota Suka Jalan', 'assets/images/lapak_image.png'),
        buildCardLapak('Lapak Jualan', 'Rp750.000/bulan', 'Jl. Pasar Senen Kota Suka Kamu', 'assets/images/lapak_2.jpeg'),
        buildCardLapak('Disewakan Lapak', 'Rp1.000.000/bulan', 'Jl. Gunung Bromo Kencana Wangi Kota Suka Suka', 'assets/images/lapak_3.jpg'),
        buildCardLapak('Lapak Murah Jakarta Selatan', 'Rp500.000/bulan', 'Jl. Ahmad Yani Kota Bawah Sendiri', 'assets/images/lapak_4.jpg'),
        buildCardLapak('Lapak Jualan', 'Rp800.000/bulan', 'Jl. Pasar Minggu Kota Suka Jalan', 'assets/images/lapak_5.jpg'),
        buildCardLapak('Lapak Komersil', 'Rp1.000.000/bulan', 'Jl. Pasar Minggu Kota Suka Jalan', 'assets/images/lapak_image.png'),
        buildCardLapak('Lapak Jualan', 'Rp750.000/bulan', 'Jl. Pasar Senen Kota Suka Kamu', 'assets/images/lapak_2.jpeg'),
        buildCardLapak('Disewakan Lapak', 'Rp1.000.000/bulan', 'Jl. Gunung Bromo Kencana Wangi Kota Suka Suka', 'assets/images/lapak_3.jpg'),
        buildCardLapak('Lapak Murah Jakarta Selatan', 'Rp500.000/bulan', 'Jl. Ahmad Yani Kota Bawah Sendiri', 'assets/images/lapak_4.jpg'),
        buildCardLapak('Lapak Jualan', 'Rp800.000/bulan', 'Jl. Pasar Minggu Kota Suka Jalan', 'assets/images/lapak_5.jpg'),
      ]).scrollVertical(),
    );
  }

  Widget buildCardLapak(String name, String price, String address, String image) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: HStack([
        Container(
          width: 84,
          height: 68,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        10.widthBox,
        Expanded(
          child: VStack([
            name.text.size(16).bold.make(),
            HStack(
              [
                Image.asset(
                  'assets/images/ic_place.png',
                  scale: 1.7,
                ),
                5.widthBox,
                address.text.color(colorBlack).maxLines(2).size(14).ellipsis.make().expand(),
              ],
              alignment: MainAxisAlignment.start,
              crossAlignment: CrossAxisAlignment.start,
            ),
            price.text.color(colorPrimary).bold.size(14).make()
          ]),
        ),
      ]).pSymmetric(h: 10),
    ).pOnly(right: 16, left: 16, bottom: 16);
  }
}
