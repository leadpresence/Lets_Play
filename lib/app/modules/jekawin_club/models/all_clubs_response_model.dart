import 'dart:convert';

AllClubsResponseModel allClubsResponseModelFromJson(String str) =>
    AllClubsResponseModel.fromJson(json.decode(str));

String allClubsResponseModelToJson(AllClubsResponseModel data) =>
    json.encode(data.toJson());

class AllClubsResponseModel {
  AllClubsResponseModel({
    required this.success,
    required this.statusCode,
    required this.body,
    required this.message,
  });

  final bool success;
  final int statusCode;
  final List<Body> body;
  final String message;

  factory AllClubsResponseModel.fromJson(Map<String, dynamic> json) =>
      AllClubsResponseModel(
        success: json["success"],
        statusCode: json["statusCode"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "message": message,
      };
}

class Body {
  Body({
    required this.id,
    required this.title,
    required this.minPoint,
    required this.imageUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String title;
  final int minPoint;
  final String imageUrl;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["_id"],
        title: json["title"],
        minPoint: json["minPoint"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "minPoint": minPoint,
        "imageUrl": imageUrl,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
