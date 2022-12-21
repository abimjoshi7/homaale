// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModelTest userModelFromJson(String str) =>
    UserModelTest.fromJson(json.decode(str));

String userModelToJson(UserModelTest data) => json.encode(data.toJson());

class UserModelTest {
  UserModelTest({
    this.email,
    this.password,
    this.firstName,
    this.middleName,
    this.lastName,
    this.phone,
  });

  final String? email;
  final String? password;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? phone;

  factory UserModelTest.fromJson(Map<String, dynamic> json) => UserModelTest(
        email: json["email"],
        password: json["password"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "phone": phone,
      };
}
