// To parse this JSON data, do
//
//     final jackpotGameResponse = jackpotGameResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JackpotGameResponse jackpotGameResponseFromJson(String str) => JackpotGameResponse.fromJson(json.decode(str));

String jackpotGameResponseToJson(JackpotGameResponse data) => json.encode(data.toJson());

class JackpotGameResponse {
  JackpotGameResponse({
    required this.message,
    required this.statusCode,
    required this.body,
    required this.success,
  });

  String message;
  int statusCode;
  List<Body> body;
  bool success;

  factory JackpotGameResponse.fromJson(Map<String, dynamic> json) => JackpotGameResponse(
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
    required this.gameId,
    required this.startDate,
    required this.endDate,
    required this.winnings,
    required this.status,
    required this.v,
  });

  String id;
  GameId gameId;
  DateTime startDate;
  DateTime endDate;
  List<dynamic> winnings;
  String status;
  int v;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["_id"],
    gameId: GameId.fromJson(json["gameID"]),
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    winnings: List<dynamic>.from(json["winnings"].map((x) => x)),
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "gameID": gameId.toJson(),
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "winnings": List<dynamic>.from(winnings.map((x) => x)),
    "status": status,
    "__v": v,
  };
}

class GameId {
  GameId({
    required this.id,
    required this.price,
    required this.title,
    required this.gameCycle,
    required this.imageUrl,
  });

  String id;
  int price;
  String title;
  int gameCycle;
  String imageUrl;

  factory GameId.fromJson(Map<String, dynamic> json) => GameId(
    id: json["_id"],
    price: json["price"],
    title: json["title"],
    gameCycle: json["gameCycle"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "price": price,
    "title": title,
    "gameCycle": gameCycle,
    "imageUrl": imageUrl,
  };
}
