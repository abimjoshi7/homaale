// To parse this JSON data, do
//
//     final otpReq = otpReqFromJson(jsonString);

import 'dart:convert';

OtpReq otpReqFromJson(String str) =>
    OtpReq.fromJson(json.decode(str) as Map<String, dynamic>);

String otpReqToJson(OtpReq data) => json.encode(data.toJson());

class OtpReq {
  OtpReq({
    this.phone,
    this.otp,
    this.password,
    this.confirmPassword,
    this.scope,
  });

  factory OtpReq.fromJson(Map<String, dynamic> json) => OtpReq(
        phone: json['phone'] as String?,
        otp: json['otp'] as String?,
        password: json['password'] as String?,
        confirmPassword: json['confirm_password'] as String?,
        scope: json['scope'] as String?,
      );

  final String? phone;
  final String? otp;
  final String? password;
  final String? confirmPassword;
  final String? scope;

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'otp': otp,
        'password': password,
        'confirm_password': confirmPassword,
        'scope': scope,
      };
}
