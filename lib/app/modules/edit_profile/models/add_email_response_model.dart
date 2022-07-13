import 'dart:convert';

class AddEmailResponseModel {
  String message;
  Body body;
  AddEmailResponseModel({
    required this.body,
    required this.message,
  });

  factory AddEmailResponseModel.fromJson(Map<String, dynamic> json) => AddEmailResponseModel(
        message: json["message"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body.toJson(),
      };
}

class Body {
  Body({
    required this.reference,
  });

  String reference;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "reference": reference,
      };
}
