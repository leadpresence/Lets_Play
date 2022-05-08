import 'dart:convert';

JackpotGameModel jackpotGameModelFromJson(String str) =>
    JackpotGameModel.fromJson(json.decode(str));

String jackpotGameModelToJson(JackpotGameModel data) =>
    json.encode(data.toJson());

class JackpotGameModel {
  JackpotGameModel({
    required this.message,
    required this.statusCode,
    required this.body,
    required this.success,
  });

  String message;
  int statusCode;
  Body body;
  bool success;

  factory JackpotGameModel.fromJson(Map<String, dynamic> json) =>
      JackpotGameModel(
        message: json["message"],
        statusCode: json["statusCode"],
        body: Body.fromJson(json["body"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "body": body.toJson(),
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
  String gameId;
  DateTime startDate;
  DateTime endDate;
  List<dynamic> winnings;
  String status;
  int v;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["_id"],
        gameId: json["gameID"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        winnings: List<dynamic>.from(json["winnings"].map((x) => x)),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "gameID": gameId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "winnings": List<dynamic>.from(winnings.map((x) => x)),
        "status": status,
        "__v": v,
      };
}
