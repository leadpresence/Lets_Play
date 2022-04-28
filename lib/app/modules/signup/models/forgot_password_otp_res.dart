import 'package:meta/meta.dart';
import 'dart:convert';

ForgetPasswordOtpResponse forgetPasswordOtpResponseFromMap(String str) => ForgetPasswordOtpResponse.fromMap(json.decode(str));

String forgetPasswordOtpResponseToMap(ForgetPasswordOtpResponse data) => json.encode(data.toMap());

class
ForgetPasswordOtpResponse {
  ForgetPasswordOtpResponse({
   required this.success,
   required this.token,
   required this.validity,
   required this.message,
  });

  bool success;
  String token;
  String validity;
  String message;

  factory ForgetPasswordOtpResponse.fromMap(Map<String, dynamic> json) => ForgetPasswordOtpResponse(
    success: json["success"],
    token: json["token"],
    validity: json["validity"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "token": token,
    "validity": validity,
    "message": message,
  };
}
