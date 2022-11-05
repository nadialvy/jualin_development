import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../../helper/_index.dart';
// import '../../../../models/request/response/user_profile_entity.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final userRole = ''.obs;
  final tfFullName = TextEditingController();
  final tfEmailOrPhone = TextEditingController();
  final tfPin = TextEditingController();
  final tfConfirmPin = TextEditingController();

  final isFullNameValid = false.obs;
  final isEmailOrPhoneValid = false.obs;
  final isPinValid = false.obs;
  final isShowPinInfo = true.obs;
  final pinInfo = 'PIN harus berupa 6 digit angka'.obs;
  final isConfirmPinValid = false.obs;
  final isAllFormValid = false.obs;
  final dynamicLinkData = <String, String>{}.obs;

  // final _userProfileData = UserProfileData().obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    userRole.value = Get.arguments['user_role'] ?? '';
    super.onInit();

    everAll([isEmailOrPhoneValid, isFullNameValid, isPinValid, isConfirmPinValid], (callback) {
      isAllFormValid.value = isEmailOrPhoneValid.value && isFullNameValid.value && isPinValid.value && isConfirmPinValid.value;
    });
  }

  void goToLoginPage() {
    Get.toNamed(Routes.LOGIN, arguments: {'user_role': userRole.value});
  }

  void register(String email, password) async {
    debugPrint('masuk ini');
    debugPrint(email);
    debugPrint(password);
    if (isAllFormValid.value == false) {
      SnackbarHelper.danger('Mohon lengkapi data yang diperlukan');
      return;
    } else {
      try {
        await auth.createUserWithEmailAndPassword(email: email, password: password).then((response) {
          ExLoading.dismiss();
          _onRegisterSuccess(response);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ExLoading.dismiss();
          SnackbarHelper.danger('Password lemah');
        } else if (e.code == 'email-already-in-use') {
          ExLoading.dismiss();
          SnackbarHelper.danger('Email sudah digunakan, gunakan email lain!');
        } else if (e.code == 'operation-not-allowed') {
          ExLoading.dismiss();
          SnackbarHelper.danger('Ada masalah dengan server');
        }
      } catch (e) {
        SnackbarHelper.danger(e.toString());
      }
    }
  }

  void _onRegisterSuccess(UserCredential response) {
    debugPrint('--------------------------');
    debugPrint(response.credential?.providerId.toString());
    debugPrint(response.credential?.signInMethod);
    debugPrint(response.credential?.token.toString());
    debugPrint(response.additionalUserInfo?.username.toString());
    debugPrint(response.additionalUserInfo?.isNewUser.toString());
    debugPrint(response.additionalUserInfo?.isNewUser.toString());
    try {
      // direct ke OTP Page
      // Get.toNamed(
      //   Routes.OTP,
      //   parameters: {'id': id, 'credential': credential},
      //   arguments: dynamicLinkData,
      // );
    } on Exception catch (e) {
      SnackbarHelper.danger('$e');
    }
  }

  // void login() async {
  //   if(emailC.text.isNotEmpty && passC.text.isNotEmpty){
  //     try{
  //       UserCredential userCredential =
  //         await auth.signInWithEmailAndPassword(
  //           email: emailC.text,
  //           password: passC.text
  //         );
  //       print(userCredential);

  //       if(userCredential.user != null){
  //         if(userCredential.user!.emailVerified == true){
  //           Get.offAllNamed(Routes.HOME);
  //         }else {
  //           Get.defaultDialog(
  //             title: "Belum Terverifikasi",
  //             middleText: "Anda belum terverifikasi. Lakukan verifikasi di email yang terdaftar"
  //           );
  //         }
  //       }

  //     } on FirebaseAuthException catch(e){
  //       if(e.code == 'user-not-found'){
  //         Get.snackbar("Terjadi kesalahan", 'User tidak ditemukan');
  //       } else if (e.code == 'wrong-password'){
  //         Get.snackbar("Terjadi kesalahan", "Password salah");
  //       }
  //     } catch(e){
  //       Get.snackbar("Terjadi kesalahan", "Tidak dapat login");

  //     }
  //   }else {
  //     Get.snackbar("Terjadi kesalahan", "Email dan password harus diisi");
  //   }
  // }
}
