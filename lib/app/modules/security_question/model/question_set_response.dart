// To parse this JSON data, do
//
//     final QuestionSetResponse = QuestionSetResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QuestionSetResponse QuestionSetResponseFromMap(String str) => QuestionSetResponse.fromMap(json.decode(str));

String QuestionSetResponseToMap(QuestionSetResponse data) => json.encode(data.toMap());

class QuestionSetResponse {
  QuestionSetResponse({
    required this.statusCode,
    required this.success,
    required this.message,
  });

  int statusCode;
  bool success;
  String message;

  factory QuestionSetResponse.fromMap(Map<String, dynamic> json) => QuestionSetResponse(
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
