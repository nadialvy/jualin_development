import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/core/base/base_controller.dart';

class ChatSellerController extends BaseController with StateMixin<int> {
  @override
  void onInit() {
    super.onInit();
    change(200, status: RxStatus.success());
  }
}
