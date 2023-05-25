class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    this.icon,
  });

  int id;
  String name;
  String slug;
  dynamic icon;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] as int,
        name: json["name"] as String,
        slug: json["slug"] as String,
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
      };
}
