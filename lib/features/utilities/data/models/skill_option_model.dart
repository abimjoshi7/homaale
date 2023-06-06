class SkillOptionModel {
  SkillOptionModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory SkillOptionModel.fromJson(Map<String, dynamic> json) =>
      SkillOptionModel(
        id: json["id"] as int?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
