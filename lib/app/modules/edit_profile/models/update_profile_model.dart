// To parse this JSON data, do
//
//     final updateProfileResponseModel = updateProfileResponseModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateProfileResponseModel updateProfileResponseModelFromMap(String str) => UpdateProfileResponseModel.fromMap(json.decode(str));

String updateProfileResponseModelToMap(UpdateProfileResponseModel data) => json.encode(data.toMap());

class UpdateProfileResponseModel {
  UpdateProfileResponseModel({
    required this.message,
    required this.statusCode,
    required this.body,
    required this.success,
  });

  final String message;
  final int statusCode;
  final Body body;
  final bool success;

  factory UpdateProfileResponseModel.fromMap(Map<String, dynamic> json) => UpdateProfileResponseModel(
    message: json["message"],
    statusCode: json["statusCode"],
    body: Body.fromMap(json["body"]),
    success: json["success"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "statusCode": statusCode,
    "body": body.toMap(),
    "success": success,
  };
}

class Body {
  Body({
    required this.data,
  });

  final Data data;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
    required this.profileUrl,
    required this.isEmailVerified,
    required this.rewardPoint,
    required this.referralCount,
    required this.referralCode,
    required this.v,
    required this.subscriberId,
    required this.email,
    required this.gender,
    required this.residentialAddress,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String password;
  final String phone;
  final String profileUrl;
  final bool isEmailVerified;
  final int rewardPoint;
  final int referralCount;
  final String referralCode;
  final int v;
  final String subscriberId;
  final String email;
  final String gender;
  final String residentialAddress;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    password: json["password"],
    phone: json["phone"],
    profileUrl: json["profileUrl"],
    isEmailVerified: json["isEmailVerified"],
    rewardPoint: json["rewardPoint"],
    referralCount: json["referralCount"],
    referralCode: json["referralCode"],
    v: json["__v"],
    subscriberId: json["subscriberId"],
    email: json["email"],
    gender: json["gender"],
    residentialAddress: json["residentialAddress"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "password": password,
    "phone": phone,
    "profileUrl": profileUrl,
    "isEmailVerified": isEmailVerified,
    "rewardPoint": rewardPoint,
    "referralCount": referralCount,
    "referralCode": referralCode,
    "__v": v,
    "subscriberId": subscriberId,
    "email": email,
    "gender": gender,
    "residentialAddress": residentialAddress,
  };
}
