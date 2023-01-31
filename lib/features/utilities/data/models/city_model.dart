class CityModel {
  CityModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"] as int?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
