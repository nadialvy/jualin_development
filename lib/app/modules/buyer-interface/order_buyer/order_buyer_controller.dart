import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../models/request/response/list_seller_entity.dart';

class OrderBuyerController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var logger = Logger();

  final listProducts = <ListSellerEntity>[].obs;

  Future<void> getDataProduct() async {
    await firestore.collection('product').get().then((value) {
    });
  }
}
