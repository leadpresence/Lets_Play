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

