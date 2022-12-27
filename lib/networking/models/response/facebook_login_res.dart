import 'dart:convert';

FacebookLoginRes facebookLoginResFromJson(String str) =>
    FacebookLoginRes.fromJson(json.decode(str));

String facebookLoginResToJson(FacebookLoginRes data) =>
    json.encode(data.toJson());

class FacebookLoginRes {
  FacebookLoginRes({
    this.access,
    this.refresh,
  });

  final String? access;
  final String? refresh;

  factory FacebookLoginRes.fromJson(Map<String, dynamic> json) =>
      FacebookLoginRes(
        access: json["access"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
