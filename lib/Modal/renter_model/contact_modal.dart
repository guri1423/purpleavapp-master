import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  ContactModel({
    required this.contact,
  });

  List<Contact> contact;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    contact: List<Contact>.from(json["contact"].map((x) => Contact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contact": List<dynamic>.from(contact.map((x) => x.toJson())),
  };
}

class Contact {
  Contact({

    this.name,
    this.email,
    this.phone,
    this.message,

  });


  String? name;
  String? email;
  String? phone;
  String? message;


  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "message": message,
  };
}

