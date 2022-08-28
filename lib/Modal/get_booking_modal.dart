// To parse this JSON data, do
//
//     final getBookingModal = getBookingModalFromJson(jsonString);

import 'dart:convert';

GetBookingModal getBookingModalFromJson(String str) => GetBookingModal.fromJson(json.decode(str));

String getBookingModalToJson(GetBookingModal data) => json.encode(data.toJson());

class GetBookingModal {
  GetBookingModal({
    required this.bookings,
  });

  List<Booking> bookings;

  factory GetBookingModal.fromJson(Map<String, dynamic> json) => GetBookingModal(
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class Booking {
  Booking({
    this.id,
    this.renterId,
    this.serviceProviderId,
    this.productId,
    this.quantity,
    this.package,
    this.deliveryType,
    this.expiryDate,
    this.purchaseDate,
    this.returnDate,
    this.totalPrice,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? renterId;
  String? serviceProviderId;
  String? productId;
  String? quantity;
  String? package;
  String? deliveryType;
  String? expiryDate;
  String? purchaseDate;
  String? returnDate;
  String? totalPrice;
  String? status;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    renterId: json["renter_id"],
    serviceProviderId: json["service_provider_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    package: json["package"],
    deliveryType: json["delivery_type"],
    expiryDate: json["expiry_date"],
    purchaseDate: json["purchase_date"],
    returnDate: json["return_date"],
    totalPrice: json["total_price"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "renter_id": renterId,
    "service_provider_id": serviceProviderId,
    "product_id": productId,
    "quantity": quantity,
    "package": package,
    "delivery_type": deliveryType,
    "expiry_date": expiryDate,
    "purchase_date": purchaseDate,
    "return_date": returnDate,
    "total_price": totalPrice,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
