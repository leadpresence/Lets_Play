import 'dart:convert';

// AuthResponseModel authResponseModelFromJson(String str) => AuthResponseModel.fromJson(json.decode(str));
//
// String authResponseModelToJson(AuthResponseModel data) => json.encode(data.toJson());

class AuthResponseModel {
  bool success;
  String message;
  Body body;
  AuthResponseModel( {
    required this.success,
    required this.body,
    required this.message,
  });


  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
    success: json["success"],
    message: json["message"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "body": body.toJson(),
  };
}

class Body {
  Body({
    required this.reference,
  });

  String reference;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "reference": reference,
  };
}