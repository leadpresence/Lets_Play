import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) =>
    SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) =>
    json.encode(data.toJson());

class SearchProductModel {
  SearchProductModel({
    required this.success,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final bool success;
  final List<Product>? data;
  final int statusCode;
  final String message;

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        success: json["success"],
        data: json["data"] == null
            ? null
            : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "statusCode": statusCode,
        "message": message,
      };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.tags,
    required this.price,
    required this.currency,
    required this.status,
    required this.sizes,
    required this.category,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String title;
  final String description;
  final List<String>? images;
  final List<dynamic>? tags;
  final double price;
  final String currency;
  final String status;
  final List<String>? sizes;
  final String category;
  final int quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        price: json["price"] == null ? null : json["price"].toDouble(),
        currency: json["currency"],
        status: json["status"],
        sizes: json["sizes"] == null
            ? null
            : List<String>.from(json["sizes"].map((x) => x)),
        category: json["category"],
        quantity: json["quantity"],
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
        "title": title,
        "description": description,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "price": price,
        "currency": currency,
        "status": status,
        "sizes":
            sizes == null ? null : List<dynamic>.from(sizes!.map((x) => x)),
        "category": category,
        "quantity": quantity,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v,
      };
}
