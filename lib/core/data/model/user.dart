// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User? data) => json.encode(data!.toJson());

class User {
  User({
    this.status,
    this.message,
    this.data,
  });

  int? status;

  String? message;

  List<UserDatum?>? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<UserDatum?>.from(
                json["data"]!.map((x) => UserDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class UserDatum {
  UserDatum({
    this.role,
    this.id,
    this.name,
    this.email,
    this.number,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
  });

  Role? role;
  String? id;
  String? name;
  String? email;
  int? number;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? lastLoginAt;

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        role: roleValues.map[json["role"]],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        number: json["number"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        lastLoginAt: json["lastLoginAt"],
      );

  Map<String, dynamic> toJson() => {
        "role": roleValues.reverse![role],
        "_id": id,
        "name": name,
        "email": email,
        "number": number,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "lastLoginAt": lastLoginAt,
      };
}

// ignore: constant_identifier_names
enum Role { ROLE_CUSTOMER }

final roleValues = EnumValues({"ROLE_CUSTOMER": Role.ROLE_CUSTOMER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
