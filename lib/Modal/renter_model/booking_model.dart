
import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    this.bookings,
  });

  List<BookingServiceProvider>? bookings;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    bookings: List<BookingServiceProvider>.from(json["bookings"].map((x) => BookingServiceProvider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookings": List<dynamic>.from(bookings!.map((x) => x.toJson())),
  };
}

class BookingServiceProvider {
  BookingServiceProvider({
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
    this.service,
    this.renter,
    this.product,
  });

  int? id;
  String? renterId;
  String? serviceProviderId;
  String? productId;
  String? quantity;
  String? totalPrice;
  DateTime? startDate;
  DateTime? endDate;
  dynamic? returnDate;
  String? status;
  dynamic? deletedAt;
  Renter? service;
  Renter? renter;
  Product? product;

  factory BookingServiceProvider.fromJson(Map<String, dynamic> json) => BookingServiceProvider(
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
    service: Renter.fromJson(json["service"]),
    renter: Renter.fromJson(json["renter"]),
    product: Product.fromJson(json["product"]),
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
    "service": service!.toJson(),
    "renter": renter!.toJson(),
    "product": product!.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.serviceProviderId,
    this.model,
    this.brand,
    this.manualPdf,
    this.oneDayPrice,
    this.inventory,
    this.delivery,
    this.shippingCost,
    this.moreInfo,
    this.termsConditions,
    this.categoryId,
    this.productImages,
  });

  int? id;
  String? name;
  String? serviceProviderId;
  String? model;
  String? brand;
  dynamic? manualPdf;
  String? oneDayPrice;
  String? inventory;
  dynamic? delivery;
  dynamic? shippingCost;
  String? moreInfo;
  String? termsConditions;
  String? categoryId;
  List<ProductImage>? productImages;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    serviceProviderId: json["service_provider_id"],
    model: json["model"],
    brand: json["brand"],
    manualPdf: json["manual_pdf"],
    oneDayPrice: json["one_day_price"],
    inventory: json["inventory"],
    delivery: json["delivery"],
    shippingCost: json["shipping_cost"],
    moreInfo: json["more_info"],
    termsConditions: json["terms_conditions"],
    categoryId: json["category_id"],
    productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "service_provider_id": serviceProviderId,
    "model": model,
    "brand": brand,
    "manual_pdf": manualPdf,
    "one_day_price": oneDayPrice,
    "inventory": inventory,
    "delivery": delivery,
    "shipping_cost": shippingCost,
    "more_info": moreInfo,
    "terms_conditions": termsConditions,
    "category_id": categoryId,
    "product_images": List<dynamic>.from(productImages!.map((x) => x.toJson())),
  };
}

class ProductImage {
  ProductImage({
    this.id,
    this.url,
    this.productId,
  });

  int? id;
  String? url;
  String? productId;


  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    url: json["url"],
    productId: json["product_id"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "product_id": productId,

  };
}

class Renter {
  Renter({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.profilePic,

  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? profilePic;


  factory Renter.fromJson(Map<String, dynamic> json) => Renter(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],
    profilePic: json["profile_pic"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "role": role,
    "profile_pic": profilePic,

  };
}
