// To parse this JSON data, do
//
//     final getProductAddedToCartModal = getProductAddedToCartModalFromJson(jsonString);

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
  dynamic product;

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
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_email": userEmail,
    "product_id": productId,
    "quantity": quantity,
    "rent": rent,
    "rent_price": rentPrice,
    "package": package,
    "package_price": packagePrice,
    "delivery": delivery,
    "product": product,
  };
}
