// To parse this JSON data, do
//
//     final verifiedEmailResponse = verifiedEmailResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VerifiedEmailResponse verifiedEmailResponseFromMap(String str) => VerifiedEmailResponse.fromMap(json.decode(str));

String verifiedEmailResponseToMap(VerifiedEmailResponse data) => json.encode(data.toMap());

class VerifiedEmailResponse {
  VerifiedEmailResponse({
    required this.message,
    required this.body,
  });

  String message;
  Body body;

  factory VerifiedEmailResponse.fromMap(Map<String, dynamic> json) => VerifiedEmailResponse(
    message: json["message"],
    body: Body.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "body": body.toMap(),
  };
}

class Body {
  Body({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.isEmailVerified,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  bool isEmailVerified;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    isEmailVerified: json["isEmailVerified"],
  );

  Map<String, dynamic> toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "isEmailVerified": isEmailVerified,
  };
}
