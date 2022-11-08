import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/core/base/base_controller.dart';
import 'package:jualin_flutter_3/app/models/request/response/user_entity.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/request/response/list_seller_entity.dart';
import '../../../routes/app_pages.dart';

class PitchmanListController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final refreshController = RefreshController();

  final listProducts = <ListSellerEntity>[].obs;
  List sellers = [].obs;
  List users = [].obs;
  final listSeller = <ListSellerEntity>[].obs;
  final listUser = <UserEntity>[].obs;

  var logger = Logger();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getUser();
    await getListProducts();
  }

  void goToDetailSeller(ListSellerEntity data, String title) {
    Get.toNamed(Routes.DETAIL_SELLER, arguments: {
      'data': data,
      'title': title,
    });
  }

  Future<void> onRefresh() async {
    getListProducts();
    getUser();
    refreshController.refreshCompleted();
  }

  Future<void> getUser() async {
    await FirebaseFirestore.instance.collection("user").get().then((value) {
      users = value.docs.map((e) => e.data()).toList();

      final position = UserPosition();
      for (var i = 0; i < users.length; i++) {
        position.lat = users[i]['position']['lat'] ?? 0.0;
        position.long = users[i]['position']['long'] ?? 0.0;

        listUser.value = users
            .map(
              (e) => UserEntity()
                ..uid = e['uid']
                ..address = e['address']
                ..fullName = e['full_name']
                ..role = e['role']
                ..phoneNumber = e['phone_number']
                ..position = position
                ..photoUrl = e['photo_url']
                ..email = e['email']
                ..isLogin = e['is_login'],
            )
            .toList();
      }
      return listUser;
    });
  }

  Future<void> getListProducts() async {
    await FirebaseFirestore.instance.collection("product").get().then((value) {
      sellers = value.docs.map((e) => e.data()).toList();

      final products = <ListSellerProducts>[];
      final reviews = <ListSellerReviews>[];
      final operationalHour = ListSellerOperationalHour();
      for (var i = 0; i < sellers.length; i++) {
        for (var item in sellers[i]['reviews']) {
          final review = ListSellerReviews();
          review.name = item['name'];
          review.desc = item['desc'];
          reviews.add(review);
        }

        operationalHour.open = sellers[i]['operational_hour']['open'];
        operationalHour.close = sellers[i]['operational_hour']['close'];

        for (var element in sellers[i]['products']) {
          final product = ListSellerProducts();
          product.price = element['price'];
          product.name = element['name'];
          product.price = element['price'];
          product.photoProduct = element['photo_product'];
          product.rating = element['rating'];
          product.stock = element['stock'];
          products.add(product);
        }
      }

      listSeller.value = sellers
          .map(
            (e) => ListSellerEntity()
              ..uid = e['uid']
              ..address = e['address']
              ..reviews = reviews
              ..name = e['name']
              ..description = e['description']
              ..photo = e['photo']
              ..operationalHour = operationalHour
              ..products = products
              ..isMoving = e['is_moving'],
          )
          .toList();
      listSeller.value = listSeller.where((p0) => p0.isMoving == true).toList();
      return listSeller;
    });
  }
}
