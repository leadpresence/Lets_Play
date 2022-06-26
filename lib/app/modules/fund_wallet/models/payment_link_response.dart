import 'package:meta/meta.dart';
import 'dart:convert';

PaymentLinkResponseModel paymentLinkResponseModelFromMap(String str) => PaymentLinkResponseModel.fromMap(json.decode(str));

String paymentLinkResponseModelToMap(PaymentLinkResponseModel data) => json.encode(data.toMap());

class PaymentLinkResponseModel {
  PaymentLinkResponseModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.body,
  });

  int statusCode;
  bool success;
  String message;
  Body body;

  factory PaymentLinkResponseModel.fromMap(Map<String, dynamic> json) => PaymentLinkResponseModel(
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
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    status: json["status"],
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.link,
  });

  String link;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    link: json["link"],
  );

  Map<String, dynamic> toMap() => {
    "link": link,
  };
}
