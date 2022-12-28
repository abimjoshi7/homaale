import 'dart:convert';

UserLoginReq userLoginReqFromJson(String str) =>
    UserLoginReq.fromJson(json.decode(str) as Map<String, dynamic>);

String userLoginReqToJson(UserLoginReq data) => json.encode(data.toJson());

class UserLoginReq {
  UserLoginReq({
    this.username,
    this.password,
  });

  factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        username: json['username'] as String?,
        password: json['password'] as String?,
      );

  final String? username;
  final String? password;

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
