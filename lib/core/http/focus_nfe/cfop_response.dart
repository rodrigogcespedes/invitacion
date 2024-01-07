import 'dart:convert';

class CfopResponse {
  String? codigo;
  String? descricao;

  CfopResponse({
    this.codigo,
    this.descricao,
  });

  CfopResponse copyWith({
    String? codigo,
    String? descricao,
  }) =>
      CfopResponse(
        codigo: codigo ?? this.codigo,
        descricao: descricao ?? this.descricao,
      );

  factory CfopResponse.fromJson(String str) =>
      CfopResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CfopResponse.fromMap(Map<String, dynamic> json) => CfopResponse(
        codigo: json["codigo"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "descricao": descricao,
      };
}
