// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:financeiro/core/auth/login.dart';

class LoginResponse {
  Login? data;

  LoginResponse({
    this.data,
  });

  LoginResponse copyWith({
    Login? data,
  }) =>
      LoginResponse(
        data: data ?? this.data,
      );

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        data: json["data"] == null ? null : Login.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}
