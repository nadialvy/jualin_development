import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../models/request/response/list_seller_entity.dart';

class DetailSellerController extends GetxController {
  var logger = Logger();

  final dataSeller = ListSellerEntity().obs;
  final title = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    dataSeller.value = Get.arguments['data'];
    title.value = Get.arguments['title'];
  }
}
