import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import '../../../widgets/index.dart';
import 'dashboard_seller_controller.dart';

class DashboardSellerView extends GetView<DashboardSellerController> {
  const DashboardSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ExUiLoading();
          }
          if (snapshot.hasData) {
            Map<String, dynamic> userData = snapshot.data!.data()!;
            return SafeArea(
              child: VStack(
                [
                  HStack([
                    VStack([
                      'Hai, ${userData["full_name"]}'.text.color(colorBlack).size(20).bold.make(),
                      HStack([
                        Image.asset(
                          'assets/images/ic_place.png',
                          scale: 2,
                        ),
                        5.widthBox,
                        userData["address"] != null
                            ? "${userData["address"]}".text.color(colorBlack).maxLines(1).size(12).ellipsis.make()
                            : "Anda belum mengaktifkan lokasi".text.color(colorErrorDark).maxLines(1).size(12).ellipsis.make(),
                      ])
                    ]),
                    const Spacer(),
                    HStack([
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: colorPrimary,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: colorPrimary,
                        ),
                        onPressed: () => {},
                      ),
                    ])
                  ]),
                  10.heightBox,
                  buildSearchBox(),
                  19.heightBox,
                  buildTitle('Daftar Panggilan'),
                  12.heightBox,
                  buildContainer([
                    buildCard(),
                    12.heightBox,
                    buildCard(),
                    12.heightBox,
                    buildCard(),
                  ]),
                  19.heightBox,
                  buildTitle('Pesanan'),
                  12.heightBox,
                  buildContainer([
                    buildCard(),
                    12.heightBox,
                    buildCard(),
                    12.heightBox,
                    buildCard(),
                  ]),
                  19.heightBox,
                  buildTitle('Lokasi Pembeli Sekitar'),
                  16.heightBox,
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorNeutral,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  19.heightBox,
                  buildTitle('Lapak Tersedia'),
                  16.heightBox,
                  HStack([
                    buildCardLapak(),
                    buildCardLapak(),
                    buildCardLapak(),
                    buildCardLapak(),
                    buildCardLapak(),
                  ]).scrollHorizontal(),
                  20.heightBox
                ],
              ),
            ).pSymmetric(h: 16).scrollVertical();
          }
          return const ExUiErrorOrEmpty();
        }),
      ),
    );
  }

  HStack buildSearchBox() {
    return HStack([
      ExTextFieldIcon(
        tfController: controller.tfSearch,
        prefixIcon: Icons.search,
        hint: 'Cari',
        fillColor: colorWhite,
      ).expand(),
    ]);
  }

  Widget buildTitle(String title) {
    return HStack(
      [
        title.text.size(16).bold.make(),
        'Lihat semua >'.text.size(12).color(colorNeutral.shade400).make(),
      ],
      alignment: MainAxisAlignment.spaceBetween,
      axisSize: MainAxisSize.max,
      crossAlignment: CrossAxisAlignment.center,
    );
  }

  Widget buildContainer(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorNeutral.shade100,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: VStack(children).p16(),
    );
  }

  Widget buildCard() {
    return SizedBox(
      width: double.infinity,
      child: HStack([
        Image.asset(
          'assets/images/profpict1.png',
          scale: 2,
        ),
        7.widthBox,
        Expanded(
          child: VStack([
            HStack([
              'Nadia Anjay'.text.size(14).bold.make(),
              const Spacer(),
              '2 mnt'.text.size(12).bold.make(),
            ]),
            5.heightBox,
            HStack([
              Image.asset(
                'assets/images/ic_place.png',
                scale: 2,
              ),
              5.widthBox,
              '0.1 Km dari posisi kamu'.text.size(12).make(),
            ])
          ]),
        )
      ]),
    );
  }

  Widget buildCardLapak() {
    return SizedBox(
      width: 160,
      height: 220,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(image: AssetImage('assets/images/lapak_image.png'), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: VStack(
                [
                  'Lapak Komersil'.text.color(colorBlack).size(14).maxLines(1).ellipsis.bold.make(),
                  2.heightBox,
                  'Rp200.000/bulan'.text.color(colorPrimary).size(12).maxLines(1).ellipsis.bold.make(),
                  7.heightBox,
                  HStack(
                    [
                      Image.asset(
                        'assets/images/ic_place.png',
                        scale: 2.7,
                      ),
                      5.widthBox,
                      Expanded(child: 'Jl. Danau Ranau X, Sawojajar, Malang hAHAHAH'.text.color(colorBlack).maxLines(2).size(10).ellipsis.make()),
                    ],
                    alignment: MainAxisAlignment.start,
                    crossAlignment: CrossAxisAlignment.start,
                  )
                ],
                crossAlignment: CrossAxisAlignment.start,
              ).pSymmetric(h: 5, v: 5),
            ),
          ],
        ),
      ).pOnly(right: 10),
    );
  }
}
