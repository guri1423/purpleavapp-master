
import 'dart:convert';

getProductsModalFromJson(String str) => GetProductsModal.fromJson(json.decode(str));

String getProductsModalToJson(GetProductsModal data) => json.encode(data.toJson());

class GetProductsModal {
  GetProductsModal({
    required this.products,
    required this.status,
  });

  List<Product> products;
  String status;

  factory GetProductsModal.fromJson(Map<String, dynamic> json) => GetProductsModal(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "status": status,
  };
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
  String? manualPdf;
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
  String? delivery;
  String? shippingCost;
  String? moreInfo;
  String? termsConditions;
  String? categoryId;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? productImages;
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
    productImages: List<dynamic>.from(json["product_images"].map((x) => x)),
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "product_images": List<dynamic>.from(productImages!.map((x) => x)),
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
