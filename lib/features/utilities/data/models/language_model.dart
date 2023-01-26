class LanguageModel {
  LanguageModel({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        code: json["code"] as String,
        name: json["name"] as String,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
