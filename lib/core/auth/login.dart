import 'dart:convert';

class Login {
  String? accessToken;
  int? expires;
  String? refreshToken;

  Login({
    this.accessToken,
    this.expires,
    this.refreshToken,
  });

  Login copyWith({
    String? accessToken,
    int? expires,
    String? refreshToken,
  }) =>
      Login(
        accessToken: accessToken ?? this.accessToken,
        expires: expires ?? this.expires,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        accessToken: json["access_token"],
        expires: json["expires"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "expires": expires,
        "refresh_token": refreshToken,
      };
}
