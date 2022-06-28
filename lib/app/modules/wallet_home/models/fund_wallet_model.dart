// To parse this JSON data, do
//
//     final fundWalletModel = fundWalletModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FundWalletModel fundWalletModelFromMap(String str) => FundWalletModel.fromMap(json.decode(str));

String fundWalletModelToMap(FundWalletModel data) => json.encode(data.toMap());

class FundWalletModel {
  FundWalletModel({
    required this.amount,
    required this.email,
    required this.processor,
  });

  int amount;
  String email;
  String processor;

  factory FundWalletModel.fromMap(Map<String, dynamic> json) => FundWalletModel(
    amount: json["amount"],
    email: json["email"],
    processor: json["processor"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "email": email,
    "processor": processor,
  };
}
