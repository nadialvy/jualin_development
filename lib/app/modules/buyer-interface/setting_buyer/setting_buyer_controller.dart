import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SettingBuyerController extends GetxController {
  void goToNotificationPage() => Get.toNamed(Routes.NOTIFICATION_BUYER);

  void goToHelpPage() => Get.toNamed(Routes.HELP_BUYER);
}
