import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/resource/color.dart';
import 'ex_button_outline.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_error
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="156" alt="image" src="https://user-images.githubusercontent.com/36602270/169626815-4a6e631d-4ac6-4430-b2eb-5538ae12ac80.png">

class ExUiErrorOrEmpty extends StatelessWidget {
  const ExUiErrorOrEmpty({
    Key? key,
    this.message,
    this.callback,
    this.title = '',
    this.bgColor,
    this.textColor,
    this.btnText,
    this.svgAssets,
    this.showBtnRetry = false,
    this.textSize = 14,
    this.imageHeight,
    this.imageWidth,
  }) : super(key: key);

  final String? message;
  final String? title;
  final double? textSize;
  final String? btnText;
  final bool? showBtnRetry;
  final Color? bgColor;
  final Color? textColor;
  final Function? callback;
  final String? svgAssets;
  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        color: bgColor ?? Colors.transparent,
        child: VStack(
          [
            if (svgAssets != null)
              SvgPicture.asset(
                '$svgAssets',
                width: imageWidth,
                height: imageHeight,
              ).centered()
            else
              SvgPicture.asset(
                'assets/images/ic_dialog_error2.svg',
                width: imageWidth,
                height: imageHeight,
              ).centered(),
            if (!title.isEmptyOrNull) '$title'.text.size(16).bold.color(colorBlack).center.makeCentered().pSymmetric(v: 12).pOnly(top: 12),
            if (!message.isEmptyOrNull) '$message'.text.size(textSize).color(textColor ?? colorNeutral).align(TextAlign.center).makeCentered(),
            if (showBtnRetry == true)
              ExButtonOutline(
                label: btnText ?? 'Reload',
                labelColor: textColor ?? Colors.black,
                onPressed: () => callback?.call() ?? () {},
              ).centered().pSymmetric(v: 12),
          ],
        ).centered(),
      ),
    );
  }
}
