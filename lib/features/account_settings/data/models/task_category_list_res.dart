class TaskCategoryListRes {
  TaskCategoryListRes({
    this.id,
    this.name,
    this.slug,
    this.icon,
  });

  final int? id;
  final String? name;
  final String? slug;
  final dynamic icon;

  factory TaskCategoryListRes.fromJson(Map<String, dynamic> json) =>
      TaskCategoryListRes(
        id: json["id"] as int?,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
      };
}
