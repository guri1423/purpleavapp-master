
import 'dart:convert';


class EditProduct {
  EditProduct({
     this.name,
     this.model,
     this.brand,
     this.oneDayPrice,
     this.inventory,
     this.termsConditions,
     this.moreInfo,
     this.categoryId,
     this.delivery,
     this.shippingCost,
     this.address,
     this.landmark,
     this.country,
     this.state,
     this.city,
     this.postalCode,

  });


  String? name;
  String? model;
  String? brand;
  String? oneDayPrice;
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
    oneDayPrice: json["one_day_price"],
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
    "one_day_price": oneDayPrice,
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




