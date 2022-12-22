// To parse this JSON data, do
//
//     final otpReq = otpReqFromJson(jsonString);

import 'dart:convert';

OtpReq otpReqFromJson(String str) => OtpReq.fromJson(json.decode(str));

String otpReqToJson(OtpReq data) => json.encode(data.toJson());

class OtpReq {
  OtpReq({
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

  factory OtpReq.fromJson(Map<String, dynamic> json) => OtpReq(
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
