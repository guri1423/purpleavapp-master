import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));


class BookingModel {
  BookingModel({
    required this.bookings,
  });

  List<Booking> bookings;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
  );


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
  String ?expiryDate;
  String ?purchaseDate;
  String ?returnDate;
  String ?totalPrice;
  String ?status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime ?updatedAt;

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


}