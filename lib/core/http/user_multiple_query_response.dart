// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:financeiro/core/auth/user.dart';

class UserMultipleQueryResponse {
  User? data;

  UserMultipleQueryResponse({
    this.data,
  });

  UserMultipleQueryResponse copyWith({
    User? data,
  }) =>
      UserMultipleQueryResponse(
        data: data ?? this.data,
      );

  factory UserMultipleQueryResponse.fromJson(String str) =>
      UserMultipleQueryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserMultipleQueryResponse.fromMap(Map<String, dynamic> json) =>
      UserMultipleQueryResponse(
        data: json["data"][0] == null ? null : User.fromMap(json["data"][0]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}
