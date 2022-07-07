// To parse this JSON data, do
//
//     final trueOrFalseResModel = trueOrFalseResModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TrueOrFalseResModel trueOrFalseResModelFromJson(String str) => TrueOrFalseResModel.fromJson(json.decode(str));

String trueOrFalseResModelToJson(TrueOrFalseResModel data) => json.encode(data.toJson());

class TrueOrFalseResModel {
  TrueOrFalseResModel({
    required this.statusCode,
    required this.body,
  });

  int statusCode;
  Body body;

  factory TrueOrFalseResModel.fromJson(Map<String, dynamic> json) => TrueOrFalseResModel(
    statusCode: json["statusCode"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "body": body.toJson(),
  };
}

class Body {
  Body({
    required this.items,
    required this.session,
    required this.level,
  });

  List<Item> items;
  String session;
  int level;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    session: json["session"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "session": session,
    "level": level,
  };
}

class Item {
  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.priceTag,
    required this.imageUrl,
    required this.correctOption,
    required this.suggestedPrice,
  });

  String id;
  String title;
  String description;
  int priceTag;
  String imageUrl;
  bool correctOption;
  int suggestedPrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    priceTag: json["priceTag"],
    imageUrl: json["imageUrl"],
    correctOption: json["correctOption"],
    suggestedPrice: json["suggestedPrice"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "priceTag": priceTag,
    "imageUrl": imageUrl,
    "correctOption": correctOption,
    "suggestedPrice": suggestedPrice,
  };
}
