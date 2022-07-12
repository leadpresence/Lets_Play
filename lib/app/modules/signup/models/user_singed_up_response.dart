import 'dart:convert';

UserSignupResponse userSignupResponseFromMap(String str) =>
    UserSignupResponse.fromMap(json.decode(str));

String userSignupResponseToMap(UserSignupResponse data) =>
    json.encode(data.toMap());

class UserSignupResponse {
  UserSignupResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.body,
  });

  bool success;
  int statusCode;
  String message;
  Body body;

  factory UserSignupResponse.fromMap(Map<String, dynamic> json) =>
      UserSignupResponse(
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
    required this.user,
    required this.rewardPoint,
    required this.token,
  });

  User user;

  int? rewardPoint = 0;
  String token;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
        user: User.fromMap(json["user"]),
        rewardPoint: json["rewardPoint"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "rewardPoint": rewardPoint ?? 0,
        "token": token,
      };
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.profileUrl,
    required this.wallet,
    required this.email,
    required this.rewardPoint,
    required this.isEmailVerified,
    required this.id,
  });

  String firstName;
  String lastName;
  String phone;
  String? email = "";
  String profileUrl;
  Wallet wallet;
  int rewardPoint;
  bool isEmailVerified;
  String id;

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        profileUrl: json["profileUrl"],
        wallet: Wallet.fromMap(json["wallet"]),
        rewardPoint: json["rewardPoint"],
        isEmailVerified: json["isEmailVerified"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "profileUrl": profileUrl,
        "email": email ?? "",
        "wallet": wallet.toMap(),
        "rewardPoint": rewardPoint,
        "isEmailVerified": isEmailVerified,
        "id": id,
      };
}

class Wallet {
  Wallet({
    required this.balance,
  });

  int balance;

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        balance: json["balance"],
      );

  Map<String, dynamic> toMap() => {
        "balance": balance,
      };
}
