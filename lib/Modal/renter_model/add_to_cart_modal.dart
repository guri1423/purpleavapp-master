// To parse this JSON data, do
//
//     final productAddedToCartModal = productAddedToCartModalFromJson(jsonString);

import 'dart:convert';

ProductAddedToCartModal productAddedToCartModalFromJson(String str) => ProductAddedToCartModal.fromJson(json.decode(str));

String productAddedToCartModalToJson(ProductAddedToCartModal data) => json.encode(data.toJson());

class ProductAddedToCartModal {
  ProductAddedToCartModal({
   required this.message,
   required this.status,
    required this.cart,
  });

  String message;
  String status;
  Cart cart;

  factory ProductAddedToCartModal.fromJson(Map<String, dynamic> json) => ProductAddedToCartModal(
    message: json["message"],
    status: json["status"],
    cart: Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "cart": cart.toJson(),
  };
}

class Cart {
  Cart({
    this.userEmail,
    this.productId,
    this.quantity,
    this.rent,
    this.rentPrice,
    this.package,
    this.packagePrice,
    this.delivery,
    this.id,
  });

  String? userEmail;
  String? productId;
  String? quantity;
  String? rent;
  String? rentPrice;
  String? package;
  String? packagePrice;
  String? delivery;
  int? id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    userEmail: json["user_email"],
    productId: json["product_id"],
    quantity: json["quantity"],
    rent: json["rent"],
    rentPrice: json["rent_price"],
    package: json["package"],
    packagePrice: json["package_price"],
    delivery: json["delivery"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_email": userEmail,
    "product_id": productId,
    "quantity": quantity,
    "rent": rent,
    "rent_price": rentPrice,
    "package": package,
    "package_price": packagePrice,
    "delivery": delivery,
    "id": id,
  };
}
