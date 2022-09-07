// To parse this JSON data, do
//
//     final wishlist = wishlistFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WishlistResponse wishlistFromMap(String str) => WishlistResponse.fromMap(json.decode(str));

String wishlistToMap(WishlistResponse data) => json.encode(data.toMap());

class WishlistResponse {
  WishlistResponse({
    required this.success,
    required this.statusCode,
    required this.body,
    required this.message,
  });

  bool success;
  int statusCode;
  List<WishList> body;
  String message;

  factory WishlistResponse.fromMap(Map<String, dynamic> json) => WishlistResponse(
    success: json["success"],
    statusCode: json["statusCode"],
    body: List<WishList>.from(json["body"].map((x) => WishList.fromMap(x))),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "statusCode": statusCode,
    "body": List<dynamic>.from(body.map((x) => x.toMap())),
    "message": message,
  };
}

class WishList {
  WishList({
    required this.id,
    required this.amount,
    required this.size,
    required this.customer,
    required this.product,
    required this.quantity,
    required this.image,
    required this.title,
    required this.unitPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  double amount;
  String size;
  String customer;
  String product;
  int quantity;
  String image;
  String title;
  double unitPrice;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory WishList.fromMap(Map<String, dynamic> json) => WishList(
    id: json["_id"],
    amount: json["amount"].toDouble(),
    size: json["size"],
    customer: json["customer"],
    product: json["product"],
    quantity: json["quantity"],
    image: json["image"],
    title: json["title"],
    unitPrice: json["unitPrice"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "amount": amount,
    "size": size,
    "customer": customer,
    "product": product,
    "quantity": quantity,
    "image": image,
    "title": title,
    "unitPrice": unitPrice,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
