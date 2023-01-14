// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category? categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category? data) => json.encode(data!.toJson());

class Category {
  Category({
    this.data,
    this.status,
    this.message,
  });

  List<CategoryDatum?>? data;
  int? status;
  String? message;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: json["data"] == null
            ? []
            : List<CategoryDatum?>.from(
                json["data"]!.map((x) => CategoryDatum.fromJson(x))),
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

class CategoryDatum {
  CategoryDatum({
    this.products,
    this.id,
    this.name,
    this.slug,
  });

  List<String?>? products;
  String? id;
  String? name;
  String? slug;

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        products: json["products"] == null
            ? []
            : List<String?>.from(json["products"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "_id": id,
        "name": name,
        "slug": slug,
      };
}
