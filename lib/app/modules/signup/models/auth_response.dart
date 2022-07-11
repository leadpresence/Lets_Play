import 'dart:convert';

// AuthResponseModel authResponseModelFromJson(String str) => AuthResponseModel.fromJson(json.decode(str));
//
// String authResponseModelToJson(AuthResponseModel data) => json.encode(data.toJson());

class AuthResponseModel {
  bool success;
  String message;
  Data data;
  AuthResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "body": data.toJson(),
      };
}

class Data {
  Data({
    required this.reference,
  });

  String reference;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "reference": reference,
      };
}
