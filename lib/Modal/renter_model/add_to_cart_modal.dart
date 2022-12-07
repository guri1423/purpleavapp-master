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
  AddCart? cart;
  Address? address;

  factory ProductAddedToCartModal.fromJson(Map<String, dynamic> json) => ProductAddedToCartModal(
    message: json["message"],
    status: json["status"],
    cart: AddCart.fromJson(json["cart"]),
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
    this.id,
  });

  String? address;
  String? landmark;
  String? country;
  String? state;
  String? city;
  String? postalCode;
  int? bookingId;
  int? id;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    landmark: json["landmark"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    postalCode: json["postal_code"],
    bookingId: json["booking_id"],
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

class AddCart{
  AddCart({
    this.productId,
    this.quantity,
    this.rent,
    this.startDate,
    this.endDate,
    this.rentPrice,
    this.totalAmount,
    this.delivery,
  });

  String? productId;
  String? quantity;
  String? rent;
  dynamic? startDate;
  dynamic? endDate;
  String? rentPrice;
  String? totalAmount;
  String? delivery;

  factory AddCart.fromJson(Map<String, dynamic> json) => AddCart(
    productId: json["product_id"],
    quantity: json["quantity"],
    rent: json["rent"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    rentPrice: json["rent_price"],
    totalAmount: json["total_amount"],
    delivery: json["delivery"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "rent": rent,
    "start_date": startDate,
    "end_date": endDate,
    "rent_price": rentPrice,
    "total_amount": totalAmount,
    "delivery": delivery,
  };
}
