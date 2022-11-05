import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SettingSellerController extends GetxController {
  void goToNotificationPage() => Get.toNamed(Routes.NOTIFICATION_SELLER);

  void goToHelpPage() => Get.toNamed(Routes.HELP_SELLER);
}
