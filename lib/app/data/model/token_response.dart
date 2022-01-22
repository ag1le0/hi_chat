import 'dart:convert';

TokenResp tokenRespFromJson(String str) => TokenResp.fromJson(json.decode(str));

String tokenRespToJson(TokenResp data) => json.encode(data.toJson());

class TokenResp {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  String? expiresIn;
  String? scope;
  String? jti;

  TokenResp({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.jti,
  });

  factory TokenResp.fromJson(Map<String, dynamic> json) {
    return TokenResp(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      scope: json['scope'],
      jti: json['jti'],
    );
  }
  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "scope": scope,
        "jti": jti,
      };
}
