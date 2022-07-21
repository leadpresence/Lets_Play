import 'package:meta/meta.dart';
import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
  UserSignUpModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.referralCode,
    required this.agreement,
  });

  String firstName="";
  String lastName="";
  String phone="";
  String password="";
  String referralCode="";
  bool agreement=false;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    password: json["password"],
    referralCode: json["referralCode"],
    agreement: json["agreement"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "password": password,
    "referralCode": referralCode,
    "agreement": agreement,
  };
}