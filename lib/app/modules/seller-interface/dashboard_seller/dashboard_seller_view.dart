import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
      body: SmartRefresher(
        enablePullUp: true,
        controller: controller.rcDashboard,
        // onRefresh: () => controller.onRefreshDashboard(),
        footer: CustomFooter(
          builder: (context, mode) {
            return const SizedBox.shrink();
          },
        ),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
                          onPressed: () => controller.goToNotifPage(),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.person,
                            color: colorPrimary,
                          ),
                          onPressed: () => {controller.goToProfilePage()},
                        ),
                      ])
                    ]),
                    10.heightBox,
                    buildSearchBox(),
                    19.heightBox,
                    buildTitle('Daftar Panggilan').onTap(() => controller.goToCallList()),
                    12.heightBox,
                    buildContainer([
                      buildCard('assets/images/profpict1.png', 'Rando', '2 mnt', '0.35 Km dari posisi kamu'),
                      12.heightBox,
                      buildCard('assets/images/ch_2.png', 'Nero', '9 mnt', '1 Km dari posisi kamu'),
                      12.heightBox,
                      buildCard('assets/images/ch_3.png', 'Meisya', '14 mnt', '2.1 Km dari posisi kamu'),
                    ]),
                    19.heightBox,
                    buildTitle('Pesanan').onTap(() => controller.goToOrderList()),
                    12.heightBox,
                    buildContainer([
                      buildCard('assets/images/ch_4.png', 'Ifa', '2 mnt', '0.1 Km dari posisi kamu'),
                      12.heightBox,
                      buildCard('assets/images/ch_5.png', 'Ricco', '6 mnt', '0.6 Km dari posisi kamu'),
                      12.heightBox,
                      buildCard('assets/images/ch_6.png', 'Nando', '10 mnt', '1 Km dari posisi kamu'),
                      12.heightBox,
                      // buildCard(),
                      // 12.heightBox,
                      // buildCard(),
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
                        image: const DecorationImage(
                          image: AssetImage('assets/images/dummy_map.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    19.heightBox,
                    buildTitle('Lapak Tersedia').onTap(() => controller.goToAllStall()),
                    16.heightBox,
                    HStack([
                      buildCardLapak('Lapak Komersil', 'Rp1.000.000/bulan', 'Jl. Pasar Minggu Kota Suka Jalan', 'assets/images/lapak_image.png'),
                      buildCardLapak('Lapak Jualan', 'Rp750.000/bulan', 'Jl. Pasar Senen Kota Suka Kamu', 'assets/images/lapak_2.jpeg'),
                      buildCardLapak('Disewakan Lapak', 'Rp1.000.000/bulan', 'Jl. Gunung Bromo Kencana Wangi Kota Suka Suka', 'assets/images/lapak_3.jpg'),
                      buildCardLapak('Lapak Murah Jakarta Selatan', 'Rp500.000/bulan', 'Jl. Ahmad Yani Kota Bawah Sendiri', 'assets/images/lapak_4.jpg'),
                      buildCardLapak('Lapak Jualan', 'Rp800.000/bulan', 'Jl. Pasar Minggu Kota Suka Jalan', 'assets/images/lapak_5.jpg'),
                    ]).scrollHorizontal(),
                  ],
                ),
              ).pSymmetric(h: 16).scrollVertical();
            }
            return const ExUiErrorOrEmpty();
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

  Widget buildCard(String image, String name, String time, String position) {
    return SizedBox(
      width: double.infinity,
      child: HStack([
        Image.asset(
          image,
          scale: 2,
        ),
        7.widthBox,
        Expanded(
          child: VStack([
            HStack([
              name.text.size(14).bold.make(),
              const Spacer(),
              time.text.size(12).bold.make(),
            ]),
            5.heightBox,
            HStack([
              Image.asset(
                'assets/images/ic_place.png',
                scale: 2,
              ),
              5.widthBox,
              position.text.size(12).make(),
            ])
          ]),
        )
      ]),
    );
  }

  Widget buildCardLapak(String name, String address, String price, String image) {
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: VStack(
                [
                  name.text.color(colorBlack).size(14).maxLines(1).ellipsis.bold.make(),
                  2.heightBox,
                  address.text.color(colorPrimary).size(12).maxLines(1).ellipsis.bold.make(),
                  7.heightBox,
                  HStack(
                    [
                      Image.asset(
                        'assets/images/ic_place.png',
                        scale: 2.7,
                      ),
                      5.widthBox,
                      Expanded(child: price.text.color(colorBlack).maxLines(2).size(10).ellipsis.make()),
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
