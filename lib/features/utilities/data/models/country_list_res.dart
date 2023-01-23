class CountryListRes {
  CountryListRes({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory CountryListRes.fromJson(Map<String, dynamic> json) => CountryListRes(
        name: json["name"] as String?,
        code: json["code"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
