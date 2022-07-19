import 'dart:convert';

GetAllClubMembersResponseModel getAllClubMembersResponseModelFromJson(
        String str) =>
    GetAllClubMembersResponseModel.fromJson(json.decode(str));

String getAllClubMembersResponseModelToJson(
        GetAllClubMembersResponseModel data) =>
    json.encode(data.toJson());

class GetAllClubMembersResponseModel {
  GetAllClubMembersResponseModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final bool success;
  final Data data;
  final String message;
  final int statusCode;

  factory GetAllClubMembersResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAllClubMembersResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "statusCode": statusCode,
      };
}

class Data {
  Data({
    required this.clubName,
    required this.members,
  });

  final String clubName;
  final List<Member> members;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clubName: json["clubName"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clubName": clubName,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Member {
  Member({
    required this.id,
    required this.userId,
    required this.createdAt,
  });

  final String id;
  final UserId userId;
  final DateTime createdAt;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class UserId {
  UserId({
    required this.id,
    required this.firstName,
    required this.profileUrl,
  });

  final String id;
  final String firstName;
  final String profileUrl;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        firstName: json["firstName"],
        profileUrl: json["profileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "profileUrl": profileUrl,
      };
}
