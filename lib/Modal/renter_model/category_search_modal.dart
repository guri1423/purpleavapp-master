

import 'dart:convert';

GetCategoryProductModal getCategoryProductModalFromJson(String str) => GetCategoryProductModal.fromJson(json.decode(str));


class GetCategoryProductModal {
  GetCategoryProductModal({
    required this.category,
    required this.status,
  });

  Category category;
  String status;

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
    this.product,
  });

  int? id;
  String? catName;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<Product>? product;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    catName: json["cat_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
  );


}

class Product {
  Product({
    this.id,
    this.name,
    this.serviceProviderId,
    this.model,
    this.brand,
    this.manualPdf,
    this.weekendPrice,
    this.oneDayPrice,
    this.twoDayPrice,
    this.threeDayPrice,
    this.weeklyPrice,
    this.package1,
    this.package2,
    this.package1Price,
    this.package2Price,
    this.inventory,
    this.delivery,
    this.shippingCost,
    this.moreInfo,
    this.termsConditions,
    this.categoryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productImages,
    this.pickupAddress,
  });

  int? id;
  String? name;
  String? serviceProviderId;
  String? model;
  String? brand;
  dynamic? manualPdf;
  String? weekendPrice;
  String? oneDayPrice;
  String? twoDayPrice;
  String? threeDayPrice;
  String? weeklyPrice;
  String? package1;
  String? package2;
  String? package1Price;
  String? package2Price;
  String? inventory;
  dynamic? delivery;
  String? shippingCost;
  String? moreInfo;
  String? termsConditions;
  String? categoryId;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ProductImage>? productImages;
  PickupAddress? pickupAddress;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    serviceProviderId: json["service_provider_id"],
    model: json["model"],
    brand: json["brand"],
    manualPdf: json["manual_pdf"],
    weekendPrice: json["weekend_price"],
    oneDayPrice: json["one_day_price"],
    twoDayPrice: json["two_day_price"],
    threeDayPrice: json["three_day_price"],
    weeklyPrice: json["weekly_price"],
    package1: json["package_1"],
    package2: json["package_2"],
    package1Price: json["package_1_price"],
    package2Price: json["package_2_price"],
    inventory: json["inventory"],
    delivery: json["delivery"],
    shippingCost: json["shipping_cost"],
    moreInfo: json["more_info"],
    termsConditions: json["terms_conditions"],
    categoryId: json["category_id"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
    pickupAddress: PickupAddress.fromJson(json["pickup_address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "service_provider_id": serviceProviderId,
    "model": model,
    "brand": brand,
    "manual_pdf": manualPdf,
    "weekend_price": weekendPrice,
    "one_day_price": oneDayPrice,
    "two_day_price": twoDayPrice,
    "three_day_price": threeDayPrice,
    "weekly_price": weeklyPrice,
    "package_1": package1,
    "package_2": package2,
    "package_1_price": package1Price,
    "package_2_price": package2Price,
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

  };
}

class ProductImage {
  ProductImage({
    this.id,
    this.url,
    this.productId,

  });

  int? id;
  String? url;
  String? productId;


  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
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
