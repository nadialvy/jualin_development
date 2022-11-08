import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:logger/logger.dart';

import '../../../helper/snackbar_helper.dart';
import '../../../routes/app_pages.dart';

var logger = Logger();

class LoginController extends GetxController {
  final tfEmailOrPhone = TextEditingController();
  final tfPin = TextEditingController();

  final isEmailOrPhoneValid = false.obs;
  final isPasswordValid = false.obs;
  final isAllFormValid = false.obs;
  final dynamicLinkData = <String, String>{}.obs;
  final userRole = ''.obs;
  final userOriginalRole = ''.obs;
  List allUsers = [].obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        SnackbarHelper.info('Oops! Fitur ini masih dalam tahap pengembangan ;(');
      } else {
        ExLoading.show();
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: tfEmailOrPhone.text, password: tfPin.text);

        if (userCredential.user != null) {
          ExLoading.show();

          String uid = auth.currentUser!.uid;
          await FirebaseFirestore.instance.collection("user").doc(uid).get().then((value) {
            userOriginalRole.value = value.data()!["role"];
          });

          if (userCredential.user!.emailVerified == true) {
            if (userRole.value == "buyer" && userOriginalRole.value == "buyer") {
              Get.offAllNamed(Routes.PERSISTENT_TAB_BUYER);
            } else if (userRole.value == "seller" && userOriginalRole.value == "seller") {
              Get.offAllNamed(Routes.PERSISTENT_TAB_SELLER);
            } else {
              ExLoading.dismiss();
              ExAlert.error(
                title: 'Akun Tidak Terdaftar!',
                message: userRole.value == "buyer" ? 'Akun email yang anda gunakan tidak terdaftar sebagai pembeli' : 'Akun email yang anda gunakan tidak terdaftar sebagai pedagang',
                onYes: () {
                  ExLoading.dismiss();
                  Get.back();
                },
              );
            }
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
