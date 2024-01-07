import 'dart:convert';

class NfceResponse {
  String? cnpjEmitente;
  String? ref;
  String? status;
  String? statusSefaz;
  String? mensagemSefaz;
  String? chaveNfe;
  String? numero;
  String? serie;
  String? protocolo;
  String? caminhoXmlNotaFiscal;
  String? caminhoDanfe;
  String? qrcodeUrl;
  String? urlConsultaNf;

  NfceResponse({
    this.cnpjEmitente,
    this.ref,
    this.status,
    this.statusSefaz,
    this.mensagemSefaz,
    this.chaveNfe,
    this.numero,
    this.serie,
    this.protocolo,
    this.caminhoXmlNotaFiscal,
    this.caminhoDanfe,
    this.qrcodeUrl,
    this.urlConsultaNf,
  });

  NfceResponse copyWith({
    String? cnpjEmitente,
    String? ref,
    String? status,
    String? statusSefaz,
    String? mensagemSefaz,
    String? chaveNfe,
    String? numero,
    String? serie,
    String? protocolo,
    String? caminhoXmlNotaFiscal,
    String? caminhoDanfe,
    String? qrcodeUrl,
    String? urlConsultaNf,
  }) =>
      NfceResponse(
        cnpjEmitente: cnpjEmitente ?? this.cnpjEmitente,
        ref: ref ?? this.ref,
        status: status ?? this.status,
        statusSefaz: statusSefaz ?? this.statusSefaz,
        mensagemSefaz: mensagemSefaz ?? this.mensagemSefaz,
        chaveNfe: chaveNfe ?? this.chaveNfe,
        numero: numero ?? this.numero,
        serie: serie ?? this.serie,
        protocolo: protocolo ?? this.protocolo,
        caminhoXmlNotaFiscal: caminhoXmlNotaFiscal ?? this.caminhoXmlNotaFiscal,
        caminhoDanfe: caminhoDanfe ?? this.caminhoDanfe,
        qrcodeUrl: qrcodeUrl ?? this.qrcodeUrl,
        urlConsultaNf: urlConsultaNf ?? this.urlConsultaNf,
      );

  factory NfceResponse.fromJson(String str) =>
      NfceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NfceResponse.fromMap(Map<String, dynamic> json) => NfceResponse(
        cnpjEmitente: json["cnpj_emitente"],
        ref: json["ref"],
        status: json["status"],
        statusSefaz: json["status_sefaz"],
        mensagemSefaz: json["mensagem_sefaz"],
        chaveNfe: json["chave_nfe"],
        numero: json["numero"],
        serie: json["serie"],
        protocolo: json["protocolo"],
        caminhoXmlNotaFiscal: json["caminho_xml_nota_fiscal"],
        caminhoDanfe: json["caminho_danfe"],
        qrcodeUrl: json["qrcode_url"],
        urlConsultaNf: json["url_consulta_nf"],
      );

  Map<String, dynamic> toMap() => {
        "cnpj_emitente": cnpjEmitente,
        "ref": ref,
        "status": status,
        "status_sefaz": statusSefaz,
        "mensagem_sefaz": mensagemSefaz,
        "chave_nfe": chaveNfe,
        "numero": numero,
        "serie": serie,
        "protocolo": protocolo,
        "caminho_xml_nota_fiscal": caminhoXmlNotaFiscal,
        "caminho_danfe": caminhoDanfe,
        "qrcode_url": qrcodeUrl,
        "url_consulta_nf": urlConsultaNf,
      };
}
