// To parse this JSON data, do
//
//     final otpRes = otpResFromJson(jsonString);

import 'dart:convert';

OtpRes otpResFromJson(String str) =>
    OtpRes.fromJson(json.decode(str) as Map<String, dynamic>);

String otpResToJson(OtpRes data) => json.encode(data.toJson());

class OtpRes {
  OtpRes({
    this.success,
    this.message,
  });
  factory OtpRes.fromJson(Map<String, dynamic> json) => OtpRes(
        success: json['success'] as bool,
        message: json['message'] as String?,
      );

  final bool? success;
  final String? message;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
