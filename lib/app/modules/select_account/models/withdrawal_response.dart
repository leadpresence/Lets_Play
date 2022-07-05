
import 'package:meta/meta.dart';
import 'dart:convert';

WithdrawalResponse withdrawalResponseFromMap(String str) => WithdrawalResponse.fromMap(json.decode(str));

String withdrawalResponseToMap(WithdrawalResponse data) => json.encode(data.toMap());

class WithdrawalResponse {
  WithdrawalResponse({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.body,
  });

  int statusCode;
  bool success;
  String message;
  Body body;

  factory WithdrawalResponse.fromMap(Map<String, dynamic> json) => WithdrawalResponse(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    body: Body.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "body": body.toMap(),
  };
}

class Body {
  Body({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    status: json["status"],
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.id,
    required this.accountNumber,
    required this.bankCode,
    required this.fullName,
    required this.createdAt,
    required this.currency,
    required this.amount,
    required this.fee,
    required this.status,
    required this.reference,
    required this.meta,
    required this.narration,
    required this.completeMessage,
    required this.requiresApproval,
    required this.isApproved,
    required this.bankName,
  });

  int id;
  String accountNumber;
  String bankCode;
  String fullName;
  DateTime createdAt;
  String currency;
  int amount;
  double fee;
  String status;
  String reference;
  dynamic meta;
  String narration;
  String completeMessage;
  int requiresApproval;
  int isApproved;
  String bankName;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    accountNumber: json["account_number"],
    bankCode: json["bank_code"],
    fullName: json["full_name"],
    createdAt: DateTime.parse(json["created_at"]),
    currency: json["currency"],
    amount: json["amount"],
    fee: json["fee"].toDouble(),
    status: json["status"],
    reference: json["reference"],
    meta: json["meta"],
    narration: json["narration"],
    completeMessage: json["complete_message"],
    requiresApproval: json["requires_approval"],
    isApproved: json["is_approved"],
    bankName: json["bank_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "account_number": accountNumber,
    "bank_code": bankCode,
    "full_name": fullName,
    "created_at": createdAt.toIso8601String(),
    "currency": currency,
    "amount": amount,
    "fee": fee,
    "status": status,
    "reference": reference,
    "meta": meta,
    "narration": narration,
    "complete_message": completeMessage,
    "requires_approval": requiresApproval,
    "is_approved": isApproved,
    "bank_name": bankName,
  };
}
