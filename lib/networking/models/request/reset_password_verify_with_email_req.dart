// To parse this JSON data, do
//
//     final resetPasswordVerifyWithEmailReq = resetPasswordVerifyWithEmailReqFromJson(jsonString);

import 'dart:convert';

ResetPasswordVerifyWithEmailReq resetPasswordVerifyWithEmailReqFromJson(
        String str) =>
    ResetPasswordVerifyWithEmailReq.fromJson(
        json.decode(str) as Map<String, dynamic>);

String resetPasswordVerifyWithEmailReqToJson(
        ResetPasswordVerifyWithEmailReq data) =>
    json.encode(data.toJson());

class ResetPasswordVerifyWithEmailReq {
  ResetPasswordVerifyWithEmailReq({
    this.uid,
    this.token,
    this.password,
    this.confirmPassword,
  });

  final String? uid;
  final String? token;
  final String? password;
  final String? confirmPassword;

  factory ResetPasswordVerifyWithEmailReq.fromJson(Map<String, dynamic> json) =>
      ResetPasswordVerifyWithEmailReq(
        uid: json["uid"] as String?,
        token: json["token"] as String?,
        password: json["password"] as String?,
        confirmPassword: json["confirm_password"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "token": token,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
