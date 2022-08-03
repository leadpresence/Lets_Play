import 'dart:convert';

UnreadNotificationsResponseModel unreadNotificationsResponseModelFromJson(
        String str) =>
    UnreadNotificationsResponseModel.fromJson(json.decode(str));

String unreadNotificationsResponseModelToJson(
        UnreadNotificationsResponseModel data) =>
    json.encode(data.toJson());

class UnreadNotificationsResponseModel {
  UnreadNotificationsResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data? data;

  factory UnreadNotificationsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      UnreadNotificationsResponseModel(
        success: json["success"] == null ? null : json["success"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "statusCode": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    required this.unreadNotificationCount,
  });

  int unreadNotificationCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        unreadNotificationCount: json["unreadNotificationCount"] == null
            ? null
            : json["unreadNotificationCount"],
      );

  Map<String, dynamic> toJson() => {
        "unreadNotificationCount":
            unreadNotificationCount == null ? null : unreadNotificationCount,
      };
}
