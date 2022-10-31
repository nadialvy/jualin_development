// segala custom helper masukin kesini

// ignore_for_file: unnecessary_null_comparison

import 'package:get/get_utils/get_utils.dart';

mixin ValidatorHelper {
  static String? emailOrPhoneValidator(
    String? input, {
    Function? onInvalid,
    Function? onValid,
  }) {
    if (input != null && input.isNotEmpty) {
      // 'nomor HP harus diawali "08" dan minimal 10 digit dan maksimal 14 digit'
      if (input.isNumericOnly && (!input.startsWith('08') || input.length < 10 || input.length > 14)) {
        onInvalid?.call();
        return 'Format nomor HP tidak sesuai'.tr;
      }

      // 'jika text diawali dengan a-z | A-Z && Email tidak valid'
      if (!input.isNumericOnly && !input.isEmail) {
        onInvalid?.call();
        return 'Format email tidak sesuai'.tr;
      }
    }
    onValid?.call();
    return null;
  }

  static String? pinValidator(
    String? input, {
    Function? onInvalid,
    Function? onValid,
  }) {
    if (input!.isEmpty) {
      return null;
    }

    if (input != null && input.isNumericOnly && input.length < 6 || input.length > 6) {
      onInvalid?.call();
      return 'PIN harus terdiri dari 6 digit'.tr;
    }
    if (input != null && !input.isNumericOnly) {
      onInvalid?.call();
      return 'PIN harus berupa angka'.tr;
    }
    onValid?.call();
    return null;
  }

  static String? confirmPinValidator(
    String? input,
    String? confirm, {
    Function? onInvalid,
    Function? onValid,
  }) {
    if (input!.isEmpty && input == '') {
      onInvalid?.call();
      return 'Konfirmasi PIN tidak boleh kosong'.tr;
    }

    if (input != confirm && input.isNumericOnly) {
      onInvalid?.call();
      return 'PIN tidak sesuai, harap periksa kembali'.tr;
    }

    if (input.isNotEmpty && !input.isNumericOnly) {
      onInvalid?.call();
      return 'PIN harus berupa angka'.tr;
    }

    onValid?.call();
    return null;
  }

  static String? textMaxLength(
    String input,
    int max, {
    Function? onInvalid,
    Function? onValid,
  }) {
    if (input == null || input == '') {
      onInvalid?.call();
      return ''.tr;
    }

    if (input.length > max) {
      onInvalid?.call();
      return ''.tr;
    }

    onValid?.call();
    return null;
  }
}
