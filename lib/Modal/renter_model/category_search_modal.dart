// To parse this JSON data, do
//
//     final getCategoryProductModal = getCategoryProductModalFromJson(jsonString);

import 'dart:convert';

GetCategoryProductModal getCategoryProductModalFromJson(String str) => GetCategoryProductModal.fromJson(json.decode(str));



class GetCategoryProductModal {
  GetCategoryProductModal({
    this.category,
    this.status,
  });

  Category? category;
  String? status;

  factory GetCategoryProductModal.fromJson(Map<String, dynamic> json) => GetCategoryProductModal(
    category: Category.fromJson(json["category"]),
    status: json["status"],
  );


}

class Category {
  Category({
    this.id,
    this.catName,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  int? id;
  String? catName;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<DataCategory>? data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    catName: json["cat_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    data: List<DataCategory>.from(json["data"].map((x) => DataCategory.fromJson(x))),
  );


}

class DataCategory {
  DataCategory({
    this.id,
    this.name,
    this.serviceProviderId,
    this.model,
    this.brand,
    this.manualPdf,
    this.oneDayPrice,
    this.inventory,
    this.delivery,
    this.shippingCost,
    this.moreInfo,
    this.termsConditions,
    this.categoryId,
    this.productImages,
    this.pickupAddress,
  });

  int? id;
  String? name;
  String? serviceProviderId;
  String? model;
  String? brand;
  dynamic? manualPdf;
  String? oneDayPrice;
  String? inventory;
  dynamic? delivery;
  String? shippingCost;
  String? moreInfo;
  String? termsConditions;
  String? categoryId;
  dynamic? deletedAt;
  List<ProductImages>? productImages;
  PickupAddress? pickupAddress;

  factory DataCategory.fromJson(Map<String, dynamic> json) => DataCategory(
    id: json["id"],
    name: json["name"],
    serviceProviderId: json["service_provider_id"],
    model: json["model"],
    brand: json["brand"],
    manualPdf: json["manual_pdf"],
    oneDayPrice: json["one_day_price"],
    inventory: json["inventory"],
    delivery: json["delivery"],
    shippingCost: json["shipping_cost"],
    moreInfo: json["more_info"],
    termsConditions: json["terms_conditions"],
    categoryId: json["category_id"],
    productImages: List<ProductImages>.from(json["product_images"].map((x) => ProductImages.fromJson(x))),
    pickupAddress: PickupAddress.fromJson(json["pickup_address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "service_provider_id": serviceProviderId,
    "model": model,
    "brand": brand,
    "manual_pdf": manualPdf,
    "one_day_price": oneDayPrice,
    "inventory": inventory,
    "delivery": delivery,
    "shipping_cost": shippingCost,
    "more_info": moreInfo,
    "terms_conditions": termsConditions,
    "category_id": categoryId,
    "deleted_at": deletedAt,
    "product_images": List<dynamic>.from(productImages!.map((x) => x.toJson())),
    "pickup_address": pickupAddress!.toJson(),
  };
}

class PickupAddress {
  PickupAddress({
    this.id,
    this.address,
    this.landmark,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.productId,
    this.bookingId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? address;
  String? landmark;
  String? country;
  String? state;
  String? city;
  String? postalCode;
  String? productId;
  dynamic? bookingId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PickupAddress.fromJson(Map<String, dynamic> json) => PickupAddress(
    id: json["id"],
    address: json["address"],
    landmark: json["landmark"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    postalCode: json["postal_code"],
    productId: json["product_id"],
    bookingId: json["booking_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "landmark": landmark,
    "country": country,
    "state": state,
    "city": city,
    "postal_code": postalCode,
    "product_id": productId,
    "booking_id": bookingId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class ProductImages {
  ProductImages({
    this.id,
    this.url,
    this.productId,

  });

  int? id;
  String? url;
  String? productId;



  factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
    id: json["id"],
    url: json["url"],
    productId: json["product_id"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "product_id": productId,

  };
}
