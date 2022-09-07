import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:purpleavapp/Modal/SignIn_Modal.dart';
import 'package:purpleavapp/Modal/SignUp_Modal.dart';
import 'package:purpleavapp/Modal/edit_product_modal.dart';
import 'package:purpleavapp/Modal/forgotPassword_modal.dart';
import 'package:purpleavapp/Modal/get_booking_modal.dart';
import 'package:purpleavapp/Modal/get_product_modal.dart';
import 'package:purpleavapp/Modal/post_product_model.dart';
import 'package:purpleavapp/Modal/renter_model/add_to_cart_modal.dart';
import 'package:purpleavapp/Modal/renter_model/banner_modal.dart';
import 'package:purpleavapp/Modal/renter_model/booking_model.dart';
import 'package:purpleavapp/Modal/renter_model/contact_modal.dart';
import 'package:purpleavapp/Modal/renter_model/product_model.dart';
import 'package:purpleavapp/Modal/renter_model/search_modal.dart';
import 'package:purpleavapp/Modal/review_modal.dart';
import 'package:purpleavapp/Modal/user_profile_modal.dart';
import 'package:purpleavapp/Services/storage_services.dart';

import '../Modal/renter_model/book_product_from_cart.dart';
import '../Modal/renter_model/category_search_modal.dart';
import '../Modal/renter_model/get_product_in_cart_modal.dart';

final StorageServices _services = StorageServices();

Future<ProductModel> getAllProduct() async {
  String url = "https://purpleapp.omkatech.com/api/products";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return productModelFromJson(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<ReviewModel> getAllReviews() async {
  String url = "https://purpleapp.omkatech.com/api/review";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return reviewModelFromJson(response.body);
  } else {
    throw Exception("Failed to load data");
  }
}

Future<BookingModel> getAllBooking() async {
  String url = "https://purpleapp.omkatech.com/api/bookings";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return bookingModelFromJson(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<bool?> contactDetails(Contact model) async {
  // debugPrint(model.toString());
  String url = "https://purpleapp.omkatech.com/api/contact";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    // debugPrint(jsonResponse["message"]);
    // print(response.body);

    if (jsonResponse["message"] == "Contact Added Succesfully") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to load data');
  }
}

Future<GetProductsModal> getAllProducts() async {
  String url = "https://purpleapp.omkatech.com/api/products";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return getProductsModalFromJson(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<bool?> userRegister(Register model) async {
  print(model.name);
  print(model.email);
  print(model.password);

  String url = "https://purpleapp.omkatech.com/api/register";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse["message"]);
    if (jsonResponse['message'] == "User Registered Successfully |") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception("Failed to load data");
  }
}

String getToken(Map<String, dynamic> json) => json["token"];

Future<bool?> userLogin(Login model) async {
  print(model.email);
  print(model.password);
  print(model.role);

  String url = "https://purpleapp.omkatech.com/api/login";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['message'] == "Login Successfull") {
      _services.storeToken(getToken(json.decode(response.body)));

      return true;
    } else {
      return false;
    }
  } else {
    throw Exception("Failed to load data");
  }
}

Future<bool?> userForgotPass(ForgotPasswordService model) async {
  print(model.email);

  String url = "https://purpleapp.omkatech.com/api/forgot-password";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status'] == "true") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception("Failed to load data");
  }
}

Future<bool?> newPassword(model) async {
  print(model.email);
  print(model.password);
  print(model.confirmpassword);

  String url = "https://purpleapp.omkatech.com/api/reset-password";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status'] == "true") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception("Failed to load data");
  }
}

Future<bool?> postAllProducts(GetAllProductsModel model) async {
  // debugPrint(model.toString());
  String url = "https://purpleapp.omkatech.com/api/products";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    // debugPrint(jsonResponse["message"]);
    // print(response.body);

    if (jsonResponse["message"] == "Product Added Succesfully") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to load data');
  }
}

