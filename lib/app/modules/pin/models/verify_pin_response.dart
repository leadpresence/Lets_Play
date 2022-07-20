// To parse this JSON data, do
//
//     final verifyPinResponse = verifyPinResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VerifyPinResponse verifyPinResponseFromMap(String str) => VerifyPinResponse.fromMap(json.decode(str));

String verifyPinResponseToMap(VerifyPinResponse data) => json.encode(data.toMap());

class VerifyPinResponse {
  VerifyPinResponse({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory VerifyPinResponse.fromMap(Map<String, dynamic> json) => VerifyPinResponse(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
  };
}
