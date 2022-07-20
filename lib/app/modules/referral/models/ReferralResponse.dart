
import 'dart:convert';

ReferralsResponse referralsResponseFromMap(String str) => ReferralsResponse.fromMap(json.decode(str));

String referralsResponseToMap(ReferralsResponse data) => json.encode(data.toMap());

class ReferralsResponse {
  ReferralsResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.body,
  });

  bool success;
  int statusCode;
  String message;
  Body body;

  factory ReferralsResponse.fromMap(Map<String, dynamic> json) => ReferralsResponse(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    body: Body.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "body": body.toMap(),
  };
}

class Body {
  Body({
    required this.referrals,
  });

  List<Referral> referrals;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    referrals: List<Referral>.from(json["referrals"].map((x) => Referral.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "referrals": List<dynamic>.from(referrals.map((x) => x.toMap())),
  };
}

class Referral {
  Referral({
    required this.id,
    required this.referred,
    required this.referrer,
    required this.isActive,
    required this.rewardPoint,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  Referre referred;
  Referre referrer;
  bool isActive;
  int rewardPoint;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Referral.fromMap(Map<String, dynamic> json) => Referral(
    id: json["_id"],
    referred: Referre.fromMap(json["referred"]),
    referrer: Referre.fromMap(json["referrer"]),
    isActive: json["isActive"],
    rewardPoint: json["rewardPoint"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "referred": referred.toMap(),
    "referrer": referrer.toMap(),
    "isActive": isActive,
    "rewardPoint": rewardPoint,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Referre {
  Referre({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  String id;
  String firstName;
  String lastName;

  factory Referre.fromMap(Map<String, dynamic> json) => Referre(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
  };
}
