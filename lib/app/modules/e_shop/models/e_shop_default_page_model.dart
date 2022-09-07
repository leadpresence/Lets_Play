// To parse this JSON data, do
//
//     final eShopHomeModel = eShopHomeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EShopHomeModel eShopHomeModelFromJson(String str) =>
    EShopHomeModel.fromJson(json.decode(str));

String eShopHomeModelToJson(EShopHomeModel data) => json.encode(data.toJson());

class EShopHomeModel {
  EShopHomeModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  bool success;
  int statusCode;
  Data? data;
  String message;

  factory EShopHomeModel.fromJson(Map<String, dynamic> json) => EShopHomeModel(
        success: json["success"],
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": data == null ? null : data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.categories,
    required this.defaultCategoryTitle,
    required this.products,
  });

  List<Category>? categories;
  String defaultCategoryTitle;
  List<Product>? products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        defaultCategoryTitle: json["defaultCategoryTitle"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "defaultCategoryTitle": defaultCategoryTitle,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String imageUrl;
  String description;
  String status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        status: json["status"],
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
        "imageUrl": imageUrl,
        "description": description,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v,
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

  String id;
  String title;
  String description;
  List<String>? images;
  List<dynamic>? tags;
  double price;
  String currency;
  String status;
  List<String>? sizes;
  String category;
  int quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int v;

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
