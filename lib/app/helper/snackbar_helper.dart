// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../core/resource/color.dart';
import 'decorator_helper.dart';

mixin SnackbarHelper {
  static void neutral(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: colorWhite),
        12.widthBox,
        message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
      ]),
      backgroundColor: colorBlack,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void info(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorInfoDark),
        child: HStack([
          if (showIcon == true) Icon(Icons.info, color: colorInfoDark),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: colorInfoLight,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void danger(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorErrorDark),
        child: HStack([
          if (showIcon == true) Icon(Icons.info, color: colorErrorDark),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: colorErrorLight,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void success(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorSuccessDark),
        child: HStack([
          if (showIcon == true) Icon(Icons.check_circle, color: colorSuccessDark),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: colorSuccessLight,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void warning(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorWarningDark),
        child: HStack([
          if (showIcon == true) Icon(Icons.warning, color: colorWarningDark),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: colorWarningLight,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
