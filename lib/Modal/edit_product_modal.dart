
import 'dart:convert';


class EditProduct {
  EditProduct({
    required this.name,
    required this.model,
    required this.brand,
    required this.weekendPrice,
    required this.oneDayPrice,
    required this.twoDayPrice,
    required this.threeDayPrice,
    required this.weeklyPrice,
    required this.package1,
    required this.package2,
    required this.package1Price,
    required this.package2Price,
    required this.inventory,
    required this.termsConditions,
    required this.moreInfo,
    required this.categoryId,
    required this.delivery,
    required this.shippingCost,
    this.address,
    this.landmark,
    this.country,
    this.state,
    this.city,
    this.postalCode,

  });


  String name;

  String model;
  String brand;
  String? weekendPrice;
  String? oneDayPrice;
  String? twoDayPrice;
  dynamic? threeDayPrice;
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
  String? address;
  String? landmark;
  String? country;
  String? state;
  String? city;
  String? postalCode;

  factory EditProduct.fromJson(Map<String, dynamic> json) => EditProduct(

    name: json["name"],
    model: json["model"],
    brand: json["brand"],
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



  );

  Map<String, dynamic> toJson() => {

    "name": name,
    "model": model,
    "brand": brand,
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
    "address": address,
    "landmark": landmark,
    "country": country,
    "state": state,
    "city": city,
    "postal_code": postalCode,

  };
}




