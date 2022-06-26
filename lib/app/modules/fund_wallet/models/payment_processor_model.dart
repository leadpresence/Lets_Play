// To parse this JSON data, do
//
//     final paymentProcessorModel = paymentProcessorModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

PaymentProcessorModel paymentProcessorModelFromMap(String str) => PaymentProcessorModel.fromMap(json.decode(str));

String paymentProcessorModelToMap(PaymentProcessorModel data) => json.encode(data.toMap());

class PaymentProcessorModel {
  PaymentProcessorModel({
    required this.message,
    required this.success,
    required this.statusCode,
    required this.body,
  });

  String message;
  bool success;
  int statusCode;
  List<ProcessorModel> body;

  factory PaymentProcessorModel.fromMap(Map<String, dynamic> json) => PaymentProcessorModel(
    message: json["message"],
    success: json["success"],
    statusCode: json["statusCode"],
    body: List<ProcessorModel>.from(json["body"].map((x) => ProcessorModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "success": success,
    "statusCode": statusCode,
    "body": List<dynamic>.from(body.map((x) => x.toMap())),
  };
}


ProcessorModel processorModelFromMap(String str) => ProcessorModel.fromMap(json.decode(str));
String processorModelToMap(ProcessorModel data) => json.encode(data.toMap());

class ProcessorModel {
  ProcessorModel({
    required this.id,
    required this.name,
    required this.status,
    required this.v,
  });

  String id;
  String name;
  String status;
  int v;

  factory ProcessorModel.fromMap(Map<String, dynamic> json) => ProcessorModel(
    id: json["_id"],
    name: json["name"],
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "status": status,
    "__v": v,
  };
}

