// To parse this JSON data, do
//
//     final getSearchModal = getSearchModalFromJson(jsonString);

import 'dart:convert';

GetSearchModal getSearchModalFromJson(String str) => GetSearchModal.fromJson(json.decode(str));



class GetSearchModal {
  GetSearchModal({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory GetSearchModal.fromJson(Map<String, dynamic> json) => GetSearchModal(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );


}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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


}

class ProductImage {
  ProductImage({
    this.id,
    this.url,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? url;
  String? productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    url: json["url"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );


}
