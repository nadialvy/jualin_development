// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/core/constants/type_user.dart';

import '../../../core/resource/color.dart';
import '../../../helper/_index.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/index.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ''.text.extraBold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colorBlack),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => Get.offAllNamed(Routes.ON_BOARDING, arguments: {'user_role': controller.userRole.value}),
        ),
      ),
      body: SafeArea(
        child: VStack([
          32.heightBox,
          controller.userRole.value == UserType.BUYER
              ? 'Masuk ke Akunmu Sebagai Pembeli'.text.extraBold.headline6(context).make()
              : 'Masuk ke Akunmu Sebagai Pedagang'.text.extraBold.headline6(context).make(),
          12.heightBox,
          'Pilih cara termudah untuk mengakses akun, baik secara manual maupun dengan akun Google  atau, Daftar Sekarang jika belum memiliki akun!'.text.color(colorNeutral).make(),
          12.heightBox,
          buildSSO(),
          ExDivider(label: 'atau').paddingSymmetric(vertical: 16),
          24.heightBox,
          buildFormInput(),
        ]).p16().scrollVertical(),
      ),
    );
  }

  VStack buildSSO() {
    return VStack([
      ExButtonOutline(
        label: 'Masuk dengan Google',
        labelColor: colorBlack,
        isLabelBold: true,
        leftIcon: SvgPicture.asset('assets/images/ic_google.svg'),
        width: double.infinity,
        onPressed: () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan, kamu bisa mencoba fitur lain'),
      ).pSymmetric(v: 6),
      if (Platform.isIOS)
        ExButtonOutline(
          label: 'Masuk dengan Apple',
          labelColor: colorNeutral,
          leftIcon: SvgPicture.asset('assets/images/ic_apple.svg'),
          width: double.infinity,
          onPressed: () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan, kamu bisa mencoba fitur lain'),
        ).pSymmetric(v: 6),
    ]);
  }

  Widget buildFormInput() {
    return VStack([
      ExTextFieldNormal(
        tfController: controller.tfEmailOrPhone,
        hint: 'Email',
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp('[ ]')),
        ],
        validator: (mailOrPhone) => ValidatorHelper.emailOrPhoneValidator(mailOrPhone),
        onChanged: (mailOrPhone) => ValidatorHelper.emailOrPhoneValidator(
          mailOrPhone,
          onInvalid: () => controller.isEmailOrPhoneValid.value = false,
          onValid: () => controller.isEmailOrPhoneValid.value = true,
        ),
      ),
      12.heightBox,
      ExTextFieldNormal(
        tfController: controller.tfPin,
        hint: 'PIN',
        obscureText: true,
        isPassword: true,
        textInputType: TextInputType.number,
        maxLength: 6,
        counterText: '',
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp('[ ]')),
        ],
        validator: (pin) => ValidatorHelper.pinValidator(pin),
        onChanged: (pin) => ValidatorHelper.pinValidator(
          pin,
          onInvalid: () => controller.isPasswordValid.value = false,
          onValid: () => controller.isPasswordValid.value = true,
        ),
      ),
      16.heightBox,
      Obx(
        () => ExButtonDefault(label: 'Masuk', width: double.infinity, isEnable: controller.isAllFormValid.value, onPressed: () => controller.login()),
      ),
      16.heightBox,
      TextButton(
        child: 'Lupa PIN'.text.extraBold.color(colorPrimary).makeCentered(),
        onPressed: () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan, kamu bisa menggunakan fitur lain'),
      ),
      8.heightBox,
      Text.rich(
        TextSpan(
          text: 'Belum memiliki akun?',
          style: TextStyle(fontWeight: FontWeight.normal, color: colorBlack),
          children: const [
            TextSpan(text: ' Daftar Sekarang ', style: TextStyle(fontWeight: FontWeight.bold, color: colorPrimary)),
          ],
        ),
      ).p12().centered().onInkTap(() => controller.goToRegisterPage()),
      32.heightBox,
    ]);
  }
}
