import 'dart:convert';

class SkillOptionModel {
  int id;
  String name;

  SkillOptionModel({
    required this.id,
    required this.name,
  });

  factory SkillOptionModel.fromJson(Map<String, dynamic> json) =>
      SkillOptionModel(
        id: json["id"] as int,
        name: json["name"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