Future<UserProfileModel> userProfile() async {
  String url = "https://purpleapp.omkatech.com/api/get_user";
  String? email = await _services.getEmail();
  debugPrint(email);
  final response = await http.post(Uri.parse(url), body: {"email": email});
  debugPrint(response.body);
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    await _services.storeUserName(jsonResponse["user"]["name"]);
    return userProfileModelFromJson(response.body);
  }
  return userProfileModelFromJson(response.body);
}

Future deleteProduct(int id) async {
  String url = "https://purpleapp.omkatech.com/api/products/$id/delete";

  print(id);

  final response = await http.get(
    Uri.parse(url),
  );

  print(response.body);

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
  }
  getAllProducts();
  print('get products  hit');
}

Future<bool?> editAllProduct(EditProduct model, int id) async {
  debugPrint(model.toJson().toString());
  String url = "https://purpleapp.omkatech.com/api/products/$id";

  print(id);

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse["message"]);
    print(response.body);
    if (jsonResponse["message"] == "Product Updated Succesfully") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to load data');
  }
}

Future<GetBannerModal> getAllbanner() async {
  String url = "https://purpleapp.omkatech.com/api/banners";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return getBannerModalFromJson(response.body);
  } else {
    throw Exception("Failed to load data");
  }
}

Future<GetBookingModal> getAllBookings() async {
  String url = "https://purpleapp.omkatech.com/api/bookings";
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);

    return getBookingModalFromJson(response.body);
  } else {
    throw Exception("Failed to load data");
  }
}

Future<GetSearchModal> searchProducts(search) async {
  print(search);

  String url = "https://purpleapp.omkatech.com/api/search/$search";

  print(search);

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(json.decode(response.body));

    print("guri");

    return getSearchModalFromJson(response.body);
  } else {
    throw Exception("Failed to load data");
  }
}

Future<GetCategoryProductModal> categorySearch(id) async {
  String url = "https://purpleapp.omkatech.com/api/category/${id}";

  final response = await http.get(Uri.parse(url));
  print(json.decode(response.body));

  print("guri");
  if (response.statusCode == 200 || response.statusCode == 400) {
    print(json.decode(response.body));

    print("guri");

    return getCategoryProductModalFromJson(response.body);
  } else {
    throw Exception("Failed to load data");
  }
}

Future<GetProductAddedToCartModal?> productToCart() async {
  print("guri");
  String url = "https://purpleapp.omkatech.com/api/cart";
  String? tokenValue = await _services.getToken();
  print(tokenValue);
  print("guri");

  final response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer $tokenValue',
  });

  print(response.body);

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    return getProductAddedToCartModalFromJson(response.body);
  }
}

Future<dynamic> productAddToCart( model) async {
  debugPrint(model.toJson().toString());
  String? tokenValue = await _services.getToken();
  debugPrint(tokenValue);

  String url = "https://purpleapp.omkatech.com/api/cart/store";

  final response =
      await http.post(Uri.parse(url), body: model.toJson(), headers: {
    'Authorization': 'Bearer $tokenValue',
  });
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse["message"]);
    debugPrint(response.body);
    if (jsonResponse["message"] == "Product Added to Cart Successfully") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to load data');
  }
}

Future deleteFromCart(int id) async {
  String url = "https://purpleapp.omkatech.com/api/cart/$id/delete";

  print(id);

  final response = await http.get(
    Uri.parse(url),
  );

  print(response.body);

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
  }
  getAllProducts();
  print('get products  hit');
}

Future<dynamic> postAllBookings( model) async {
  debugPrint(model.toJson().toString());

  String? tokenValue = await _services.getToken();
  debugPrint(tokenValue);

  String url = "https://purpleapp.omkatech.com/api/bookings";
  debugPrint("add api pressed");
  final response =
  await http.post(Uri.parse(url), body: model.toJson(), headers: {
    'Authorization': 'Bearer $tokenValue',
  });
  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse["message"]);
    debugPrint(response.body);
    debugPrint("guri");
    if (jsonResponse["message"] == "Booking Added Succesfully") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to load data');
  }
}

