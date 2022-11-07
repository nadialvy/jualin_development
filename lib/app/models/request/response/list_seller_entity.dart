import 'package:jualin_flutter_3/generated/json/base/json_field.dart';
import 'package:jualin_flutter_3/generated/json/list_seller_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ListSellerEntity {
  String? address;
  List<ListSellerReviews>? reviews;
  String? name;
  String? description;
  String? photo;
  @JSONField(name: "operational_hour")
  ListSellerOperationalHour? operationalHour;
  List<ListSellerProducts>? products;
  @JSONField(name: "is_moving")
  bool? isMoving;
  String? uid;

  ListSellerEntity();

  factory ListSellerEntity.fromJson(Map<String, dynamic> json) => $ListSellerEntityFromJson(json);

  Map<String, dynamic> toJson() => $ListSellerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ListSellerReviews {
  String? name;
  String? desc;

  ListSellerReviews();

  factory ListSellerReviews.fromJson(Map<String, dynamic> json) => $ListSellerReviewsFromJson(json);

  Map<String, dynamic> toJson() => $ListSellerReviewsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ListSellerOperationalHour {
  String? close;
  String? open;

  ListSellerOperationalHour();

  factory ListSellerOperationalHour.fromJson(Map<String, dynamic> json) => $ListSellerOperationalHourFromJson(json);

  Map<String, dynamic> toJson() => $ListSellerOperationalHourToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ListSellerProducts {
  String? price;
  String? name;
  String? rating;
  @JSONField(name: "photo_product")
  String? photoProduct;
  int? stock;

  ListSellerProducts();

  factory ListSellerProducts.fromJson(Map<String, dynamic> json) => $ListSellerProductsFromJson(json);

  Map<String, dynamic> toJson() => $ListSellerProductsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
