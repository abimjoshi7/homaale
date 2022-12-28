// To parse this JSON data, do
//
//     final resetPasswordVerifyWithPhoneReq = resetPasswordVerifyWithPhoneReqFromJson(jsonString);

// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

ResetPasswordVerifyWithPhoneReq resetPasswordVerifyWithPhoneReqFromJson(
  String str,
) =>
    ResetPasswordVerifyWithPhoneReq.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

String resetPasswordVerifyWithPhoneReqToJson(
  ResetPasswordVerifyWithPhoneReq data,
) =>
    json.encode(data.toJson());

class ResetPasswordVerifyWithPhoneReq {
  ResetPasswordVerifyWithPhoneReq({
    this.phone,
    this.otp,
    this.password,
    this.confirmPassword,
    this.scope,
  });

  factory ResetPasswordVerifyWithPhoneReq.fromJson(Map<String, dynamic> json) =>
      ResetPasswordVerifyWithPhoneReq(
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
