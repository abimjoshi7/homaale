// To parse this JSON data, do
//
//     final googleLoginRes = googleLoginResFromJson(jsonString);

import 'dart:convert';

GoogleLoginRes googleLoginResFromJson(String str) =>
    GoogleLoginRes.fromJson(json.decode(str));

String googleLoginResToJson(GoogleLoginRes data) => json.encode(data.toJson());

class GoogleLoginRes {
  GoogleLoginRes({
    this.access,
    this.refresh,
  });

  final String? access;
  final String? refresh;

  factory GoogleLoginRes.fromJson(Map<String, dynamic> json) => GoogleLoginRes(
        access: json["access"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
