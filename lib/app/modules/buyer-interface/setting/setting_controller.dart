import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  void goToNotificationPage() => Get.toNamed(Routes.NOTIFICATION);

  void goToHelpPage() => Get.toNamed(Routes.HELP);
}
