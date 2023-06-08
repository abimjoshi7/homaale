class GoogleLoginRes {
  GoogleLoginRes({
    this.access,
    this.refresh,
    this.hasProfile,
  });

  final String? access;
  final String? refresh;
  final bool? hasProfile;

  factory GoogleLoginRes.fromJson(Map<String, dynamic> json) => GoogleLoginRes(
        access: json["access"] as String?,
        refresh: json["refresh"] as String?,
        hasProfile: json["has_profile"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
        "has_profile": hasProfile,
      };
}
