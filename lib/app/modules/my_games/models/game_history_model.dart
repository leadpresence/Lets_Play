// To parse this JSON data, do
//
//     final gameHistory = gameHistoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GameHistory gameHistoryFromJson(String str) =>
    GameHistory.fromJson(json.decode(str));

String gameHistoryToJson(GameHistory data) => json.encode(data.toJson());

class GameHistory {
  GameHistory({
    this.statusCode,
    this.body,
    this.success,
  });

  int? statusCode;
  Body? body;
  bool? success;

  factory GameHistory.fromJson(Map<String, dynamic> json) => GameHistory(
        statusCode: json["statusCode"],
        body: Body.fromJson(json["body"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "body": body!.toJson(),
        "success": success,
      };
}

class Body {
  Body({
    this.games,
  });

  List<Game>? games;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "games": List<dynamic>.from(games!.map((x) => x.toJson())),
      };
}

class Game {
  Game({
    this.id,
    this.ogId,
    this.gameId,
    this.userId,
    this.tickets,
    this.status,
    this.duration,
    this.amount,
    this.userGuesses,
    this.isCompleted,
    this.datePlayed,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? ogId;
  dynamic gameId;
  String? userId;
  List<List<int>>? tickets;
  String? status;
  int? duration;
  int? amount;
  List<dynamic>? userGuesses;
  bool? isCompleted;
  DateTime? datePlayed;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["_id"],
        ogId: json["ogId"],
        gameId: json["gameID"],
        userId: json["userID"],
        tickets: List<List<int>>.from(
            json["tickets"].map((x) => List<int>.from(x.map((x) => x)))),
        status: json["status"],
        duration: json["duration"] == null ? null : json["duration"],
        amount: json["amount"] == null ? null : json["amount"],
        userGuesses: List<dynamic>.from(json["userGuesses"].map((x) => x)),
        isCompleted: json["isCompleted"],
        datePlayed: DateTime.parse(json["datePlayed"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ogId": ogId,
        "gameID": gameId == null ? null : gameId!.toJson(),
        "userID": userId,
        "tickets": List<dynamic>.from(
            tickets!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "status": status,
        "duration": duration == null ? null : duration,
        "amount": amount == null ? null : amount,
        "userGuesses": List<dynamic>.from(userGuesses!.map((x) => x)),
        "isCompleted": isCompleted,
        "datePlayed": datePlayed!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class GameId {
  GameId({
    required this.id,
    required this.title,
  });

  String id;
  String title;

  factory GameId.fromJson(Map<String, dynamic> json) => GameId(
        id: json["_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
      };
}
