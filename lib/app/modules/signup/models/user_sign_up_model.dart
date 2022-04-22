import 'package:meta/meta.dart';
import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
  UserSignUpModel({
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.password,
    required this.agreement,
  });

  String firstname="";
  String lastname="";
  String mobile="";
  String password="";
  bool agreement=false;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    mobile: json["mobile"],
    password: json["password"],
    agreement: json["agreement"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "mobile": mobile,
    "password": password,
    "agreement": agreement,
  };
}