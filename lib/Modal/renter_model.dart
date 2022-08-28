

import 'dart:convert';

RenterModel renterModelFromJson(String str) => RenterModel.fromJson(json.decode(str));

String renterModelToJson(RenterModel data) => json.encode(data.toJson());

class RenterModel {
  RenterModel({
    required this.renter,
  });

  List<Renter> renter;

  factory RenterModel.fromJson(Map<String, dynamic> json) => RenterModel(
    renter: List<Renter>.from(json["renter"].map((x) => Renter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "renter": List<dynamic>.from(renter.map((x) => x.toJson())),
  };
}

class Renter {
  Renter({
    required  this.id,
    required  this.fullName,
    required  this.email,
    required  this.phone,
    required  this.profilePic,
    required  this.paymentStatus,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String fullName;
  String email;
  String phone;
  ProfilePic profilePic;
  PaymentStatus paymentStatus;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Renter.fromJson(Map<String, dynamic> json) => Renter(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    profilePic: profilePicValues.map[json["profile_pic"]]!,
    paymentStatus: paymentStatusValues.map[json["payment_status"]]!,
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "profile_pic": profilePicValues.reverse[profilePic],
    "payment_status": paymentStatusValues.reverse[paymentStatus],
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum PaymentStatus { PROCESSED }

final paymentStatusValues = EnumValues({
  "Processed": PaymentStatus.PROCESSED
});

enum ProfilePic { IMAGES_SERVICES_1655384311_PNG }

final profilePicValues = EnumValues({
  "images/services/1655384311.png": ProfilePic.IMAGES_SERVICES_1655384311_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map,);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
