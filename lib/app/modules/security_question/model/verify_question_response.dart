// To parse this JSON data, do
//
//     final verifyQuestionResponse = verifyQuestionResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VerifyQuestionResponse verifyQuestionResponseFromMap(String str) => VerifyQuestionResponse.fromMap(json.decode(str));

String verifyQuestionResponseToMap(VerifyQuestionResponse data) => json.encode(data.toMap());

class VerifyQuestionResponse {
  VerifyQuestionResponse({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory VerifyQuestionResponse.fromMap(Map<String, dynamic> json) => VerifyQuestionResponse(
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
