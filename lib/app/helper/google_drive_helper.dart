// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:gredu_belajar/app/core/networking/http_downloader.dart';
// import 'package:gredu_belajar/app/core/resource/_index.dart';
// import 'package:gredu_belajar/app/extension/index.dart';
// import 'package:gredu_belajar/app/helper/_index.dart';
// import 'package:gredu_belajar/app/widgets/index.dart';
// import 'package:gredu_common/gredu_common.dart';
// import 'package:mime/mime.dart';

// import '../widgets/loading_animation/loading_animation_widget.dart';

// mixin GoogleDriveHelper {
//   static final cprogress = '0'.obs;

//   static Future<void> authenticationGoogle({
//     required BuildContext context,
//     required Function callbackConnectToGoogle,
//   }) async {
//     return showDialog(
//       context: Get.context!,
//       barrierDismissible: true,
//       // barrierColor: barrierColor,
//       builder: (context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           content: Container(
//             child: VStack([
//               Container(
//                 decoration: BoxDecoration(
//                   color: colorNeutral[50],
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
//                 ),
//                 child: 'Autentikasi ke Google Drive'.text.bold.make().p(20),
//               ).wFull(context),
//               VStack([
//                 'Agar dapat membagikan lampiran apa pun ke anggota kelas langsung dari Google Drive, serta menyimpan dokumen dari Daftar Belajar ke Google Drive, GREDU membutuhkan izin untuk melihat Google Drive tersebut. Mohon berikan autentikasi dengan mengeklik tombol di bawah. Dengan memberikan autentikasi, akun ini juga akan terhubung dengan akun Google dan dapat digunakan pula saat login dengan akun Google'
//                     .text
//                     .make(),
//                 20.heightBox,
//                 ExButtonOutline(
//                   leftIcon: SvgPicture.asset('assets/images/ic_google.svg'),
//                   label: 'Login dengan Google',
//                   onPressed: () => {Get.back(), callbackConnectToGoogle()},
//                 ).wFull(context)
//               ]).p(24)
//             ]).wFourFifth(context),
//           ),
//         );
//       },
//     );
//   }

//   static void bottomSheetReAuthenticate(BuildContext context, Function onReAuthenticate) {
//     BottomSheetHelper.bottomSheetCustomDialog(
//       childrenWidget: VStack([
//         'Aktifkan Akses Google Drive'.text.bold.headline1(context).color(colorNeutral.shade800).make(),
//         10.heightBox,
//         Divider().wFull(context),
//         28.heightBox,
//         Image.asset(
//           'assets/images/img_google_drive_access.png',
//           width: 284,
//           fit: BoxFit.fill,
//         ).centered(),
//         16.heightBox,
//         'Akses ke Google Drive belum diaktifkan'.text.bodyText2(context).bold.color(colorNeutral.shade500).center.make().centered(),
//         8.heightBox,
//         'Keluar akun dan login kembali, kemudian aktifkan semua akses Google Drive seperti pada gambar diatas.'.text.bodyText2(context).center.color(colorNeutral.shade500).make().centered(),
//         24.heightBox,
//         ExButtonDefault(
//           label: 'Autentikasi Ulang',
//           onPressed: () {
//             Get.back();
//             onReAuthenticate.call();
//           },
//         ).wFull(context),
//         8.heightBox,
//         ExButtonOutline(
//           label: 'Batal',
//           labelColor: colorBlack,
//           isLabelBold: true,
//           onPressed: () => Get.back(),
//         ).wFull(context),
//       ]),
//     );
//   }

//   static void showFiles({
//     required List<dynamic> listFile,
//     bool showSnackbar = false,
//     Function(List<dynamic>)? onSave,
//   }) {
//     showDialog(
//       context: Get.context!,
//       barrierDismissible: false,
//       builder: (context) {
//         return Scaffold(
//           appBar: AppBar(
//             title: 'Pilih File dari Google Drive'.text.extraBold.bodyText1(Get.context!).make(),
//           ),
//           body: ListView.builder(
//             itemCount: listFile.length,
//             itemBuilder: (BuildContext context, int index) {
//               final file = listFile[index];
//               final isSelected = false.obs;
//               isSelected.value = file['isSelected'];
//               return ListTile(
//                 leading: SvgPicture.asset(file['type'].toString().tempIconDocument).wh(25, 25),
//                 title: file['name'].toString().text.maxLines(1).ellipsis.make(),
//                 onTap: () => {isSelected.value = !isSelected.value, file['isSelected'] = isSelected.value},
//                 trailing: Obx(() => isSelected.value ? Icon(Icons.check_box, color: colorPrimary) : Icon(Icons.check_box_outline_blank_rounded)),
//               );
//             },
//           ).p16(),
//           bottomNavigationBar: ExButtonDefault(
//             label: 'Simpan',
//             width: double.infinity,
//             onPressed: () async => {
//               await _downloadFile(
//                 listSelectedAttachment: listFile,
//                 showSnackbar: showSnackbar,
//               ).then((value) => onSave?.call(value)),
//             },
//           ).p16(),
//         ).whFull(context);
//       },
//     );
//   }

