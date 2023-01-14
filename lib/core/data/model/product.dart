// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:task/core/data/model/user.dart';

Product? productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product? data) => json.encode(data!.toJson());

class Product {
  Product({
    this.data,
    this.status,
    this.message,
  });

  List<ProductDatum?>? data;
  int? status;
  String? message;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: json["data"] == null
            ? []
            : List<ProductDatum?>.from(
                json["data"]!.map((x) => ProductDatum.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "status": status,
        "message": message,
      };
}

class ProductDatum {
  ProductDatum({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.image,
  });
  String? id;
  String? title;
  int? price;
  ProductCategory? category;
  String? description;
  User? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;
  String? image;

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
        id: json["_id"],
        title: json["title"],
        price: json["price"],
        category: ProductCategory.fromJson(json["category"]),
        description: json["description"],
        createdBy: User.fromJson(json["createdBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "price": price,
        "category": category!.toJson(),
        "description": description,
        "createdBy": createdBy!.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "slug": slug,
        "image": image,
      };
}

class ProductCategory {
  ProductCategory({
    required this.id,
    required this.name,
    required this.slug,
  });
  String? id;
  String? name;
  String? slug;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
      };
}
