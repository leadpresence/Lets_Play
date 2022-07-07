import 'dart:convert';

TransactionsModel transactionsModelFromMap(String str) => TransactionsModel.fromMap(json.decode(str));

String transactionsModelToMap(TransactionsModel data) => json.encode(data.toMap());

class TransactionsModel {
  TransactionsModel({
    required this.id,
    required this.user,
    required this.transactionRef,
    required this.transactionId,
    required this.status,
    required this.currency,
    required this.amount,
    required this.transactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });


  String id;
  String user;
  String transactionRef;
  String transactionId;
  String status;
  String currency;
  int amount;
  String transactionType;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory TransactionsModel.fromMap(Map<String, dynamic> json) => TransactionsModel(
    id: json["_id"],
    user: json["user"],
    transactionRef: json["transactionRef"],
    transactionId: json["transactionId"],
    status: json["status"],
    currency: json["currency"],
    amount: json["amount"],
    transactionType: json["transactionType"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user,
    "transactionRef": transactionRef,
    "transactionId": transactionId,
    "status": status,
    "currency": currency,
    "amount": amount,
    "transactionType": transactionType,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
