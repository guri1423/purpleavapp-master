
import 'dart:convert';

GetBookingModal getBookingModalFromJson(String str) => GetBookingModal.fromJson(json.decode(str));


class GetBookingModal {
  GetBookingModal({
    this.bookings,
  });

  List<Booking>? bookings;

  factory GetBookingModal.fromJson(Map<String, dynamic> json) => GetBookingModal(
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
  );

}

class Booking {
  Booking({
    this.id,
    this.renterId,
    this.productId,
    this.quantity,
    this.totalPrice,
    this.status,
    this.deletedAt,
    this.product,
    this.renter,
  });

  int? id;
  String? renterId;
  String? productId;
  String? quantity;
  String? totalPrice;
  String? status;
  dynamic? deletedAt;
  Product? product;
  Renter? renter;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    renterId: json["renter_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    totalPrice: json["total_price"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    product: Product.fromJson(json["product"]),
    renter: Renter.fromJson(json["renter"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "renter_id": renterId,
    "product_id": productId,
    "quantity": quantity,
    "total_price": totalPrice,
    "status": status,
    "deleted_at": deletedAt,
    "product": product!.toJson(),
    "renter": renter!.toJson(),
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
    this.service,
    this.productImages,
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
  dynamic? shippingCost;
  String? moreInfo;
  String? termsConditions;
  String? categoryId;
  Renter? service;
  List<ProductImage>? productImages;

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
    service: Renter.fromJson(json["service"]),
    productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "service_provider_id": serviceProviderId,
    "model":model,
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
    "service": service!.toJson(),
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
  dynamic? profilePic;



  factory Renter.fromJson(Map<String, dynamic> json) => Renter(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "role": role,

  };
}




