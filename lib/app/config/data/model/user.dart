 import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../utils/type_id.dart';

part 'user.g.dart';

@HiveType(typeId: TypeId.user, adapterName: 'UserAdapter')
class User extends Equatable {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? firstName = "";
  @HiveField(2)
  String? lastName = "";
  @HiveField(3)
  String? mobile = "";
  @HiveField(4)
  String email = "";
  @HiveField(5)
  String? role = "";
  @HiveField(6)
  String? token = "";
  @HiveField(7)
  String? password = "";
  @HiveField(8)
  String? gender = "";
  @HiveField(9)
  String? address = "";
  @HiveField(10)
  String? autoUsername = "";
  @HiveField(11)
  bool? phoneVerified = false;
  @HiveField(12)
  String? status = "";
  @HiveField(14)
  String? avatar = "";
  @HiveField(15)
  bool? emailVerified = false;
  @HiveField(13)
  int? wins = -1;
  @HiveField(16)
  DateTime? createdAt;
  @HiveField(17)
  String? country = "";
  @HiveField(18)
  String? inviteLink = "";
  @HiveField(19)
  int? rewardPoints = -1;

  User({
    this.id,
    this.avatar,
    this.firstName,
    this.lastName,
    this.mobile,
    this.autoUsername,
    this.rewardPoints,
    this.role,
    this.wins,
    this.country,
    this.inviteLink,
    this.gender,
    this.address,
    this.emailVerified,
    this.phoneVerified,
    this.status,
    this.createdAt,
    this.token,
  });

  User.fromMap(Map<String, dynamic> json) {
    id = json["_id"];
    avatar = json["avatar"];
    firstName = json["firstname"];
    firstName = json["lastName"];
    mobile = json["mobile"];
    autoUsername = json["autoUsername"];
    rewardPoints = json["rewardPoints"];
    role = json["role"];
    wins = json["wins"];
    country = json["country"];
    inviteLink = json["inviteLink"];
    inviteLink = json["gender"];
    inviteLink = json["address"];
    inviteLink = json["inviteLink"];
    createdAt = DateTime.parse(json["createdAt"]);
  }

  Map<String, dynamic> toMap() => {
        "_id": id,
        "firstname": firstName,
        "lastName": lastName,
        "avatar": avatar,
        "mobile": mobile,
        "autoUsername": autoUsername,
        "rewardPoints": rewardPoints,
        "wins": wins,
        "country": country,
        "inviteLink": inviteLink,
        "createdAt": createdAt?.toIso8601String(),
        "address": address,
        "emailVerified": emailVerified,
        "phoneVerified": phoneVerified,
        "token": token,
      };

  @override
  List<Object?> get props => [id, email];
}
