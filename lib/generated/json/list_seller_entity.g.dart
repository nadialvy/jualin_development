import 'package:jualin_flutter_3/generated/json/base/json_convert_content.dart';
import 'package:jualin_flutter_3/app/models/request/response/list_seller_entity.dart';

ListSellerEntity $ListSellerEntityFromJson(Map<String, dynamic> json) {
	final ListSellerEntity listSellerEntity = ListSellerEntity();
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		listSellerEntity.address = address;
	}
	final List<ListSellerReviews>? reviews = jsonConvert.convertListNotNull<ListSellerReviews>(json['reviews']);
	if (reviews != null) {
		listSellerEntity.reviews = reviews;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		listSellerEntity.name = name;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		listSellerEntity.description = description;
	}
	final String? photo = jsonConvert.convert<String>(json['photo']);
	if (photo != null) {
		listSellerEntity.photo = photo;
	}
	final ListSellerOperationalHour? operationalHour = jsonConvert.convert<ListSellerOperationalHour>(json['operational_hour']);
	if (operationalHour != null) {
		listSellerEntity.operationalHour = operationalHour;
	}
	final List<ListSellerProducts>? products = jsonConvert.convertListNotNull<ListSellerProducts>(json['products']);
	if (products != null) {
		listSellerEntity.products = products;
	}
	final bool? isMoving = jsonConvert.convert<bool>(json['is_moving']);
	if (isMoving != null) {
		listSellerEntity.isMoving = isMoving;
	}
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		listSellerEntity.uid = uid;
	}
	return listSellerEntity;
}

Map<String, dynamic> $ListSellerEntityToJson(ListSellerEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['address'] = entity.address;
	data['reviews'] =  entity.reviews?.map((v) => v.toJson()).toList();
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo'] = entity.photo;
	data['operational_hour'] = entity.operationalHour?.toJson();
	data['products'] =  entity.products?.map((v) => v.toJson()).toList();
	data['is_moving'] = entity.isMoving;
	data['uid'] = entity.uid;
	return data;
}

ListSellerReviews $ListSellerReviewsFromJson(Map<String, dynamic> json) {
	final ListSellerReviews listSellerReviews = ListSellerReviews();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		listSellerReviews.name = name;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		listSellerReviews.desc = desc;
	}
	return listSellerReviews;
}

Map<String, dynamic> $ListSellerReviewsToJson(ListSellerReviews entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['desc'] = entity.desc;
	return data;
}

ListSellerOperationalHour $ListSellerOperationalHourFromJson(Map<String, dynamic> json) {
	final ListSellerOperationalHour listSellerOperationalHour = ListSellerOperationalHour();
	final String? close = jsonConvert.convert<String>(json['close']);
	if (close != null) {
		listSellerOperationalHour.close = close;
	}
	final String? open = jsonConvert.convert<String>(json['open']);
	if (open != null) {
		listSellerOperationalHour.open = open;
	}
	return listSellerOperationalHour;
}

Map<String, dynamic> $ListSellerOperationalHourToJson(ListSellerOperationalHour entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['close'] = entity.close;
	data['open'] = entity.open;
	return data;
}

ListSellerProducts $ListSellerProductsFromJson(Map<String, dynamic> json) {
	final ListSellerProducts listSellerProducts = ListSellerProducts();
	final String? price = jsonConvert.convert<String>(json['price']);
	if (price != null) {
		listSellerProducts.price = price;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		listSellerProducts.name = name;
	}
	final String? rating = jsonConvert.convert<String>(json['rating']);
	if (rating != null) {
		listSellerProducts.rating = rating;
	}
	final String? photoProduct = jsonConvert.convert<String>(json['photo_product']);
	if (photoProduct != null) {
		listSellerProducts.photoProduct = photoProduct;
	}
	final int? stock = jsonConvert.convert<int>(json['stock']);
	if (stock != null) {
		listSellerProducts.stock = stock;
	}
	return listSellerProducts;
}

Map<String, dynamic> $ListSellerProductsToJson(ListSellerProducts entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['price'] = entity.price;
	data['name'] = entity.name;
	data['rating'] = entity.rating;
	data['photo_product'] = entity.photoProduct;
	data['stock'] = entity.stock;
	return data;
}