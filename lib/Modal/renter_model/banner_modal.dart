
import 'dart:convert';

GetBannerModal getBannerModalFromJson(String str) => GetBannerModal.fromJson(json.decode(str));


class GetBannerModal {
  GetBannerModal({
    required this.message,
    required this.status,
    required this.banner,
  });

  String message;
  String status;
  List<Banner> banner;

  factory GetBannerModal.fromJson(Map<String, dynamic> json) => GetBannerModal(
    message: json["message"],
    status: json["status"],
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
  );

}

class Banner {
  Banner({
    this.id,
    this.title,
    this.banner,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? banner;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    title: json["title"],
    banner: json["banner"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );


}
