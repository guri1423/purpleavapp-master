import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  UserRegisterModel({
    required this.user,
    required this.token,
    required this.message,
  });

  User user;
  String token;
  String message;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
    "message": message,
  };
}

class User {
  User({
    this.name,
    this.phone,
    this.email,
    this.role,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.profilePic,
  });

  String? name;
  String? phone;
  String? email;
  String? role;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? profilePic;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    role: json["role"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    profilePic: json["profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "role": role,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
    "profile_pic": profilePic,
  };
}
