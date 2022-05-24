import 'dart:convert';

TrueOrFalseResModel trueOrFalseResModelFromJson(String str) =>
    TrueOrFalseResModel.fromJson(json.decode(str));

String trueOrFalseResModelToJson(TrueOrFalseResModel data) =>
    json.encode(data.toJson());

class TrueOrFalseResModel {
  TrueOrFalseResModel({
    required this.statusCode,
    required this.body,
  });

  int statusCode;
  Body body;

  factory TrueOrFalseResModel.fromJson(Map<String, dynamic> json) =>
      TrueOrFalseResModel(
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
    required this.rewardPoint,
    required this.userId,
  });

  List<Item> items;
  String session;
  int level;
  int rewardPoint;
  int userId;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        session: json["session"],
        level: json["level"],
        rewardPoint: json["rewardPoint"],
        userId: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "session": session,
        "level": level,
        "rewardPoint": rewardPoint,
        "userID": userId,
      };
}

class Item {
  Item({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  String title;
  int price;
  String imageUrl;
  int id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "imageUrl": imageUrl,
        "id": id,
      };
}
