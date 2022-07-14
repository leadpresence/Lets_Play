// To parse this JSON data, do
//
//     final forgetPasswordResponse = forgetPasswordResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgetPasswordResponse forgetPasswordResponseFromMap(String str) => ForgetPasswordResponse.fromMap(json.decode(str));

String forgetPasswordResponseToMap(ForgetPasswordResponse data) => json.encode(data.toMap());

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.body,
  });

  int statusCode;
  bool success;
  String message;
  Body body;

  factory ForgetPasswordResponse.fromMap(Map<String, dynamic> json) => ForgetPasswordResponse(
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
    required this.reference,
  });

  String reference;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    reference: json["reference"],
  );

  Map<String, dynamic> toMap() => {
    "reference": reference,
  };
}
