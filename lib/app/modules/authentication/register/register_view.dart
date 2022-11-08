// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import '../../../helper/_index.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/index.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ''.text.extraBold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: colorBlack),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Get.offAllNamed(Routes.ON_BOARDING, arguments: {'user_role': controller.userRole.value}),
        ),
      ),
      body: VStack([
        'Daftar'.text.extraBold.headline6(context).make(),
        8.heightBox,
        'Buat akun menggunakan alamat email.'.text.make(),
        24.heightBox,
        buildFormInput(),
        16.heightBox,
        ExDivider(label: 'atau').paddingSymmetric(vertical: 16),
        // Obx(() => controller.tfEmailOrPhone.isBlank ? '-' : '${controller.tfEmailOrPhone}'),
        24.heightBox,
        buildSSO(),
        40.heightBox,
        SizedBox(
          width: double.infinity,
          child: TextButton(
            child: Text.rich(
              TextSpan(
                text: 'Sudah memiliki akun?',
                style: TextStyle(fontWeight: FontWeight.normal, color: colorBlack),
                children: const [
                  TextSpan(text: ' Masuk ', style: TextStyle(fontWeight: FontWeight.bold, color: colorPrimary)),
                ],
              ),
            ),
            onPressed: () => controller.goToLoginPage(),
          ),
        ),
      ]).p16().scrollVertical(),
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
        onPressed: () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
      ).pSymmetric(v: 6),
      if (Platform.isIOS)
        ExButtonOutline(
          label: 'Masuk dengan Apple',
          labelColor: colorNeutral,
          leftIcon: SvgPicture.asset('assets/images/ic_apple.svg'),
          width: double.infinity,
          onPressed: () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
        ).pSymmetric(v: 6),
    ]);
  }

  VStack buildFormInput() {
    return VStack([
      ExTextFieldNormal(
        tfController: controller.tfFullName,
        hint: 'Nama Lengkap',
        onChanged: (fullName) => controller.isFullNameValid.value = !(fullName == null || fullName == ''),
        validator: (fullname) {
          if (fullname == null || fullname == '') {
            return 'Nama Lengkap tidak boleh kosong';
          }
          return null;
        },
      ),
      12.heightBox,
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
        hint: 'Buat PIN',
        obscureText: true,
        isPassword: true,
        textInputType: TextInputType.number,
        maxLength: 6,
        counterText: '',
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp('[ ]')),
        ],
        validator: (pin) => ValidatorHelper.pinValidator(pin),
        onChanged: (pin) {
          controller.isShowPinInfo.value = pin.isEmpty;
          ValidatorHelper.pinValidator(
            pin,
            onInvalid: () => controller.isPinValid.value = false,
            onValid: () => controller.isPinValid.value = true,
          );
        },
      ),
      Obx(
        () => controller.isShowPinInfo.value ? '${controller.pinInfo}'.text.color(colorNeutral[300]!).make().pOnly(left: 2, top: 8) : 0.heightBox,
      ),
      16.heightBox,
      ExTextFieldNormal(
        tfController: controller.tfConfirmPin,
        hint: 'Konfirmasi PIN',
        obscureText: true,
        isPassword: true,
        textInputType: TextInputType.number,
        maxLength: 6,
        counterText: '',
        validator: (pin) => ValidatorHelper.confirmPinValidator(pin, controller.tfPin.value.text),
        onChanged: (pin) => ValidatorHelper.confirmPinValidator(
          pin,
          controller.tfPin.value.text,
          onInvalid: () => controller.isConfirmPinValid.value = false,
          onValid: () => controller.isConfirmPinValid.value = true,
        ),
      ),
      24.heightBox,
      Obx(
        () => ExButtonDefault(
          label: 'Daftar',
          width: double.infinity,
          isEnable: controller.isAllFormValid.value,
          onPressed: () => SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;('),
        ),
      ),
    ]);
  }
}
