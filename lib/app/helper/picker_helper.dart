// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '_index.dart';
import 'decorator_helper.dart';

mixin PickerHelper {
  // —————————————————————————————————————————————————————————————————————————
  // DATE PICKER (CUPERTINO) —————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void datePickerCupertino({
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Container(
          height: 270,
          decoration: DecoratorHelper.boxBottomSheetRadiusDecoration(),
          child: Column(
            children: [
              HStack([
                // 'Select Date'.text.size(16).bold.make(),
                Spacer(),
                CupertinoButton(
                  child: 'Apply'.text.make(),
                  onPressed: () {
                    callback.call(output);
                    Navigator.of(Get.context!).pop();
                  },
                ),
              ]).pSymmetric(h: 16, v: 2),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate ?? DateTime.now(),
                  minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                  // somehow must like this =,=
                  maximumDate: maxDate ?? DateTime(2050),
                  onDateTimeChanged: (val) => output = val,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void timePickerCupertino({
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => Container(
        height: 270,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: initialDate ?? DateTime.now(),
                minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                // somehow must like this =,=
                maximumDate: maxDate ?? DateTime(2050),
                onDateTimeChanged: (val) => output = val,

                use24hFormat: true,
              ),
            ),
            // Close the modal
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () {
                callback.call(output);
                Navigator.of(Get.context!).pop();
              },
            )
          ],
        ),
      ),
    );
  }

// —————————————————————————————————————————————————————————————————————————
// DATE PICKER (MATERIAL) ——————————————————————————————————————————————————
// —————————————————————————————————————————————————————————————————————————
  static Future<void> datePickerMaterial({
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
  }) async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: minDate ?? DateTime(2020),
      lastDate: maxDate ?? DateTime(2050),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }

  static Future<void> timePickerMaterial({
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(TimeOfDay) callback,
  }) async {
    final picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }

  // onController : final dataFile = (files as List<File>)[0].path; // example single
  static Future<void> imagePicker(
    Function(dynamic) files, {
    bool isMultiple = false,
    bool isCamera = false,
  }) async {
    try {
      // CAMERA
      if (isCamera) {
        await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50).then((value) {
          if (value != null) {
            final _file = value;
            files.call(_file);
          }
        });
      } else {
        // GALLERY
        if (Platform.isIOS) {
          await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
            if (value != null) {
              final _file = <File>[File(value.path)];
              files.call(_file);
            }
          });
        } else {
          await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
            if (value != null) {
              final _file = <File>[File(value.path)];
              files.call(_file);
            }
          });
        }
      }
    } catch (e) {
      logW('imagePicker : cant process on simulator');
      SnackbarHelper.warning('cant open camera on simulator');
    }
  }

  static Future<void> imagePickerWithCropper(Function(CroppedFile) files) async {
    BottomSheetHelper.bottomSheetContentDialog(
      // data: source,
      title: 'Tambah Gambar',
      childrenWidget: VStack(
        [
          Divider(),
          ListTile(
            leading: Icon(Icons.camera_alt_rounded),
            title: 'Ambil dari Kamera'.text.make(),
            contentPadding: EdgeInsets.all(4),
            onTap: () async {
              Get.back();
              try {
                await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50).then((imageFromCamera) {
                  if (imageFromCamera != null) {
                    final _file = File(imageFromCamera.path);
                    _cropperConfiguration(_file).then((fileCropped) {
                      files.call(fileCropped!);
                    });
                  }
                });
              } on Exception {
                logW('imagePicker : cant process on simulator');
                SnackbarHelper.warning('cant open camera on simulator');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: 'Pilih dari Galery'.text.make(),
            contentPadding: EdgeInsets.all(4),
            onTap: () async {
              Get.back();
              // IOS
              if (Platform.isIOS) {
                await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50).then((imageFromGallery) {
                  if (imageFromGallery != null) {
                    final _file = <File>[File(imageFromGallery.path)];
                    _cropperConfiguration(_file[0]).then((fileCropped) {
                      files.call(fileCropped!);
                    });
                  }
                }).catchError((error) {
                  logW('$error');
                });
              } else {
                // ANDROID
                await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
                  if (value != null) {
                    final _file = <File>[File(value.path)];
                    _cropperConfiguration(_file[0]).then((fileCropped) {
                      files.call(fileCropped!);
                    });
                  }
                }).catchError((error) {
                  logW('$error');
                });
              }
            },
          ),
        ],
      ),
    );
  }

  // onController : final dataFile = (files as List<File>)[0].path; // example single
  static Future<void> documentPicker(
    Function(dynamic) files, {
    bool isMultiple = false,
    List<String>? allowedExt = const ['pdf', 'doc', 'xls', 'ppt'],
  }) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: isMultiple,
      type: FileType.custom,
      allowedExtensions: allowedExt,
    );
    if (result != null) {
      final _files = result.paths.map((path) => File(path!)).toList();
      files.call(_files);
    }
  }

  static Future<void> datePickerAdaptive({
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
  }) async {
    if (Platform.isAndroid) {
      await datePickerMaterial(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      datePickerCupertino(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // # cropper ~
  // —————————————————————————————————————————————————————————————————————————————
  static Future<CroppedFile?> _cropperConfiguration(File imgFile) async {
    return ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9],
      uiSettings: [
        AndroidUiSettings(toolbarTitle: 'Sunting'),
        IOSUiSettings(title: 'Sunting'),
      ],
    );
  }
}
