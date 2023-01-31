class PasswordSecurity {
  PasswordSecurity({
    this.socialToken,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  final String? socialToken;
  final String? oldPassword;
  final String? newPassword;
  final String? confirmPassword;

  factory PasswordSecurity.fromJson(Map<String, dynamic> json) =>
      PasswordSecurity(
        socialToken: json["social_token"] as String?,
        oldPassword: json["old_password"] as String?,
        newPassword: json["new_password"] as String?,
        confirmPassword: json["confirm_password"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "social_token": socialToken,
        "old_password": oldPassword,
        "new_password": newPassword,
        "confirm_password": confirmPassword,
      };
}
