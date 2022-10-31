// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../resource/color.dart';

/// ****************************************************************************
/// [DOCUMENTATION_PLEASE_DO_NOT_DELETE_ME]
/// ****************************************************************************
/// fitur yang tersedia:
/// - [HttpDownloader.images] => download and save image to Gallery.
///   required parameter => { url, onSuccess, onError }
///
/// - [HttpDownloader.files] => download and save file to temp.
///   required parameter => { url, onProgress, onSuccess, onError }
///

class HttpDownloader extends GetxService {
  HttpDownloader._();

  static CancelToken? _cancelToken;
  static final _progress = 0.obs;

  static Future<void> images({
    required String url,
    required Map<String, String> header,
    required Function onSuccess,
    required Function onError,
  }) async {
    final fileName = url.substring(url.lastIndexOf('/') + 1);
    final permission = await Permission.storage.request();
    try {
      if (permission.isGranted) {
        final response = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            headers: header,
          ),
        );
        final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data), quality: 100, name: fileName);
        logW(result);
        if (result.toString().contains('true')) {
          onSuccess.call();
        } else {
          onError.call();
        }
      }
    } catch (e) {
      onError.call();
    }
  }

  static Future<void> files({
    required String url,
    required Map<String, String> header,
    required Function(String)? onProgress,
    required Function(String)? onSuccess,
    required Function(Exception)? onError,
    String? filename,
    Function? onStart,
    Function? onExit,
    bool usePrefix = true,
    String method = 'GET',
    Map<String, dynamic> params = const {},
  }) async {
    final dio = Dio();
    _cancelToken = CancelToken();
    final permission = await Permission.storage.request();

    try {
      if (permission.isGranted) {
        final downloadFileName = filename ?? url.substring(url.lastIndexOf('/') + 1);
        Directory? dir;
        if (Platform.isAndroid) {
          dir = Directory('/storage/emulated/0/Download/');
        } else {
          dir = await getApplicationDocumentsDirectory();
        }
        final filePath = usePrefix ? '${dir.path}/gredu_file_$downloadFileName' : '${dir.path}/$downloadFileName';

        final options = Options(method: method, headers: header);

        if (onStart != null) {
          await onStart();
        }

        await dio.download(
          url,
          filePath,
          options: options,
          queryParameters: params,
          onReceiveProgress: (received, total) {
            if (total != -1 && onProgress != null) {
              final progress = (received / total * 100).toStringAsFixed(0);
              _progress.value = progress.toInt() ?? 0;
              onProgress(progress);
            }
          },
          cancelToken: _cancelToken,
        );

        if (onSuccess != null) {
          await onSuccess(filePath);
        }
      }
    } catch (e) {
      if (onError != null && !_cancelToken!.isCancelled) {
        await onError(Exception(e.toString()));
      }
    }

    if (onExit != null) {
      await onExit();
    }
  }

  static void cancel() {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken!.cancel();
    }
  }

  static void showDownloadProgress({
    String title = '',
  }) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          scrollable: true,
          content: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              24.heightBox,
              Obx(
                () => Directionality(
                  textDirection: TextDirection.ltr,
                  child: MediaQuery(
                    data: const MediaQueryData(),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colorPrimary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: _progress.value,
                                child: Container(
                                  width: 200,
                                  height: 17,
                                  color: colorPrimary,
                                ).cornerRadius(20),
                              ),
                              Expanded(
                                flex: 100 - _progress.value,
                                child: Container(
                                  color: colorPrimary[50],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // 24.heightBox,
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                cancel();
                Get.back();
              },
              child: Text(
                'Batalkan',
                style: TextStyle(color: Colors.black),
              ),
            ).pOnly(bottom: 12).h(55).wFull(Get.context!)
          ],
        );
      },
    );
  }
}