//   static Future<List> _downloadFile({required List<dynamic> listSelectedAttachment, bool showSnackbar = false}) async {
//     _showProgressDowloadDialog();

//     final list = listSelectedAttachment.where((element) => element['isSelected']);
//     final newList = [];
//     var cancelOrFailDownload = false;
//     final authHeaders = <String, String>{
//       'Authorization': 'Bearer ${PrefHelper.userGoogleToken}',
//       'X-Goog-AuthUser': '0',
//     };

//     for (final item in list) {
//       if (cancelOrFailDownload) {
//         break;
//       }

//       logD('download file type ==> ${item['type']}');
//       final isGoogleWorkspace = item['type'].toString().contains('application/vnd.google-apps');
//       final url = isGoogleWorkspace ? _getUrlDownloadGoogleFile(item) : _getUrlDownloadFile(item);
//       final fileName = isGoogleWorkspace ? _getGoogleFilename(item) : item['name'];

//       logD('download url ==> ${url}');
//       await HttpDownloader.files(
//         url: url,
//         header: authHeaders,
//         filename: fileName,
//         onStart: () {
//           if (showSnackbar) {
//             SnackbarHelper.info('Mulai Mengunduh ${item['file']}');
//           }
//         },
//         onProgress: (x) {
//           logI('Progress $x');
//           cprogress.value = x;
//         },
//         onSuccess: (x) async {
//           if (showSnackbar) {
//             SnackbarHelper.success('Berhasil Mengunduh ${item['file']}');
//           }
//           newList.add({
//             'id': item['drive_id'],
//             'drive_id': item['drive_id'],
//             'file': File(x),
//             'file_name': fileName,
//             'from': 'gdrive',
//             'type': lookupMimeType(x),
//             'show_as': docType(x),
//           });
//         },
//         onError: (x) {
//           cancelOrFailDownload = true;
//           logD('Gagal Mengunduh file ===> ${item['file']}');
//           logD('Error info ===> ${x}');
//           if (showSnackbar) {
//             SnackbarHelper.danger('Gagal Mengunduh ${item['file']}');
//           }
//           ExLoading.dismiss();
//         },
//       );
//     }

//     ExLoading.dismiss();

//     return newList;
//   }

//   static void _showProgressDowloadDialog({double? messageSize = 14}) {
//     cprogress.value = '';
//     Get.dialog(
//       AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
//         insetPadding: EdgeInsets.symmetric(horizontal: 120),
//         content: VStack(
//           [
//             Center(
//               child: VStack([
//                 LoadingAnimationWidget.discreteCircle(color: Theme.of(Get.context!).primaryColor, size: 32).centered(),
//                 VStack(
//                   [
//                     16.heightBox,
//                     Obx(() => '${cprogress.value} %'.text.align(TextAlign.center).size(messageSize).makeCentered()),
//                   ],
//                 ).centered(),
//               ]),
//             ),
//           ],
//         ),
//       ),
//       barrierDismissible: false,
//       useSafeArea: true,
//     );
//   }

//   static Future<void> onSave(List<dynamic> listSelectedAttachment) async {
//     ExLoading.show();
//     // final list = listSelectedAttachment.where((element) => element['isSelected']);
//   }

//   static String _getUrlDownloadFile(item) {
//     return 'https://www.googleapis.com/drive/v3/files/${item['drive_id']}?alt=media';
//   }

//   static String _getUrlDownloadGoogleFile(item) {
//     final originMimeType = item['type'].toString();
//     var exportMimeType = 'application/pdf';
//     switch (originMimeType) {
//       case 'application/vnd.google-apps.document':
//         exportMimeType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
//         break;
//       case 'application/vnd.google-apps.sheets':
//         exportMimeType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
//         break;
//       case 'application/vnd.google-apps.presentation':
//         exportMimeType = 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
//         break;
//     }
//     return 'https://www.googleapis.com/drive/v3/files/${item['drive_id']}/export?mimeType=$exportMimeType';
//   }

//   static String _getGoogleFilename(item) {
//     final originMimeType = item['type'].toString();
//     var exportFileName = '${item['name']}.pdf';
//     switch (originMimeType) {
//       case 'application/vnd.google-apps.document':
//         exportFileName = '${item['name']}.docx';
//         break;
//       case 'application/vnd.google-apps.spreadsheet':
//         exportFileName = '${item['name']}.xlsx';
//         break;
//       case 'application/vnd.google-apps.presentation':
//         exportFileName = '${item['name']}.pptx';
//         break;
//     }
//     return exportFileName;
//   }

//   static String docType(String name) => name.contains('xls')
//       ? 'xls'
//       : name.contains('doc')
//           ? 'doc'
//           : name.contains('ppt')
//               ? 'ppt'
//               : name.contains('pdf')
//                   ? 'pdf'
//                   : name.contains('jpg') || name.contains('jpeg')
//                       ? 'jpg'
//                       : name.contains('mp4')
//                           ? 'mp4'
//                           : 'file';
// }
