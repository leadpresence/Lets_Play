// To parse this JSON data, do
//
//     final forgetPasswordOtpResponse = forgetPasswordOtpResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgetPasswordOtpResponse forgetPasswordOtpResponseFromMap(String str) => ForgetPasswordOtpResponse.fromMap(json.decode(str));

String forgetPasswordOtpResponseToMap(ForgetPasswordOtpResponse data) => json.encode(data.toMap());

class ForgetPasswordOtpResponse {
  ForgetPasswordOtpResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.body,
  });

  bool success;
  int statusCode;
  String message;
  Body body;

  factory ForgetPasswordOtpResponse.fromMap(Map<String, dynamic> json) => ForgetPasswordOtpResponse(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    body: Body.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "body": body.toMap(),
  };
}

class Body {
  Body({
    required this.token,
  });

  String token;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
  };
}
