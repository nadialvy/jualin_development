// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../core/resource/color.dart';
import '../routes/app_pages.dart';
import 'package:gredu_common/gredu_common.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///  <img width="200" alt="image" src="https://user-images.githubusercontent.com/36602270/169626607-f16c4fca-dce0-4095-b09c-c5ce915b649e.png">

class ExAvatarView extends StatelessWidget {
  const ExAvatarView({
    Key? key,
    required this.url,
    required this.userFullName,
    this.height = 70,
    this.width = 70,
    this.size,
    this.borderColor = colorWhite,
    this.borderWidth = 1,
    this.textSize = 14,
    this.textColor = colorWhite,
    this.bgColor = colorWhite,
    this.isAllowPreview = false,
    this.isWithShadow = true,
    this.isWhenErrorReplaceWithDefaultAvatar = true,
    this.onPressed,
  }) : super(key: key);

  final String url;
  final String? userFullName;
  final double? height;
  final double? width;
  final double? size;
  final Color borderColor;
  final double borderWidth;
  final double? textSize;
  final Color? textColor;
  final Color? bgColor;
  final bool? isAllowPreview;
  final bool? isWithShadow;
  final bool? isWhenErrorReplaceWithDefaultAvatar;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final header = {'Referer': 'https://mobile.gredu.co/*'};

    /// fix bug invalid url || null || blank
    if (url == null || url.isBlank! || !url.contains('https')) {
      return Container(
        width: size ?? width,
        height: size ?? height,
        decoration: isWithShadow == true
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(90)),
                boxShadow: [
                  BoxShadow(
                    color: colorNeutral[250]!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              )
            : BoxDecoration(),
        child: SvgPicture.asset('assets/images/ic_avatar.svg').onTap(() {
          if (onPressed != null) {
            onPressed?.call();
          }
        }),
      );
    } else {
      return Container(
        width: size ?? width,
        height: size ?? height,
        decoration: isWithShadow == true
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(90)),
                boxShadow: [
                  BoxShadow(
                    color: colorNeutral[150]!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              )
            : BoxDecoration(),
        child: url.contains('.svg')
            ? ClipOval(
                child: SvgPicture.network(
                  url,
                  height: height,
                  width: width,
                  color: bgColor,
                ),
              )
            : CircularProfileAvatar(
                url,
                httpHeaders: header,
                radius: 100,
                backgroundColor: bgColor!,
                borderWidth: borderWidth,
                initialsText: Text(
                  userFullName.initialName,
                  style: TextStyle(fontSize: textSize, color: Colors.white),
                ),
                borderColor: borderColor,
                elevation: 0.3,
                errorWidget: (context, url, error) {
                  return isWhenErrorReplaceWithDefaultAvatar == true ? SvgPicture.asset('assets/images/ic_avatar.svg') : 0.heightBox;
                },
                animateFromOldImageOnUrlChange: true,
                placeHolder: (context, url) => const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
                onTap: () {
                  if (isAllowPreview == true && url.contains('http')) {
                    Get.toNamed(Routes.IMAGE_PREVIEW, arguments: url);
                  }

                  if (onPressed != null) {
                    onPressed?.call();
                  }
                },
              ),
      );
    }
  }
}
