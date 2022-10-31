// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../routes/app_pages.dart';
import 'loading_animation/loading_animation_widget.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///  <img width="200" alt="image" src="https://user-images.githubusercontent.com/36602270/169626607-f16c4fca-dce0-4095-b09c-c5ce915b649e.png">

class ExImageViewCached extends StatelessWidget {
  const ExImageViewCached({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.size,
    this.borderColor,
    this.borderWidth,
    this.radius = 8,
    this.boxFit = BoxFit.cover,
    this.isAllowPreview = false,
    this.errorIcon = Icons.image,
    this.canRemove = false,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final double? size;
  final Color? borderColor;
  final double? borderWidth;
  final double radius;
  final BoxFit boxFit;
  final bool? isAllowPreview;
  final IconData? errorIcon;
  final bool? canRemove;

  @override
  Widget build(BuildContext context) {
    final header = {'Referer': 'https://mobile.gredu.co/*'};

    return ZStack(
      [
        Container(
          width: size ?? width,
          height: size ?? height,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.grey[300]!, width: borderWidth ?? 0.0),
          ),
          child: url.isUrl!
              ? CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  width: size ?? width,
                  height: size ?? height,
                  httpHeaders: header,
                  placeholder: (context, url) => LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ).centered(),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(errorIcon),
                  ),
                )
              : Container(color: Colors.grey[300], child: Icon(errorIcon)),
        ).cornerRadius(radius),
      ],
    ).onTap(() {
      if (url.isUrl!) {
        if (isAllowPreview == true && url.contains('http')) {
          Get.toNamed(Routes.IMAGE_PREVIEW, arguments: url);
        }
      }
    });
  }
}
