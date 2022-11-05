import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'report_problem_view.dart';

class HelpBuyerController extends GetxController {
  final tfProblem = TextEditingController();

  void goToReportProblemView(){
    Get.to(const ReportProblemView());
  }
}
