// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resource/color.dart';
import '../../../widgets/ex_image_no_cache_view.dart';
import '../../../widgets/loading_animation/loading_animation_widget.dart';
import 'image_preview_controller.dart';

class ImagePreviewView extends GetView<ImagePreviewController> {
  const ImagePreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: colorWhite),
        leading: Icon(Icons.arrow_back_rounded, color: Colors.white).onInkTap(() => Get.back()),
        actions: [
          IconButton(
            onPressed: () => controller.downloadImage(),
            icon: Icon(Icons.file_download, color: colorWhite),
          ).marginOnly(right: 12),
          IconButton(
            onPressed: () => controller.shareImage(),
            icon: Icon(Icons.more_vert, color: colorWhite),
          ).marginOnly(right: 4),
        ],
      ),
      backgroundColor: Colors.black,
      body: Obx(
        () => Center(child: imageWidget()),
      ),
    );
  }

  Widget imageWidget() {
    try {
      return PhotoView(
        enableRotation: true,
        loadingBuilder: (c, i) => LoadingAnimationWidget.discreteCircle(color: colorWhite, size: 24).centered(),
        imageProvider: NetworkImage(controller.url.value, headers: controller.header),
        errorBuilder: (c, _, __) => ExImageNoCacheView(controller.url.value, controller.header),
      ).wh(double.infinity, 300);
    } on Exception catch (_) {
      return ExImageNoCacheView(controller.url.value, controller.header);
    }
  }
}
