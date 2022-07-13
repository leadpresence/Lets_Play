// To parse this JSON data, do
//
//     final userWalletModel = userWalletModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserWalletModel userWalletModelFromMap(String str) => UserWalletModel.fromMap(json.decode(str));

String userWalletModelToMap(UserWalletModel data) => json.encode(data.toMap());

class UserWalletModel {
  UserWalletModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.body,
  });

  int statusCode;
  bool success;
  String message;
  Body body;

  factory UserWalletModel.fromMap(Map<String, dynamic> json) => UserWalletModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    body: Body.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "body": body.toMap(),
  };
}

class Body {
  Body({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.profileUrl,
    required this.isEmailVerified,
    required this.rewardPoint,
    required this.referralCount,
    required this.referralCode,
    required this.email,
    required this.wallet,
    required this.banks,
  });

  String id;
  String firstName;
  String lastName;
  String phone;
  String profileUrl;
  bool isEmailVerified;
  int rewardPoint;
  int referralCount;
  String referralCode;
  String email;
  Wallet wallet;
  List<dynamic> banks;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    profileUrl: json["profileUrl"],
    isEmailVerified: json["isEmailVerified"],
    rewardPoint: json["rewardPoint"],
    referralCount: json["referralCount"],
    referralCode: json["referralCode"],
    email: json["email"],
    wallet: Wallet.fromMap(json["wallet"]),
    banks: List<dynamic>.from(json["banks"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "profileUrl": profileUrl,
    "isEmailVerified": isEmailVerified,
    "rewardPoint": rewardPoint,
    "referralCount": referralCount,
    "referralCode": referralCode,
    "email": email,
    "wallet": wallet.toMap(),
    "banks": List<dynamic>.from(banks.map((x) => x)),
  };
}

class Wallet {
  Wallet({
    required this.balance,
  });

  int balance;

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
    balance: json["balance"],
  );

  Map<String, dynamic> toMap() => {
    "balance": balance,
  };
}
