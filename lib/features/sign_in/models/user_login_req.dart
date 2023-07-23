class UserLoginReq {
  UserLoginReq({
    this.username,
    this.password,
    this.fcmToken,
  });

  factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        username: json['username'] as String?,
        password: json['password'] as String?,
        fcmToken: json['fcm'] as String?,
      );

  final String? username;
  final String? password;
  final String? fcmToken;

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'fcm': fcmToken,
      };
}
