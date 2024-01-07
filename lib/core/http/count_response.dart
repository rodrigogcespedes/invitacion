import 'dart:convert';

class CountResponse {
  dynamic data;

  CountResponse({
    this.data,
  });

  factory CountResponse.fromJson(String str) =>
      CountResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountResponse.fromMap(Map<String, dynamic> json) {
    return CountResponse(
        data: json["data"] == null ? null : json["data"][0]["count"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }
}
