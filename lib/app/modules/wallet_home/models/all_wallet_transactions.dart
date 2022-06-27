// To parse this JSON data, do
//
//     final allTransactionsModel = allTransactionsModelFromMap(jsonString);

import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/transaction_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AllTransactionsModel allTransactionsModelFromMap(String str) => AllTransactionsModel.fromMap(json.decode(str));

String allTransactionsModelToMap(AllTransactionsModel data) => json.encode(data.toMap());

class AllTransactionsModel {
  AllTransactionsModel({
    required this.message,
    required this.success,
    required this.body,
    required this.statusCode,
  });

  String message;
  bool success;
  List<TransactionsModel> body;
  int statusCode;

  factory AllTransactionsModel.fromMap(Map<String, dynamic> json) => AllTransactionsModel(
    message: json["message"],
    success: json["success"],
    body: List<TransactionsModel>.from(json["body"].map((x) => TransactionsModel.fromMap(x))),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "success": success,
    "body": List<dynamic>.from(body.map((x) => x.toMap())),
    "statusCode": statusCode,
  };
}

class Body {
  Body({
    required this.id,
    required this.user,
    required this.transactionRef,
    required this.processor,
    required this.status,
    required this.currency,
    required this.amount,
    required this.transactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String user;
  String transactionRef;
  String processor;
  String status;
  String currency;
  int amount;
  int transactionType;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    id: json["_id"],
    user: json["user"],
    transactionRef: json["transactionRef"],
    processor: json["processor"],
    status: json["status"],
    currency: json["currency"],
    amount: json["amount"],
    transactionType: json["transactionType"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user,
    "transactionRef": transactionRef,
    "processor": processor,
    "status": status,
    "currency": currency,
    "amount": amount,
    "transactionType": transactionType,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
