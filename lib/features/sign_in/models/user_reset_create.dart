class UserResetCreate {
  UserResetCreate({
    this.email,
    this.phone,
  });

  final String? email;
  final String? phone;

  factory UserResetCreate.fromMap(Map<String, dynamic> json) => UserResetCreate(
        email: json["email"] as String?,
        phone: json["phone"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "phone": phone,
      };
}
