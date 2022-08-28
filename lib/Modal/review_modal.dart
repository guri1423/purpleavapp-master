

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));



class ReviewModel {
  ReviewModel({
   required this.review,
  });

  List<Review> review;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    review: List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
  );


}

class Review {
  Review({

    this.name,
    this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
  });


  String ?name;
  String ?rating;
  String ?review;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(

    name: json["name"],
    rating: json["rating"],
    review: json["review"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );


}
