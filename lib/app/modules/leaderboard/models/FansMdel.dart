// To parse this JSON data, do
//
//     final fanxtarsModel = fanxtarsModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FanxtarsModel fanxtarsModelFromMap(String str) => FanxtarsModel.fromMap(json.decode(str));

String fanxtarsModelToMap(FanxtarsModel data) => json.encode(data.toMap());

class FanxtarsModel {
  FanxtarsModel({
    required this.name,
    required this.phone,
    required this.age,
    required this.favorite,
    required this.city,
    required this.dateJoined,
  });

  String name;
  String phone;
  String age;
  String favorite;
  String city;
  String dateJoined;

  factory FanxtarsModel.fromMap(Map<String, dynamic> json) => FanxtarsModel(
    name: json["name"],
    phone: json["phone"],
    age: json["age"],
    favorite: json["favorite"],
    city: json["city"],
    dateJoined: json["date_joined"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "phone": phone,
    "age": age,
    "favorite": favorite,
    "city": city,
    "date_joined": dateJoined,
  };
}
