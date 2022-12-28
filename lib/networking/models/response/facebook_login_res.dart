import 'dart:convert';

FacebookLoginRes facebookLoginResFromJson(String str) =>
    FacebookLoginRes.fromJson(json.decode(str) as Map<String, dynamic>);

String facebookLoginResToJson(FacebookLoginRes data) =>
    json.encode(data.toJson());

class FacebookLoginRes {
  FacebookLoginRes({
    this.access,
    this.refresh,
  });

  factory FacebookLoginRes.fromJson(Map<String, dynamic> json) =>
      FacebookLoginRes(
        access: json['access'] as String?,
        refresh: json['refresh'] as String?,
      );

  final String? access;
  final String? refresh;

  Map<String, dynamic> toJson() => {
        'access': access,
        'refresh': refresh,
      };
}
