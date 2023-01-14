// To parse this JSON data, do
//
//     final oneProduct = oneProductFromJson(jsonString);

import 'dart:convert';

import 'package:task/core/data/model/product.dart';

OneProduct? oneProductFromJson(String str) =>
    OneProduct.fromJson(json.decode(str));

String oneProductToJson(OneProduct? data) => json.encode(data!.toJson());

class OneProduct {
  OneProduct({
    required this.status,
    required this.data,
    required this.message,
  });

  int? status;
  ProductDatum? data;
  String? message;

  factory OneProduct.fromJson(Map<String, dynamic> json) => OneProduct(
        status: json["status"],
        data: ProductDatum.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
        "message": message,
      };
}
