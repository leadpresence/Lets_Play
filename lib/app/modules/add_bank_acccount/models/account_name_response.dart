// To parse this JSON data, do
//
//     final accountNameResponseModel = accountNameResponseModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AccountNameResponseModel accountNameResponseModelFromMap(String str) => AccountNameResponseModel.fromMap(json.decode(str));

String accountNameResponseModelToMap(AccountNameResponseModel data) => json.encode(data.toMap());

class AccountNameResponseModel {
  AccountNameResponseModel({
    required this.statusCode,
    required this.success,
    required this.accountDetails,
  });

  int statusCode;
  bool success;
  AccountDetails accountDetails;

  factory AccountNameResponseModel.fromMap(Map<String, dynamic> json) => AccountNameResponseModel(
    statusCode: json["statusCode"],
    success: json["success"],
    accountDetails: AccountDetails.fromMap(json["accountDetails"]),
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "success": success,
    "accountDetails": accountDetails.toMap(),
  };
}

class AccountDetails {
  AccountDetails({
    required this.status,
    required this.data,
  });

  int status;
  AccountDetailsData data;

  factory AccountDetails.fromMap(Map<String, dynamic> json) => AccountDetails(
    status: json["status"],
    data: AccountDetailsData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data.toMap(),
  };
}

class AccountDetailsData {
  AccountDetailsData({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory AccountDetailsData.fromMap(Map<String, dynamic> json) => AccountDetailsData(
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
    required this.accountNumber,
    required this.accountName,
  });

  String accountNumber;
  String accountName;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    accountNumber: json["account_number"],
    accountName: json["account_name"],
  );

  Map<String, dynamic> toMap() => {
    "account_number": accountNumber,
    "account_name": accountName,
  };
}
