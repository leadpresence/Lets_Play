import 'package:meta/meta.dart';
import 'dart:convert';

import '../../select_account/models/bank_model.dart';

UserWalletModel userWalletModelFromMap(String str) => UserWalletModel.fromMap(json.decode(str));

String userWalletModelToMap(UserWalletModel data) => json.encode(data.toMap());

class UserWalletModel {
  UserWalletModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.body,
  });

  int statusCode;
  bool success;
  String message;
  Body body;

  factory UserWalletModel.fromMap(Map<String, dynamic> json) => UserWalletModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    body: Body.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "body": body.toMap(),
  };
}

class Body {
  Body({
   required this.wallet,
    required this.id,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.autoUsername,
    required this.accountStatus,
    required this.rewardPoints,
    required this.wins,
    required this.avatar,
    required this.country,
    required this.guestInvites,
    required this.inviteLink,
    required this.games,
    required this.banks,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Wallet wallet;
  String id;
  String userId;
  String firstname;
  String lastname;
  String mobile;
  String autoUsername;
  String accountStatus;
  int rewardPoints;
  int wins;
  String avatar;
  String country;
  List<dynamic> guestInvites;
  String inviteLink;
  List<dynamic> games;
  List<BankModel> banks;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    wallet: Wallet.fromMap(json["wallet"]),
    id: json["_id"],
    userId: json["userId"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    mobile: json["mobile"],
    autoUsername: json["autoUsername"],
    accountStatus: json["accountStatus"],
    rewardPoints: json["rewardPoints"],
    wins: json["wins"],
    avatar: json["avatar"],
    country: json["country"],
    guestInvites: List<dynamic>.from(json["guestInvites"].map((x) => x)),
    inviteLink: json["inviteLink"],
    games: List<dynamic>.from(json["games"].map((x) => x)),
    banks: List<BankModel>.from(json["banks"].map((bank) => BankModel.fromMap(bank))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "wallet": wallet.toMap(),
    "_id": id,
    "userId": userId,
    "firstname": firstname,
    "lastname": lastname,
    "mobile": mobile,
    "autoUsername": autoUsername,
    "accountStatus": accountStatus,
    "rewardPoints": rewardPoints,
    "wins": wins,
    "avatar": avatar,
    "country": country,
    "guestInvites": List<dynamic>.from(guestInvites.map((x) => x)),
    "inviteLink": inviteLink,
    "games": List<dynamic>.from(games.map((x) => x)),
    "banks": List<dynamic>.from(banks.map((bank) => bank.toMap())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Wallet {
  Wallet({
    required this.balance,
  });

  int balance;

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
    balance: json["balance"],
  );

  Map<String, dynamic> toMap() => {
    "balance": balance,
  };
}
