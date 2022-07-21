import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
  NotificationsModel({
    required this.message,
    required this.success,
    required this.body,
  });

  final String message;
  final bool success;
  final Body body;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
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
    required this.notifications,
  });

  final List<Notification> notifications;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  Notification({
    required this.id,
    required this.event,
    required this.content,
    required this.seen,
    required this.createdAt,
  });

  final String id;
  final Event event;
  final String content;
  final bool seen;
  final DateTime createdAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["_id"],
    event: Event.fromJson(json["event"]),
    content: json["content"],
    seen: json["seen"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "event": event.toJson(),
    "content": content,
    "seen": seen,
    "createdAt": createdAt.toIso8601String(),
  };
}

class Event {
  Event({
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    title: json["title"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "imageUrl": imageUrl,
  };
}
