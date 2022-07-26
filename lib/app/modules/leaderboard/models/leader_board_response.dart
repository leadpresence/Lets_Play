// To parse this JSON data, do
//
//     final leaderBoardResponse = leaderBoardResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LeaderBoardResponse leaderBoardResponseFromMap(String str) => LeaderBoardResponse.fromMap(json.decode(str));

String leaderBoardResponseToMap(LeaderBoardResponse data) => json.encode(data.toMap());

class LeaderBoardResponse {
  LeaderBoardResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  bool success;
  int statusCode;
  String message;
  List<ScoreItem> data;

  factory LeaderBoardResponse.fromMap(Map<String, dynamic> json) => LeaderBoardResponse(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<ScoreItem>.from(json["data"].map((item) => ScoreItem.fromMap(item))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((item) => item.toMap())),
  };
}

class ScoreItem {
  ScoreItem({
    required this.score,
    required this.userName,
    required this.imageUrl,
    required this.phone,
    required this.highlight,
  });

  int score;
  String userName;
  String imageUrl;
  String phone;
  bool highlight;

  factory ScoreItem.fromMap(Map<String, dynamic> json) => ScoreItem(
    score: json["score"],
    userName: json["userName"],
    imageUrl: json["imageUrl"],
    phone: json["phone"],
    highlight: json["highlight"] == null ? null : json["highlight"],
  );

  Map<String, dynamic> toMap() => {
    "score": score,
    "userName": userName,
    "imageUrl": imageUrl,
    "phone": phone,
    "highlight": highlight == null ? null : highlight,
  };
}
