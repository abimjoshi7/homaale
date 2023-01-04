class UserSignUpRes {
  UserSignUpRes({
    this.email,
    this.firstName,
    this.middleName,
    this.lastName,
    this.phone,
  });

  factory UserSignUpRes.fromJson(Map<String, dynamic> json) => UserSignUpRes(
        email: json['email'] as String?,
        firstName: json['first_name'] as String?,
        middleName: json['middle_name'] as String?,
        lastName: json['last_name'] as String?,
        phone: json['phone'] as String?,
      );

  final String? email;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? phone;

  Map<String, dynamic> toJson() => {
        'email': email,
        'first_name': firstName,
        'middle_name': middleName,
        'last_name': lastName,
        'phone': phone,
      };
}
