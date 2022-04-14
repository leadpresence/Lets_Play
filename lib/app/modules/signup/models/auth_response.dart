import 'dart:convert';

// AuthResponseModel authResponseModelFromJson(String str) => AuthResponseModel.fromJson(json.decode(str));
//
// String authResponseModelToJson(AuthResponseModel data) => json.encode(data.toJson());

class AuthResponseModel {
  bool success;
  String message;
  Data data;
  AuthResponseModel( {
    required this.success,
    required this.data,
    required this.message,
  });


  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    prospectId: json["prospectId"],
    ttl: json["ttl"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "prospectId": prospectId,
    "ttl": ttl,
    "createdAt": createdAt.toIso8601String(),
  };
}