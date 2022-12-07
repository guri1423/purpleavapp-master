

import 'dart:convert';

BookingStatusModel bookingStatusModelFromJson(String str) => BookingStatusModel.fromJson(json.decode(str));

String bookingStatusModelToJson(BookingStatusModel data) => json.encode(data.toJson());

class BookingStatusModel {
  BookingStatusModel({
    this.message,
    this.status,
    this.booking,
  });

  String? message;
  String? status;
  BookingStatusUpdate? booking;

  factory BookingStatusModel.fromJson(Map<String, dynamic> json) => BookingStatusModel(
    message: json["message"],
    status: json["status"],
    booking: BookingStatusUpdate.fromJson(json["booking"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "booking": booking!.toJson(),
  };
}

class BookingStatusUpdate {
  BookingStatusUpdate({
    this.id,
    this.renterId,
    this.serviceProviderId,
    this.productId,
    this.quantity,
    this.totalPrice,
    this.startDate,
    this.endDate,
    this.returnDate,
    this.status,
    this.deletedAt,
  });

  int? id;
  String? renterId;
  String? serviceProviderId;
  String? productId;
  String? quantity;
  String? totalPrice;
  DateTime? startDate;
  DateTime? endDate;
  String? returnDate;
  String? status;
  dynamic? deletedAt;


  factory BookingStatusUpdate.fromJson(Map<String, dynamic> json) => BookingStatusUpdate(
    id: json["id"],
    renterId: json["renter_id"],
    serviceProviderId: json["service_provider_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    totalPrice: json["total_price"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    returnDate: json["return_date"],
    status: json["status"],
    deletedAt: json["deleted_at"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "renter_id": renterId,
    "service_provider_id": serviceProviderId,
    "product_id": productId,
    "quantity": quantity,
    "total_price": totalPrice,
    "start_date": startDate!.toIso8601String(),
    "end_date": endDate!.toIso8601String(),
    "return_date": returnDate,
    "status": status,
    "deleted_at": deletedAt,

  };
}
