// To parse this JSON data, do
//
//     final forgetPasswordResponse = forgetPasswordResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgetPasswordResponse forgetPasswordResponseFromMap(String str) => ForgetPasswordResponse.fromMap(json.decode(str));

String forgetPasswordResponseToMap(ForgetPasswordResponse data) => json.encode(data.toMap());

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory ForgetPasswordResponse.fromMap(Map<String, dynamic> json) => ForgetPasswordResponse(
    success: json["success"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.prospectId,
    required this.ttl,
    required this.createdAt,
  });

  String prospectId;
  int ttl;
  DateTime createdAt;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    prospectId: json["prospectId"],
    ttl: json["ttl"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toMap() => {
    "prospectId": prospectId,
    "ttl": ttl,
    "createdAt": createdAt.toIso8601String(),
  };
}
