class OtpResetVerifyReq {
  OtpResetVerifyReq({
    this.phone,
    this.otp,
    this.password,
    this.confirmPassword,
    this.scope,
  });

  final String? phone;
  final String? otp;
  final String? password;
  final String? confirmPassword;
  final String? scope;

  factory OtpResetVerifyReq.fromMap(Map<String, dynamic> json) =>
      OtpResetVerifyReq(
        phone: json["phone"] as String?,
        otp: json["otp"] as String?,
        password: json["password"] as String?,
        confirmPassword: json["confirm_password"] as String?,
        scope: json["scope"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "otp": otp,
        "password": password,
        "confirm_password": confirmPassword,
        "scope": scope,
      };
}
