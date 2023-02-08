class FacebookLoginRes {
  FacebookLoginRes({
    this.access,
    this.refresh,
  });

  final String? access;
  final String? refresh;

  factory FacebookLoginRes.fromJson(Map<String, dynamic> json) =>
      FacebookLoginRes(
        access: json["access"] as String?,
        refresh: json["refresh"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
