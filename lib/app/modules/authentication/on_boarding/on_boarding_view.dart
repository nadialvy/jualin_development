import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../../core/constants/type_user.dart';
import '../../../core/resource/color.dart';
import '../../../widgets/index.dart';
import 'on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_outlined,
          color: colorBlack,
        ).onTap(() {
          controller.goToHome();
        }),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: VStack(
          [
            Image.asset('assets/images/seller_onboarding.png'),
            20.heightBox,
            Obx(() => controller.userRole.value == UserType.BUYER
                ? VStack(
                    [
                      'Panggil Pedagang'.text.size(32).align(TextAlign.center).bold.make(),
                      9.heightBox,
                      'Panggil pedagang ke lokasimu secara mudah dan cepat'.text.align(TextAlign.center).make(),
                    ],
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                  )
                : VStack(
                    [
                      'Lacak Pelanggan'.text.size(32).align(TextAlign.center).bold.make(),
                      9.heightBox,
                      'Mudahkan jualan dan jangkau pelanggan lebih mudah'.text.align(TextAlign.center).make(),
                    ],
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                  )),
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ).pSymmetric(h: 40),
      bottomNavigationBar: HStack([
        TextButton(
          child: 'Masuk'.text.color(colorPrimary).bold.make(),
          onPressed: () => controller.goToLoginPage(),
        ).h(44).pOnly(bottom: 16),
        const Spacer(),
        ExButtonDefault(
          label: 'Daftar',
          width: 90,
          backgroundColor: colorPrimary,
          onPressed: () => controller.goToRegisterPage(),
        ).pOnly(bottom: 16),
      ]).p24(),
    );
  }
}
