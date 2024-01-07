// {{url}}/v2/ncms?capitulo=90&posicao=06&subposicao1=5

import 'dart:convert';

class NcmResponse {
  String? codigo;
  String? descricaoCompleta;
  String? capitulo;
  String? posicao;
  String? subposicao1;
  String? subposicao2;
  String? item1;
  String? item2;

  NcmResponse({
    this.codigo,
    this.descricaoCompleta,
    this.capitulo,
    this.posicao,
    this.subposicao1,
    this.subposicao2,
    this.item1,
    this.item2,
  });

  NcmResponse copyWith({
    String? codigo,
    String? descricaoCompleta,
    String? capitulo,
    String? posicao,
    String? subposicao1,
    String? subposicao2,
    String? item1,
    String? item2,
  }) =>
      NcmResponse(
        codigo: codigo ?? this.codigo,
        descricaoCompleta: descricaoCompleta ?? this.descricaoCompleta,
        capitulo: capitulo ?? this.capitulo,
        posicao: posicao ?? this.posicao,
        subposicao1: subposicao1 ?? this.subposicao1,
        subposicao2: subposicao2 ?? this.subposicao2,
        item1: item1 ?? this.item1,
        item2: item2 ?? this.item2,
      );

  factory NcmResponse.fromJson(String str) =>
      NcmResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NcmResponse.fromMap(Map<String, dynamic> json) => NcmResponse(
        codigo: json["codigo"],
        descricaoCompleta: json["descricao_completa"],
        capitulo: json["capitulo"],
        posicao: json["posicao"],
        subposicao1: json["subposicao1"],
        subposicao2: json["subposicao2"],
        item1: json["item1"],
        item2: json["item2"],
      );

  Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "descricao_completa": descricaoCompleta,
        "capitulo": capitulo,
        "posicao": posicao,
        "subposicao1": subposicao1,
        "subposicao2": subposicao2,
        "item1": item1,
        "item2": item2,
      };
}
