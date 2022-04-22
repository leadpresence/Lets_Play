import 'dart:convert';

import '../../../config/data/model/user.dart';

UserSignupDetails userSignupDetailsFromMap(String str) => UserSignupDetails.fromMap(json.decode(str));

String userSignupDetailsToMap(UserSignupDetails data) => json.encode(data.toMap());

class UserSignupDetails {
  UserSignupDetails({
    required this.success,
    required this.token,
    required this.validity,
    required this.data,
  });

  bool success;
  String token;
  String validity;
  Data data;

  factory UserSignupDetails.fromMap(Map<String, dynamic> json) => UserSignupDetails(
    success: json["success"],
    token: json["token"],
    validity: json["validity"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "token": token,
    "validity": validity,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.user,
  });

  User user;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    user: User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "user": user.toMap(),
  };
}
