// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/networking/http_downloader.dart';
import '../../../helper/snackbar_helper.dart';

class ImagePreviewController extends BaseController {
  final url = ''.obs;
  final fileName = ''.obs;
  final header = {'Referer': 'https://mobile.gredu.co/*'};

  @override
  void onInit() {
    if (Get.arguments == null) {
      ExAlert.error(
        title: 'Terjadi Kesalahan',
        message: 'url tidak valid',
        onYes: () => Get.close(2),
      );
    } else {
      if (Get.arguments is String) {
        url.value = '${Get.arguments}?${DateTime.now().millisecondsSinceEpoch.toString()}';
      } else if (Get.arguments is Map) {
        final dataUrl = Get.arguments['url'];
        url.value = '$dataUrl?${DateTime.now().millisecondsSinceEpoch.toString()}';
      }
      logW('imagePreview URL : $url');
      fileName.value = url.split('/').last;
    }
    super.onInit();
  }

  Future<void> shareImage() async {
    try {
      final response = await http.get(Uri.parse(url.value), headers: {'Referer': "${FlutterConfig.get('IMAGE_REFERER')}"});
      final bytes = response.bodyBytes;
      final temp = await getTemporaryDirectory();
      final path = '${temp.path}/image.jpg';
      File(path).writeAsBytesSync(bytes);
      await Share.shareFiles([path], text: '');
    } catch (e) {
      SnackbarHelper.danger('Gagal membagikan Newsletter');
    }
  }

  Future<void> downloadImage() async {
    ExLoading.show();
    try {
      await HttpDownloader.images(
        url: url.value,
        header: {},
        onSuccess: () {
          ExLoading.dismiss();
          ExAlert.success(
            title: 'Berhasil',
            message: 'Download selesai.',
            svgAssetDir: 'assets/images/ic_dialog_download.svg',
            onYes: () => Get.back(),
          );
        },
        onError: () {
          ExLoading.dismiss();
          ExAlert.error(
            message: 'Download bermasalah',
            btnYesText: 'Coba Lagi',
            onYes: () => Get.back(),
          );
        },
      );
    } catch (e) {
      ExLoading.dismiss();
      ExAlert.error(
        message: 'Download bermasalah',
        btnYesText: 'Coba Lagi',
        onYes: () => Get.back(),
      );
    }
  }
}
