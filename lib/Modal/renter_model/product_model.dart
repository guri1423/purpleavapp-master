

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));


class ProductModel {
  ProductModel({
   required this.products,
  });

  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

}

class Product {
  Product({
    this.id,
    this.name,
    this.serviceProviderId,
    this.rentCost,
    this.stocks,
    this.reason,
    this.manualPdf,
    this.model,
    this.brand,
    this.pickupAddress,
    this.shippingCost,
    this.description,
    this.termsConditions,
    this.perDayPrice,
    this.perHourPrice,
    this.twoDayPrice,
    this.weeklyPrice,
    this.weekendPrice,
    this.package1,
    this.package2,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String ?serviceProviderId;
  String ?rentCost;
  String ?stocks;
  dynamic reason;
  String ?manualPdf;
  String ?model;
  String ?brand;
  String ?pickupAddress;
  String ?shippingCost;
  String ?description;
  String ?termsConditions;
  String ?perDayPrice;
  String ?perHourPrice;
  String ?twoDayPrice;
  String ?weeklyPrice;
  String ?weekendPrice;
  String ?package1;
  String ?package2;
  dynamic deletedAt;
  DateTime ?createdAt;
  DateTime ?updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    serviceProviderId: json["service_provider_id"],
    rentCost: json["rent_cost"],
    stocks: json["stocks"],
    reason: json["reason"],
    manualPdf: json["manual_pdf"],
    model: json["model"],
    brand: json["brand"],
    pickupAddress: json["pickup_address"],
    shippingCost: json["shipping_cost"],
    description: json["description"],
    termsConditions: json["terms_conditions"],
    perDayPrice: json["per_day_price"],
    perHourPrice: json["per_hour_price"],
    twoDayPrice: json["two_day_price"],
    weeklyPrice: json["weekly_price"],
    weekendPrice: json["weekend_price"],
    package1: json["package_1"],
    package2: json["package_2"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
