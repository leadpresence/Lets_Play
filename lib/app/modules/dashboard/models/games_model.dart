// To parse this JSON data, do
//
//     final gamesResponse = gamesResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GamesResponse gamesResponseFromJson(String str) => GamesResponse.fromJson(json.decode(str));

String gamesResponseToJson(GamesResponse data) => json.encode(data.toJson());

class GamesResponse {
  GamesResponse({
    required this.message,
    required this.statusCode,
    required this.body,
    required this.success,
  });

  String message;
  int statusCode;
  List<Body> body;
  bool success;

  factory GamesResponse.fromJson(Map<String, dynamic> json) => GamesResponse(
    message: json["message"],
    statusCode: json["statusCode"],
    body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "statusCode": statusCode,
    "body": List<dynamic>.from(body.map((x) => x.toJson())),
    "success": success,
  };
}

class Body {
  Body({
    required this.id,
    required this.category,
    required this.description,
    required this.pricelist,
    required this.price,
    required this.title,
    required this.gameCycle,
    required this.status,
    required this.winningPrice,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  Category category;
  String description;
  List<dynamic> pricelist;
  int price;
  String title;
  int gameCycle;
  String status;
  List<dynamic> winningPrice;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["_id"],
    category: Category.fromJson(json["category"]),
    description: json["description"],
    pricelist: List<dynamic>.from(json["pricelist"].map((x) => x)),
    price: json["price"],
    title: json["title"],
    gameCycle: json["gameCycle"],
    status: json["status"],
    winningPrice: List<dynamic>.from(json["winningPrice"].map((x) => x)),
    imageUrl: json["imageUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category.toJson(),
    "description": description,
    "pricelist": List<dynamic>.from(pricelist.map((x) => x)),
    "price": price,
    "title": title,
    "gameCycle": gameCycle,
    "status": status,
    "winningPrice": List<dynamic>.from(winningPrice.map((x) => x)),
    "imageUrl": imageUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Category {
  Category({
    required this.id,
    required this.title,
  });

  String id;
  String title;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
