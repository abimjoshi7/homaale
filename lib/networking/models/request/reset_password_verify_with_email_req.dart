// To parse this JSON data, do
//
//     final resetPasswordVerifyWithEmailReq = resetPasswordVerifyWithEmailReqFromJson(jsonString);

import 'dart:convert';

ResetPasswordVerifyWithEmailReq resetPasswordVerifyWithEmailReqFromJson(
        String str) =>
    ResetPasswordVerifyWithEmailReq.fromJson(json.decode(str));

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
        uid: json["uid"],
        token: json["token"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "token": token,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
