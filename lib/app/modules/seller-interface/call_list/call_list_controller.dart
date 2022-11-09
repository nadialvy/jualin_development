import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/models/request/response/order_list_entity.dart';
import 'package:faker/faker.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class CallListController extends GetxController {
  final orderList = <OrderListEntity>[].obs;

  // dummy data ==========
  List<OrderListEntity> dummyOrderListData() {
    final data = <OrderListEntity>[];
    final dataOrderList = <OrderListOrders>[];
    for (var i = 0; i < 3; i++) {
      final orderList = OrderListOrders();
      orderList.uid = 'qWkmsd1HbLZE47HC9JXLkQm1ibp$i';
      orderList.price = (2000 * 1.0 + 20.0);
      orderList.rating = "$i";
      orderList.name = 'Mie Ayam';
      orderList.photoProduct = 'https://picsum.photos/id/${i * 2}/200/300';
      orderList.stock = 10;
      dataOrderList.add(orderList);
    }

    for (var i = 0; i < 3; i++) {
      final order = OrderListEntity();
      order.uid = 'qWkmsd1HbLZE47HC9JXLkQm1ibp$i';
      order.address = faker.address.toString();
      order.name = faker.person.name();
      order.description = 'Saya sambalnya banyak';
      order.photo = 'https://picsum.photos/id/$i/200/300';
      order.total = 10000.0 * i;
      order.isPaid = i / 2 == 0 ? true : false;
      order.orders = dataOrderList.where((element) => element.uid == 'qWkmsd1HbLZE47HC9JXLkQm1ibp$i').toList();
      data.add(order);
    }
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    orderList.value = dummyOrderListData();
    logger.i(orderList);
  }
}
