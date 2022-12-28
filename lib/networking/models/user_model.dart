// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModelTest userModelFromJson(String str) =>
    UserModelTest.fromJson(json.decode(str) as Map<String, dynamic>);

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

  factory UserModelTest.fromJson(Map<String, dynamic> json) => UserModelTest(
        email: json['email'] as String?,
        password: json['password'] as String?,
        firstName: json['first_name'] as String?,
        middleName: json['middle_name'] as String?,
        lastName: json['last_name'] as String?,
        phone: json['phone'] as String?,
      );

  final String? email;
  final String? password;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? phone;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'first_name': firstName,
        'middle_name': middleName,
        'last_name': lastName,
        'phone': phone,
      };
}
