class TaskCategory {
  TaskCategory({
    this.id,
    this.name,
    this.slug,
    this.icon,
  });

  factory TaskCategory.fromJson(Map<String, dynamic> json) => TaskCategory(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        icon: json['icon'] as dynamic,
      );

  final int? id;
  final String? name;
  final String? slug;
  final dynamic icon;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'icon': icon,
      };
}
