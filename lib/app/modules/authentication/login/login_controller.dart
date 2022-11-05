import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../../core/constants/type_user.dart';
import '../../../helper/snackbar_helper.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final tfEmailOrPhone = TextEditingController();
  final tfPin = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  final isEmailOrPhoneValid = false.obs;
  final isPasswordValid = false.obs;
  final isAllFormValid = false.obs;
  final dynamicLinkData = <String, String>{}.obs;
  final userRole = ''.obs;

  @override
  void onInit() {
    everAll([isEmailOrPhoneValid, isPasswordValid], (callback) {
      isAllFormValid.value = isEmailOrPhoneValid.value && isPasswordValid.value;
    });

    super.onInit();
    userRole.value = Get.arguments['user_role'] ?? '';
  }

  Future<void> login() async {
    try {
      //login with number
      if (tfEmailOrPhone.text.contains('08')) {
        ExLoading.show();
        SnackbarHelper.info('Oops! Fitur login dengan nomor hp masih dalam tahap pengembangan, kamu bisa menggunakan email untuk login');
      } else {
        ExLoading.show();
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: tfEmailOrPhone.text, password: tfPin.text);

        if (userCredential.user != null) {
          ExLoading.show();
          if (userCredential.user!.emailVerified == true && userRole.value == UserType.BUYER) {
            Get.offAllNamed(Routes.PERSISTENT_TAB_BUYER);
          } else if (userCredential.user!.emailVerified == true && userRole.value == UserType.SELLER) {
            Get.offAllNamed(Routes.PERSISTENT_TAB_SELLER);
          } else {
            ExLoading.show();
            ExAlert.confirm(
              title: 'Belum Terverifikasi',
              message: 'Email yang anda gunakan belum terverifikasi',
              btnYesText: 'Verifikasi Email',
              onYes: () => goVerifEmail(userCredential),
              btnNoText: 'Kembali',
            );
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ExLoading.dismiss();
        SnackbarHelper.danger('User tidak ditemukan, masukkan alamat email dengan benar');
      } else if (e.code == 'wrong-password') {
        ExLoading.dismiss();
        SnackbarHelper.danger('Password yang anda masukkan salah');
      }
    } catch (e) {
      ExLoading.dismiss();
      SnackbarHelper.danger('Terjadi Kesalahan, ${e.toString()}');
    }
  }

  Future<void> goVerifEmail(UserCredential userCredential) async {
    try {} catch (e) {
      await userCredential.user!.sendEmailVerification();
      Get.back();
      SnackbarHelper.info('Email verifikasi sudah terkirim, cek pada bagian spam apabila verifikasi tidak muncul');
      ExLoading.dismiss();
      // ignore: dead_code_catch_following_catch
    } catch (e) {
      ExLoading.dismiss();
      SnackbarHelper.danger('Terjadi kesalahan: ${e.toString()}');
    }
  }

  void goToRegisterPage() {
    userRole.value = Get.arguments['user_role'] ?? '';
    Get.toNamed(Routes.REGISTER, arguments: {'user_role': userRole.value});
  }
}
