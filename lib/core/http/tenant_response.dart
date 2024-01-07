// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:financeiro/core/auth/tenant.dart';

class TenantResponse {
  Tenant? data;

  TenantResponse({
    this.data,
  });

  TenantResponse copyWith({
    Tenant? data,
  }) =>
      TenantResponse(
        data: data ?? this.data,
      );

  factory TenantResponse.fromJson(String str) =>
      TenantResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TenantResponse.fromMap(Map<String, dynamic> json) => TenantResponse(
        data: json["data"] == null ? null : Tenant.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}
