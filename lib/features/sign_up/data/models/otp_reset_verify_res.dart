class OtpResetVerifyRes {
  OtpResetVerifyRes({
    this.success,
    this.message,
  });
  factory OtpResetVerifyRes.fromJson(Map<String, dynamic> json) =>
      OtpResetVerifyRes(
        success: json['success'] as bool,
        message: json['message'] as String?,
      );

  final bool? success;
  final String? message;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
