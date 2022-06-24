// To parse this JSON data, do
//
//     final withdrawalModel = withdrawalModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WithdrawalModel withdrawalModelFromMap(String str) => WithdrawalModel.fromMap(json.decode(str));

String withdrawalModelToMap(WithdrawalModel data) => json.encode(data.toMap());

class WithdrawalModel {
  WithdrawalModel({
    required this.amount,
    required this.email,
    required this.bankCode,
    required this.accountNumber,
  });

  int amount;
  String email;
  String bankCode;
  String accountNumber;

  factory WithdrawalModel.fromMap(Map<String, dynamic> json) => WithdrawalModel(
    amount: json["amount"],
    email: json["email"],
    bankCode: json["bankCode"],
    accountNumber: json["accountNumber"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "email": email,
    "bankCode": bankCode,
    "accountNumber": accountNumber,
  };
}
