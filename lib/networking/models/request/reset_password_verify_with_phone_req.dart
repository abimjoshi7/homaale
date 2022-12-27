// To parse this JSON data, do
//
//     final resetPasswordVerifyWithPhoneReq = resetPasswordVerifyWithPhoneReqFromJson(jsonString);

import 'dart:convert';

ResetPasswordVerifyWithPhoneReq resetPasswordVerifyWithPhoneReqFromJson(
        String str) =>
    ResetPasswordVerifyWithPhoneReq.fromJson(json.decode(str));

String resetPasswordVerifyWithPhoneReqToJson(
        ResetPasswordVerifyWithPhoneReq data) =>
    json.encode(data.toJson());

class ResetPasswordVerifyWithPhoneReq {
  ResetPasswordVerifyWithPhoneReq({
    this.phone,
    this.otp,
    this.password,
    this.confirmPassword,
    this.scope,
  });

  final String? phone;
  final String? otp;
  final String? password;
  final String? confirmPassword;
  final String? scope;

  factory ResetPasswordVerifyWithPhoneReq.fromJson(Map<String, dynamic> json) =>
      ResetPasswordVerifyWithPhoneReq(
        phone: json["phone"],
        otp: json["otp"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        scope: json["scope"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
        "password": password,
        "confirm_password": confirmPassword,
        "scope": scope,
      };
}
