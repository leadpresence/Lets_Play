import 'dart:convert';

MyCartModel myCartModelFromJson(String str) =>
    MyCartModel.fromJson(json.decode(str));

String myCartModelToJson(MyCartModel data) => json.encode(data.toJson());

class MyCartModel {
  MyCartModel({
    required this.success,
    required this.statusCode,
    required this.body,
    required this.message,
  });

  bool success;
  int statusCode;
  Body? body;
  String message;

  factory MyCartModel.fromJson(Map<String, dynamic> json) => MyCartModel(
        success: json["success"],
        statusCode: json["statusCode"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "body": body == null ? null : body!.toJson(),
        "message": message,
      };
}

class Body {
  Body({
    required this.sumTotal,
    required this.totalItems,
    required this.carts,
  });

  double sumTotal;
  int totalItems;
  List<Cart>? carts;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        sumTotal: json["sumTotal"] == null ? null : json["sumTotal"].toDouble(),
        totalItems: json["totalItems"],
        carts: json["carts"] == null
            ? null
            : List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sumTotal": sumTotal,
        "totalItems": totalItems,
        "carts": carts == null
            ? null
            : List<dynamic>.from(carts!.map((x) => x.toJson())),
      };
}

class Cart {
  Cart({
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        size: json["size"],
        customer: json["customer"],
        product: json["product"],
        quantity: json["quantity"],
        image: json["image"],
        title: json["title"],
        unitPrice:
            json["unitPrice"] == null ? null : json["unitPrice"].toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "amount": amount,
        "size": size,
        "customer": customer,
        "product": product,
        "quantity": quantity,
        "image": image,
        "title": title,
        "unitPrice": unitPrice,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v,
      };
}
