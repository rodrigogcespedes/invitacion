// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:financeiro/core/auth/user.dart';

class UserResponse {
  User? data;

  UserResponse({
    this.data,
  });

  UserResponse copyWith({
    User? data,
  }) =>
      UserResponse(
        data: data ?? this.data,
      );

  factory UserResponse.fromJson(String str) =>
      UserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        data: json["data"] == null ? null : User.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}
