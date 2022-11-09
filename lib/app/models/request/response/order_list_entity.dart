import 'package:jualin_flutter_3/generated/json/base/json_field.dart';
import 'package:jualin_flutter_3/generated/json/order_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class OrderListEntity {

	String? uid;
	String? address;
	String? name;
	String? description;
	String? photo;
	List<OrderListOrders>? orders;
	double? total;
	@JSONField(name: "is_paid")
	bool? isPaid;
  
  OrderListEntity();

  factory OrderListEntity.fromJson(Map<String, dynamic> json) => $OrderListEntityFromJson(json);

  Map<String, dynamic> toJson() => $OrderListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OrderListOrders {

	String? uid;
	double? price;
	String? rating;
	String? name;
	@JSONField(name: "photo_product")
	String? photoProduct;
	int? stock;
  
  OrderListOrders();

  factory OrderListOrders.fromJson(Map<String, dynamic> json) => $OrderListOrdersFromJson(json);

  Map<String, dynamic> toJson() => $OrderListOrdersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}