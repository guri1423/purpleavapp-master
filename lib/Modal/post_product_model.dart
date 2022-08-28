// To parse this JSON data, do
//
//     final getAllProductsModel = getAllProductsModelFromJson(jsonString);

import 'dart:convert';

GetAllProductsModel getAllProductsModelFromJson(String str) => GetAllProductsModel.fromJson(json.decode(str));

String getAllProductsModelToJson(GetAllProductsModel data) => json.encode(data.toJson());

class GetAllProductsModel {
  GetAllProductsModel({

    required this.product,
  });


  Product product;

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) => GetAllProductsModel(

    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {

    "product": product.toJson(),
  };
}

class Product {
  Product({
    this.name,
    this.serviceProviderId,
    this.rentCost,
    this.stocks,
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
    this.status,
    this.categoryId,
    this.manualPdf,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? serviceProviderId;
  String? rentCost;
  String? stocks;
  String? model;
  String? brand;
  String? pickupAddress;
  String? shippingCost;
  String? description;
  String? termsConditions;
  String? perDayPrice;
  String? perHourPrice;
  String? twoDayPrice;
  String? weeklyPrice;
  String? weekendPrice;
  String? package1;
  String? package2;
  String? status;
  String? categoryId;
  String? manualPdf;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    serviceProviderId: json["service_provider_id"],
    rentCost: json["rent_cost"],
    stocks: json["stocks"],
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
    status: json["status"],
    categoryId: json["category_id"],
    manualPdf: json["manual_pdf"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "service_provider_id": serviceProviderId,
    "rent_cost": rentCost,
    "stocks": stocks,
    "model": model,
    "brand": brand,
    "pickup_address": pickupAddress,
    "shipping_cost": shippingCost,
    "description": description,
    "terms_conditions": termsConditions,
    "per_day_price": perDayPrice,
    "per_hour_price": perHourPrice,
    "two_day_price": twoDayPrice,
    "weekly_price": weeklyPrice,
    "weekend_price": weekendPrice,
    "package_1": package1,
    "package_2": package2,
    "status": status,
    "category_id": categoryId,
    "manual_pdf": manualPdf,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
