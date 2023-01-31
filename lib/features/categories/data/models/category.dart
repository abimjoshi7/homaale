class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    this.icon,
    this.extraData,
  });

  int id;
  String name;
  String slug;
  dynamic icon;
  Map<String, dynamic>? extraData;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] as int,
        name: json["name"] as String,
        slug: json["slug"] as String,
        icon: json["icon"],
        extraData: json["extra_data"] as Map<String, dynamic>,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "extra_data": extraData,
      };
}
