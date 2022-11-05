import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:logger/logger.dart';

import '../../../../core/resource/color.dart';
import '../../../../helper/snackbar_helper.dart';
import '../../../../widgets/ex_button_default.dart';
import '../../../../widgets/ex_ui_error_or_empty.dart';
import '../../../../widgets/ex_ui_loading.dart';
import '../controllers/profile_seller_controller.dart';

var logger = Logger();

class ProfileSellerView extends GetView<ProfileSellerController> {
  const ProfileSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: 'Profil'.text.bold.color(colorBlack).make(),
        leading: const Icon(
          Icons.arrow_back,
          color: colorBlack,
        ).onTap(() => Get.back()),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ExUiLoading();
          }
          if (snapshot.hasData) {
            Map<String, dynamic> userData = snapshot.data!.data()!;
            logger.i(userData);
            return VStack(
              [
                VStack(
                  [
                    Image.asset(
                      'assets/images/profile_picture_buyer.png',
                      scale: 2,
                    ),
                    8.heightBox,
                    'Unggah Poto'.text.color(colorPrimary).size(14).bold.make().onTap(() => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;(')),
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.center,
                ).centered(),
                const Divider().pSymmetric(v: 20),
                'Informasi Profil'.text.size(16).bold.make(),
                15.heightBox,
                sectionProfile('Nama', '${userData["full_name"]}'),
                'Kontak'.text.size(16).bold.make(),
                15.heightBox,
                sectionProfile('Email', '${userData["email"]}'),
                sectionProfile('Nomor HP', userData["phone_number"] == "" ? "-" : "${userData["phone_number"]}"),
                15.heightBox,
                'Keamanan'.text.size(16).bold.make(),
                15.heightBox,
                sectionProfile('PIN', '******'),
                80.heightBox,
              ],
            ).p16().scrollVertical();
          }

          return const ExUiErrorOrEmpty();
        }),
      ),
      bottomSheet: ExButtonDefault(
        width: double.infinity,
        radius: 12,
        label: 'Keluar',
        labelColor: colorWhite,
        backgroundColor: colorError,
        onPressed: () => {
          ExAlert.confirm(
            showAsset: false,
            title: 'Keluar Akun?',
            message: 'Kamu dapat mengakses akunmu kembali dari halaman login.',
            btnYesText: 'Keluar',
            btnNoText: 'Batal',
            onYes: () => controller.logOut(),
          ),
        },
      ).p24(),
    );
  }

  Widget sectionProfile(String title, String content) {
    return VStack([
      title.text.size(14).color(colorNeutral).make(),
      6.heightBox,
      HStack([
        content.text.size(16).color(colorBlack).fontWeight(FontWeight.w600).make(),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: colorNeutralLight,
          size: 20,
        ),
      ]),
      const Divider().pSymmetric(v: 15),
    ]);
  }
}
