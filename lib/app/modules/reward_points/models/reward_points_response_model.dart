import 'dart:convert';

RewardPointsResponseModel rewardPointsResponseModelFromJson(String str) =>
    RewardPointsResponseModel.fromJson(json.decode(str));

String rewardPointsResponseModelToJson(RewardPointsResponseModel data) =>
    json.encode(data.toJson());

class RewardPointsResponseModel {
  RewardPointsResponseModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  bool success;
  String message;
  int statusCode;
  Data? data;

  factory RewardPointsResponseModel.fromJson(Map<String, dynamic> json) =>
      RewardPointsResponseModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    required this.history,
    required this.total,
    required this.discountPercentage,
  });

  List<History>? history;
  int total;
  String discountPercentage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        history: json["history"] == null
            ? null
            : List<History>.from(
                json["history"].map((x) => History.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
        discountPercentage: json["discountPercentage"] == null
            ? null
            : json["discountPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "history": history == null
            ? null
            : List<dynamic>.from(history!.map((x) => x.toJson())),
        "total": total == null ? null : total,
        "discountPercentage":
            discountPercentage == null ? null : discountPercentage,
      };
}

class History {
  History({
    required this.id,
    required this.total,
    required this.time,
  });

  String id;
  int total;
  DateTime? time;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"] == null ? null : json["_id"],
        total: json["total"] == null ? null : json["total"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "total": total == null ? null : total,
        "time": time == null ? null : time!.toIso8601String(),
      };
}
