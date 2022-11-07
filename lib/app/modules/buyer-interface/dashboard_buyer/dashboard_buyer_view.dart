// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/resource/color.dart';
import '../../../widgets/index.dart';
import 'dashboard_buyer_controller.dart';

class DashboardBuyerView extends GetView<DashboardBuyerController> {
  const DashboardBuyerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: SmartRefresher(
        enablePullUp: true,
        controller: controller.rcDashboard,
        onRefresh: () => controller.onRefreshDashboard(),
        footer: CustomFooter(
          builder: (context, mode) {
            return const SizedBox.shrink();
          },
        ),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ExUiLoading();
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
                      Spacer(),
                      HStack([
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: colorPrimary,
                          ),
                          onPressed: () => controller.goToNotificationPage(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            color: colorPrimary,
                          ),
                          onPressed: () => controller.goToProfilePage(),
                        ),
                      ])
                    ]),
                    10.heightBox,
                    buildSearchBox(),
                    19.heightBox,
                    buildTitle('Pedagang Keliling'),
                    12.heightBox,
                    buildContainer([
                      buildCard(),
                      12.heightBox,
                      buildCard(),
                      12.heightBox,
                      buildCard(),
                    ]),
                    19.heightBox,
                    buildTitle('Pedagang Kaki Lima'),
                    12.heightBox,
                    buildContainer([
                      buildCard(),
                      12.heightBox,
                      buildCard(),
                      12.heightBox,
                      buildCard(),
                    ]),
                    19.heightBox,
                    buildTitle('Lokasi Pedagang Keliling'),
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
            return ExUiErrorOrEmpty();
          }),
        ),
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
        VStack([
          'Mang Ujang - Seblak Setan'.text.size(14).bold.make(),
          5.heightBox,
          HStack([
            Image.asset(
              'assets/images/ic_place.png',
              scale: 2,
            ),
            5.widthBox,
            '0.1 Km dari posisi kamu'.text.size(12).make(),
          ])
        ])
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
              decoration: BoxDecoration(
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
