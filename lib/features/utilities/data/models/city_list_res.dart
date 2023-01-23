class CityListRes {
  CityListRes({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory CityListRes.fromJson(Map<String, dynamic> json) => CityListRes(
        id: json["id"] as int?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
