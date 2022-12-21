import 'package:cipher/features/sign_up/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String email,
    required String password,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phone,
  }) : super(
            email: email,
            firstName: firstName,
            lastName: lastName,
            middleName: middleName,
            password: password,
            phone: phone);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
