// To parse this JSON data, do
//
//     final userLoginRes = userLoginResFromJson(jsonString);

import 'dart:convert';

UserLoginRes userLoginResFromJson(String str) =>
    UserLoginRes.fromJson(json.decode(str) as Map<String, dynamic>);

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

  factory UserLoginRes.fromJson(Map<String, dynamic> json) => UserLoginRes(
        username: json['username'] as String?,
        isVerified: json['is_verified'] as bool,
        fcmToken: json['fcm_token'],
        access: json['access'] as String?,
        refresh: json['refresh'] as String?,
        hasProfile: json['has_profile'] as bool,
      );

  final String? username;
  final bool? isVerified;
  final dynamic fcmToken;
  final String? access;
  final String? refresh;
  final bool? hasProfile;

  Map<String, dynamic> toJson() => {
        'username': username,
        'is_verified': isVerified,
        'fcm_token': fcmToken,
        'access': access,
        'refresh': refresh,
        'has_profile': hasProfile,
      };
}
