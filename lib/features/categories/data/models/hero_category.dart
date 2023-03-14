class HeroCategory {
  HeroCategory({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });

  final int? totalPages;
  final int? count;
  final int? current;
  final dynamic next;
  final dynamic previous;
  final int? pageSize;
  final List<Result?>? result;

  factory HeroCategory.fromJson(Map<String, dynamic> json) => HeroCategory(
        totalPages: json["total_pages"] as int?,
        count: json["count"] as int?,
        current: json["current"] as int?,
        next: json["next"],
        previous: json["previous"],
        pageSize: json["page_size"] as int?,
        result: json["result"] == null
            ? []
            : List<Result?>.from(
                (json["result"]!).map(
                  (x) => Result.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "total_pages": totalPages,
        "count": count,
        "current": current,
        "next": next,
        "previous": previous,
        "page_size": pageSize,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x!.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.category,
    this.isActive,
  });

  final int? id;
  final CategoryHero? category;
  final bool? isActive;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as int?,
        category: CategoryHero.fromJson(json["category"] as Map<String, dynamic>),
        isActive: json["is_active"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category!.toJson(),
        "is_active": isActive,
      };
}

class CategoryHero {
  CategoryHero({
    this.name,
    this.icon,
    this.slug,
  });

  final String? name;
  final dynamic icon;
  final String? slug;

  factory CategoryHero.fromJson(Map<String, dynamic> json) => CategoryHero(
        name: json["name"] as String?,
        icon: json["icon"],
        slug: json["slug"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "slug": slug,
      };
}
