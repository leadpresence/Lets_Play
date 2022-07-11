import 'dart:convert';

ReferralsResponseModel referralsResponseModelFromMap(String str) => ReferralsResponseModel.fromMap(json.decode(str));

String referralsResponseModelToMap(ReferralsResponseModel data) => json.encode(data.toMap());

class ReferralsResponseModel {
  ReferralsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory ReferralsResponseModel.fromMap(Map<String, dynamic> json) => ReferralsResponseModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.guestInvites,
  });

  List<GuestInvite> guestInvites;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    guestInvites: List<GuestInvite>.from(json["guestInvites"].map((guest) => GuestInvite.fromMap(guest))),
  );

  Map<String, dynamic> toMap() => {
    "guestInvites": List<dynamic>.from(guestInvites.map((guest) => guest.toMap())),
  };
}

class GuestInvite {
  GuestInvite({
    required this.firstName,
    required this.autoUsername,
    required this.avatar,
    required this.country,
    required this.createdAt,
  });

  String firstName;
  String autoUsername;
  String avatar;
  String country;
  DateTime createdAt;

  factory GuestInvite.fromMap(Map<String, dynamic> json) => GuestInvite(
    firstName: json["firstName"],
    autoUsername: json["autoUsername"],
    avatar: json["avatar"],
    country: json["country"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toMap() => {
    "firstName": firstName,
    "autoUsername": autoUsername,
    "avatar": avatar,
    "country": country,
    "createdAt": createdAt.toIso8601String(),
  };
}
