// To parse this JSON data, do
//
//     final productAddedToCartModal = productAddedToCartModalFromJson(jsonString);

import 'dart:convert';

ProductAddedToCartModal productAddedToCartModalFromJson(String str) => ProductAddedToCartModal.fromJson(json.decode(str));

String productAddedToCartModalToJson(ProductAddedToCartModal data) => json.encode(data.toJson());

class ProductAddedToCartModal {
  ProductAddedToCartModal({
    this.message,
    this.status,
    this.cart,
    this.address,
  });

  String? message;
  String? status;
  BookCart? cart;
  Address? address;

  factory ProductAddedToCartModal.fromJson(Map<String, dynamic> json) => ProductAddedToCartModal(
    message: json["message"],
    status: json["status"],
    cart: BookCart.fromJson(json["cart"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "cart": cart!.toJson(),
    "address": address!.toJson(),
  };
}

class Address {
  Address({
    this.address,
    this.landmark,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.bookingId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? address;
  String? landmark;
  String? country;
  String? state;
  String? city;
  String? postalCode;
  int? bookingId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    landmark: json["landmark"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    postalCode: json["postal_code"],
    bookingId: json["booking_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "landmark": landmark,
    "country": country,
    "state": state,
    "city": city,
    "postal_code": postalCode,
    "booking_id": bookingId,
    "id": id,
  };
}

class BookCart {
  BookCart({
    this.id,
  });


  String? id;

  factory BookCart.fromJson(Map<String, dynamic> json) => BookCart(

    id: json["product_id[]"],
  );

  Map<String, dynamic> toJson() => {
    "product_id[]": id,
  };
}
