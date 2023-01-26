class CountryModel {
  CountryModel({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] as String?,
        code: json["code"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
