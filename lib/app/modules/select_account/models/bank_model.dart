import 'dart:convert';
BankModel bankModelFromMap(String str) => BankModel.fromMap(json.decode(str));
String bankModelToMap(BankModel data) => json.encode(data.toMap());

class BankModel {
  BankModel({
    required this.bankName,
    required this.accountNumber,
    required this.bankCode,
    required this.country,
    required this.dateAdded,
    required this.id,
  });

  String bankName;
  String accountNumber;
  String bankCode;
  String country;
  DateTime dateAdded;
  String id;

  factory BankModel.fromMap(Map<String, dynamic> json) => BankModel(
    bankName: json["bankName"],
    accountNumber: json["accountNumber"],
    bankCode: json["bankCode"],
    country: json["country"],
    dateAdded: DateTime.parse(json["dateAdded"]),
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "bankName": bankName,
    "accountNumber": accountNumber,
    "bankCode": bankCode,
    "country": country,
    "dateAdded": dateAdded.toIso8601String(),
    "_id": id,
  };
}
