class GoogleLoginRes {
  GoogleLoginRes({
    this.access,
    this.refresh,
  });

  final String? access;
  final String? refresh;

  factory GoogleLoginRes.fromJson(Map<String, dynamic> json) => GoogleLoginRes(
        access: json["access"] as String?,
        refresh: json["refresh"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
