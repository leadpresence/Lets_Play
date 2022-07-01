// To parse this JSON data, do
//
//     final banksResponseModel = banksResponseModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BanksResponseModel banksResponseModelFromMap(String str) => BanksResponseModel.fromMap(json.decode(str));

String banksResponseModelToMap(BanksResponseModel data) => json.encode(data.toMap());

class BanksResponseModel {
  BanksResponseModel({
    required this.message,
    required this.body,
    required this.success,
    required this.statusCode,
  });

  String message;
  Body body;
  bool success;
  int statusCode;

  factory BanksResponseModel.fromMap(Map<String, dynamic> json) => BanksResponseModel(
    message: json["message"],
    body: Body.fromMap(json["body"]),
    success: json["success"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "body": body.toMap(),
    "success": success,
    "statusCode": statusCode,
  };
}

class Body {
  Body({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Bank> data;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    status: json["status"],
    message: json["message"],
    data: List<Bank>.from(json["data"].map((x) => Bank.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Bank {
  Bank({
    required this.id,
    required this.code,
    required this.name,
  });

  int id;
  String code;
  String name;

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
    id: json["id"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "code": code,
    "name": name,
  };
}
