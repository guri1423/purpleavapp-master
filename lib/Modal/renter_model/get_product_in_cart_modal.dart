import 'dart:convert';

GetProductAddedToCartModal getProductAddedToCartModalFromJson(String str) => GetProductAddedToCartModal.fromJson(json.decode(str));


class GetProductAddedToCartModal {
  GetProductAddedToCartModal({
    this.message,
    this.status,
    this.cart,
  });

  String? message;
  String? status;
  List<Cart>? cart;

  factory GetProductAddedToCartModal.fromJson(Map<String, dynamic> json) => GetProductAddedToCartModal(
    message: json["message"],
    status: json["status"],
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
  );


}

class Cart {
  Cart({
    this.id,
    this.userEmail,
    this.productId,
    this.quantity,
    this.rent,
    this.rentPrice,
    this.package,
    this.packagePrice,
    this.delivery,
    this.product,
  });

  int? id;
  String? userEmail;
  String? productId;
  String? quantity;
  String? rent;
  String? rentPrice;
  String? package;
  String? packagePrice;
  String? delivery;
  Product? product;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    userEmail: json["user_email"],
    productId: json["product_id"],
    quantity: json["quantity"],
    rent: json["rent"],
    rentPrice: json["rent_price"],
    package: json["package"],
    packagePrice: json["package_price"],
    delivery: json["delivery"],
    product: Product.fromJson(json["product"]),
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
  };
}
