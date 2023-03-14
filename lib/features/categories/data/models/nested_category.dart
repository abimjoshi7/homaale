class NestedCategory {
  NestedCategory({
    this.id,
    this.name,
    this.level,
    this.slug,
    this.icon,
    this.taskCount,
    this.child,
    this.serviceCount,
  });

  final int? id;
  final String? name;
  final int? level;
  final String? slug;
  final dynamic icon;
  final int? taskCount;
  final List<NestedCategory>? child;
  final int? serviceCount;

  NestedCategory copyWith({
    int? id,
    String? name,
    int? level,
    String? slug,
    dynamic icon,
    int? taskCount,
    List<NestedCategory>? child,
    int? serviceCount,
  }) =>
      NestedCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        level: level ?? this.level,
        slug: slug ?? this.slug,
        icon: icon ?? this.icon,
        taskCount: taskCount ?? this.taskCount,
        child: child ?? this.child,
        serviceCount: serviceCount ?? this.serviceCount,
      );

  factory NestedCategory.fromJson(Map<String, dynamic> json) => NestedCategory(
        id: json["id"] as int?,
        name: json["name"] as String?,
        level: json["level"] as int?,
        slug: json["slug"] as String?,
        icon: json["icon"] as dynamic,
        taskCount: json["task_count"] as int?,
        child: json["child"] == null
            ? []
            : List<NestedCategory>.from(
                json["child"]?.map(
                  (x) => NestedCategory.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        serviceCount: json["service_count"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "level": level,
        "slug": slug,
        "icon": icon,
        "task_count": taskCount,
        "child": child == null
            ? []
            : List<dynamic>.from(child!.map((x) => x.toJson())),
        "service_count": serviceCount,
      };
}
