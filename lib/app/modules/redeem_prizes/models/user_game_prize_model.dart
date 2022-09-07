import 'dart:convert';

PlayerPrizesResponse playerPrizesResponseFromJson(String str) =>
    PlayerPrizesResponse.fromJson(json.decode(str));

String playerPrizesResponseToJson(PlayerPrizesResponse data) =>
    json.encode(data.toJson());

class PlayerPrizesResponse {
  PlayerPrizesResponse({
    required this.success,
    required this.statusCode,
    required this.body,
    required this.message,
  });

  final bool success;
  final int statusCode;
  final List<Body>? body;
  final String message;

  factory PlayerPrizesResponse.fromJson(Map<String, dynamic> json) =>
      PlayerPrizesResponse(
        success: json["success"],
        statusCode: json["statusCode"],
        body: json["body"] == null
            ? null
            : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "body": body == null
            ? null
            : List<dynamic>.from(body!.map((x) => x.toJson())),
        "message": message,
      };
}

class Body {
  Body({
    required this.id,
    required this.game,
    required this.isRedeemed,
    required this.prize,
  });

  final String id;
  final String game;
  final bool isRedeemed;
  final Prize? prize;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["_id"],
        game: json["game"],
        isRedeemed: json["isRedeemed"],
        prize: json["prize"] == null ? null : Prize.fromJson(json["prize"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "game": game,
        "isRedeemed": isRedeemed,
        "prize": prize == null ? null : prize!.toJson(),
      };
}

class Prize {
  Prize({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final String imageUrl;

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "imageUrl": imageUrl,
      };
}
