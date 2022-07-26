import 'dart:convert';

NotificationDetailModel notificationDetailModelFromJson(String str) => NotificationDetailModel.fromJson(json.decode(str));

String notificationDetailModelToJson(NotificationDetailModel data) => json.encode(data.toJson());

class NotificationDetailModel {
  NotificationDetailModel({
    required this.message,
    required this.success,
    required this.body,
  });

  final String message;
  final bool success;
  final Body body;

  factory NotificationDetailModel.fromJson(Map<String, dynamic> json) => NotificationDetailModel(
    message: json["message"],
    success: json["success"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "body": body.toJson(),
  };
}

class Body {
  Body({
    required this.notification,
  });

  final Notification notification;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    notification: Notification.fromJson(json["notification"]),
  );

  Map<String, dynamic> toJson() => {
    "notification": notification.toJson(),
  };
}

class Notification {
  Notification({
    required this.id,
    required this.event,
    required this.content,
    required this.seen,
    required this.createdAt,
    required this.readAt,
  });

  final String id;
  final Event event;
  final String content;
  final bool seen;
  final DateTime createdAt;
  DateTime? readAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["_id"],
    event: Event.fromJson(json["event"]),
    content: json["content"],
    seen: json["seen"],
    createdAt: DateTime.parse(json["createdAt"]),
    readAt: DateTime.parse(json["readAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "event": event.toJson(),
    "content": content,
    "seen": seen,
    "createdAt": createdAt.toIso8601String(),
    "readAt": readAt!.toIso8601String(),
  };
}

class Event {
  Event({
    required this.id,
    required this.imageUrl,
  });

  final String id;
  final String imageUrl;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["_id"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "imageUrl": imageUrl,
  };
}
