import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/models/request/response/user_entity.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
