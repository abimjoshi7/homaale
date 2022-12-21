// To parse this JSON data, do
//
//     final userLoginRes = userLoginResFromJson(jsonString);

import 'dart:convert';

UserLoginRes userLoginResFromJson(String str) =>
    UserLoginRes.fromJson(json.decode(str));

String userLoginResToJson(UserLoginRes data) => json.encode(data.toJson());

class UserLoginRes {
  UserLoginRes({
    this.username,
    this.isVerified,
    this.fcmToken,
    this.access,
    this.refresh,
    this.hasProfile,
  });

  final String? username;
  final bool? isVerified;
  final dynamic fcmToken;
  final String? access;
  final String? refresh;
  final bool? hasProfile;

  factory UserLoginRes.fromJson(Map<String, dynamic> json) => UserLoginRes(
        username: json["username"],
        isVerified: json["is_verified"],
        fcmToken: json["fcm_token"],
        access: json["access"],
        refresh: json["refresh"],
        hasProfile: json["has_profile"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "is_verified": isVerified,
        "fcm_token": fcmToken,
        "access": access,
        "refresh": refresh,
        "has_profile": hasProfile,
      };
}
