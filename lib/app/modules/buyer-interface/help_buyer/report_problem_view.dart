import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/index.dart';
import '../../../core/resource/color.dart';
import 'help_buyer_controller.dart';

class ReportProblemView extends GetView<HelpBuyerController> {
  const ReportProblemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Laporkan Masalah'.text.bold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: VStack([
        ExTextFieldMultiline(
          tfController: controller.tfProblem,
          maxLine: 8,
          hint: 'Ketikkan masalah...',
        ),
        10.heightBox,
        const ExButtonDefault(
          width: double.infinity,
          label: 'Kirim Laporan',
          labelColor: colorWhite,
        ),
      ]),
    ).p16();
  }
}
