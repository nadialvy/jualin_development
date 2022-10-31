import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/report_problem_view.dart';

class HelpController extends GetxController {
  final tfProblem = TextEditingController();

  void goToReportProblemView(){
    Get.to(const ReportProblemView());
  }
}
