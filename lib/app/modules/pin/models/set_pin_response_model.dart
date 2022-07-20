import 'dart:convert';

PinSetResponse pinSetResponseFromMap(String str) => PinSetResponse.fromMap(json.decode(str));

String pinSetResponseToMap(PinSetResponse data) => json.encode(data.toMap());

class PinSetResponse {
  PinSetResponse({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.body,
  });

  int statusCode;
  bool success;
  String message;
  Body body;

  factory PinSetResponse.fromMap(Map<String, dynamic> json) => PinSetResponse(
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
    required this.transactionPin,
  });

  String transactionPin;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    transactionPin: json["transactionPin"],
  );

  Map<String, dynamic> toMap() => {
    "transactionPin": transactionPin,
  };
}
