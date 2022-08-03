import 'dart:convert';

DeleteAccountResponse DeleteAccountResponseFromMap(String str) => DeleteAccountResponse.fromMap(json.decode(str));

String DeleteAccountResponseToMap(DeleteAccountResponse data) => json.encode(data.toMap());

class DeleteAccountResponse {
  DeleteAccountResponse({
    required this.message,
    required this.body,
    required this.success,
    required this.statusCode,
  });

  String message;
  Body body;
  bool success;
  int statusCode;

  factory DeleteAccountResponse.fromMap(Map<String, dynamic> json) => DeleteAccountResponse(
    message: json["message"],
    body: Body.fromMap(json["body"]),
    success: json["success"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "body": body.toMap(),
    "success": success,
    "statusCode": statusCode,
  };
}

class Body {
  Body();

  factory Body.fromMap(Map<String, dynamic> json) => Body(
  );

  Map<String, dynamic> toMap() => {
  };
}
