// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String status;
  int statusCode;
  String message;
  LoginData data;

  LoginModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    statusCode: json["status_code"],
    message: json["message"],
    data: LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class LoginData {
  String id;
  int userRole;
  String firstName;
  String lastName;
  String email;
  String countryCode;
  String dialCode;
  int phone;
  String password;
  String profileImg;
  String addressLine1;
  String addressLine2;
  String country;
  String province;
  String city;
  String postalCode;
  String bio;
  String foodAllergy;
  String cookingPreference;
  int agreementAccept;
  int isBlock;
  int isActive;
  int isPremiumUser;
  int notificationEnable;
  String passcode;
  String createdAt;
  String updatedAt;
  int isDeleted;
  String deletedAt;
  String lastLogin;
  String token;
  String location;
  String latitude;
  String longitude;
  String stripe_customer_id;

  LoginData({
    required this.id,
    required this.userRole,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.countryCode,
    required this.dialCode,
    required this.phone,
    required this.password,
    required this.profileImg,
    required this.addressLine1,
    required this.addressLine2,
    required this.country,
    required this.province,
    required this.city,
    required this.postalCode,
    required this.bio,
    required this.foodAllergy,
    required this.cookingPreference,
    required this.agreementAccept,
    required this.isBlock,
    required this.isActive,
    required this.isPremiumUser,
    required this.notificationEnable,
    required this.passcode,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.deletedAt,
    required this.lastLogin,
    required this.token,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.stripe_customer_id,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["id"]??"",
    userRole: json["user_role"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    countryCode: json["country_code"] ?? "",
    dialCode: json["dial_code"] ?? "",
    phone: json["phone"] ?? 0,
    password: json["password"] ?? "",
    profileImg: json["profile_img"] ?? "",
    addressLine1: json["address_line1"] ?? "",
    addressLine2: json["address_line2"] ?? "",
    country: json["country"] ?? "",
    province: json["province"] ?? "",
    city: json["city"] ?? "",
    postalCode: json["postal_code"] ?? "",
    bio: json["bio"] ?? "",
    foodAllergy: json["food_allergy"] ?? "",
    cookingPreference: json["cooking_preference"] ?? "",
    agreementAccept: json["agreement_accept"] ?? 0,
    isBlock: json["is_block"] ?? 0,
    isActive: json["is_active"] ?? 0,
    isPremiumUser: json["is_premium_user"] ?? 0,
    notificationEnable: json["notification_enable"] ?? 0,
    passcode: json["passcode"] ?? "",
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"] ?? "",
    isDeleted: json["is_deleted"] ?? 0,
    deletedAt: json["deleted_at"] ?? "",
    lastLogin: json["last_login"] ?? "",
    token: json["token"],
    latitude: json["latitude"].toString(),
    longitude: json["longitude"].toString(),
    stripe_customer_id: json["stripe_customer_id"]??"",
    location: json["location"].toString() ==null?"":json["location"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_role": userRole,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "country_code": countryCode,
    "dial_code": dialCode,
    "phone": phone,
    "password": password,
    "profile_img": profileImg,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "country": country,
    "province": province,
    "city": city,
    "postal_code": postalCode,
    "bio": bio,
    "food_allergy": foodAllergy,
    "cooking_preference": cookingPreference,
    "agreement_accept": agreementAccept,
    "is_block": isBlock,
    "is_active": isActive,
    "is_premium_user": isPremiumUser,
    "notification_enable": notificationEnable,
    "passcode": passcode,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "is_deleted": isDeleted,
    "deleted_at": deletedAt,
    "last_login": lastLogin,
    "token": token,
    "location": location,
    "latitude": latitude,
    "longitude": longitude,
    "stripe_customer_id": stripe_customer_id,
  };
}
