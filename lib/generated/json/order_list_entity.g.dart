import 'package:jualin_flutter_3/generated/json/base/json_convert_content.dart';
import 'package:jualin_flutter_3/app/models/request/response/order_list_entity.dart';

OrderListEntity $OrderListEntityFromJson(Map<String, dynamic> json) {
	final OrderListEntity orderListEntity = OrderListEntity();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		orderListEntity.uid = uid;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		orderListEntity.address = address;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		orderListEntity.name = name;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		orderListEntity.description = description;
	}
	final String? photo = jsonConvert.convert<String>(json['photo']);
	if (photo != null) {
		orderListEntity.photo = photo;
	}
	final List<OrderListOrders>? orders = jsonConvert.convertListNotNull<OrderListOrders>(json['orders']);
	if (orders != null) {
		orderListEntity.orders = orders;
	}
	final double? total = jsonConvert.convert<double>(json['total']);
	if (total != null) {
		orderListEntity.total = total;
	}
	final bool? isPaid = jsonConvert.convert<bool>(json['is_paid']);
	if (isPaid != null) {
		orderListEntity.isPaid = isPaid;
	}
	return orderListEntity;
}

Map<String, dynamic> $OrderListEntityToJson(OrderListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	data['address'] = entity.address;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo'] = entity.photo;
	data['orders'] =  entity.orders?.map((v) => v.toJson()).toList();
	data['total'] = entity.total;
	data['is_paid'] = entity.isPaid;
	return data;
}

OrderListOrders $OrderListOrdersFromJson(Map<String, dynamic> json) {
	final OrderListOrders orderListOrders = OrderListOrders();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		orderListOrders.uid = uid;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		orderListOrders.price = price;
	}
	final String? rating = jsonConvert.convert<String>(json['rating']);
	if (rating != null) {
		orderListOrders.rating = rating;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		orderListOrders.name = name;
	}
	final String? photoProduct = jsonConvert.convert<String>(json['photo_product']);
	if (photoProduct != null) {
		orderListOrders.photoProduct = photoProduct;
	}
	final int? stock = jsonConvert.convert<int>(json['stock']);
	if (stock != null) {
		orderListOrders.stock = stock;
	}
	return orderListOrders;
}

Map<String, dynamic> $OrderListOrdersToJson(OrderListOrders entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	data['price'] = entity.price;
	data['rating'] = entity.rating;
	data['name'] = entity.name;
	data['photo_product'] = entity.photoProduct;
	data['stock'] = entity.stock;
	return data;
}