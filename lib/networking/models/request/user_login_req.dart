// To parse this JSON data, do
//
//     final userLoginReq = userLoginReqFromJson(jsonString);

import 'dart:convert';

UserLoginReq userLoginReqFromJson(String str) =>
    UserLoginReq.fromJson(json.decode(str));

String userLoginReqToJson(UserLoginReq data) => json.encode(data.toJson());

class UserLoginReq {
  UserLoginReq({
    this.username,
    this.password,
  });

  final String? username;
  final String? password;

  factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
