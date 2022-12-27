// To parse this JSON data, do
//
//     final otpRes = otpResFromJson(jsonString);

import 'dart:convert';

OtpRes otpResFromJson(String str) => OtpRes.fromJson(json.decode(str));

String otpResToJson(OtpRes data) => json.encode(data.toJson());

class OtpRes {
  OtpRes({
    this.success,
    this.message,
  });

  final bool? success;
  final String? message;

  factory OtpRes.fromJson(Map<String, dynamic> json) => OtpRes(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
