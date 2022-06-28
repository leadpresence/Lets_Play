import 'dart:convert';

TransactionsModel transactionsModelFromMap(String str) => TransactionsModel.fromMap(json.decode(str));

String transactionsModelToMap(TransactionsModel data) => json.encode(data.toMap());

class TransactionsModel {
  TransactionsModel({
    required this.id,
    required this.user,
    required this.transactionRef,
    required this.processor,
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
  String processor;
  String status;
  String currency;
  int amount;
  int transactionType;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory TransactionsModel.fromMap(Map<String, dynamic> json) => TransactionsModel(
    id: json["_id"],
    user: json["user"],
    transactionRef: json["transactionRef"],
    processor: json["processor"],
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
    "processor": processor,
    "status": status,
    "currency": currency,
    "amount": amount,
    "transactionType": transactionType,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
