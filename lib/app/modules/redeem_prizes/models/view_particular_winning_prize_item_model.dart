import 'dart:convert';

ViewWinningPrizeItemModel viewWinningPrizeItemModelFromJson(String str) => ViewWinningPrizeItemModel.fromJson(json.decode(str));

String viewWinningPrizeItemModelToJson(ViewWinningPrizeItemModel data) => json.encode(data.toJson());

class ViewWinningPrizeItemModel {
  ViewWinningPrizeItemModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final bool success;
  final Data? data;
  final String message;
  final int statusCode;

  factory ViewWinningPrizeItemModel.fromJson(Map<String, dynamic> json) => ViewWinningPrizeItemModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? null : data!.toJson(),
    "message": message,
    "statusCode": statusCode,
  };
}

class Data {
  Data({
    required this.delivery,
    required this.id,
    required this.player,
    required this.game,
    required this.openGame,
    required this.gameBoard,
    required this.isRedeemed,
    required this.prize,
    required this.gamePrize,
    required this.v,
    required this.dateRedeemed,
  });

  final Delivery? delivery;
  final String id;
  final String player;
  final String game;
  final String openGame;
  final String gameBoard;
  final bool isRedeemed;
  final Prize? prize;
  final String gamePrize;
  final int v;
  final DateTime? dateRedeemed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    delivery: json["delivery"] == null ? null : Delivery.fromJson(json["delivery"]),
    id: json["_id"],
    player: json["player"],
    game: json["game"],
    openGame: json["openGame"],
    gameBoard: json["gameBoard"],
    isRedeemed: json["isRedeemed"],
    prize: json["prize"] == null ? null : Prize.fromJson(json["prize"]),
    gamePrize: json["gamePrize"],
    v: json["__v"],
    dateRedeemed: json["dateRedeemed"] == null ? null : DateTime.parse(json["dateRedeemed"]),
  );

  Map<String, dynamic> toJson() => {
    "delivery": delivery == null ? null : delivery!.toJson(),
    "_id": id,
    "player": player,
    "game": game,
    "openGame": openGame,
    "gameBoard": gameBoard,
    "isRedeemed": isRedeemed,
    "prize": prize == null ? null : prize!.toJson(),
    "gamePrize": gamePrize,
    "__v": v,
    "dateRedeemed": dateRedeemed == null ? null : dateRedeemed!.toIso8601String(),
  };
}

class Delivery {
  Delivery({
    required this.type,
    required this.address,
    required this.phoneNumber,
    required this.comment,
  });

  final String type;
  final String address;
  final String phoneNumber;
  final String comment;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    type: json["type"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "address": address,
    "phoneNumber": phoneNumber,
    "comment": comment,
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
