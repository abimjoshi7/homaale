class TaskHeroCategory {
  TaskHeroCategory({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });

  factory TaskHeroCategory.fromJson(Map<String, dynamic> json) =>
      TaskHeroCategory(
        totalPages: json['total_pages'] as int?,
        count: json['count'] as int?,
        current: json['current'] as int?,
        next: json['next'],
        previous: json['previous'],
        pageSize: json['page_size'] as int?,
        result: List<Result>.from(
          (json['result']).map(
            (dynamic x) => Result.fromJson(x as Map<String, dynamic>),
          ) as Iterable<dynamic>,
        ),
      );

  final int? totalPages;
  final int? count;
  final int? current;
  final dynamic next;
  final dynamic previous;
  final int? pageSize;
  final List<Result>? result;

  Map<String, dynamic> toJson() => {
        'total_pages': totalPages,
        'count': count,
        'current': current,
        'next': next,
        'previous': previous,
        'page_size': pageSize,
        'result': List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.category,
    this.isActive,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        isActive: json['is_active'] as bool?,
      );

  final int? id;
  final Category? category;
  final bool? isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category?.toJson(),
        'is_active': isActive,
      };
}

class Category {
  Category({
    this.name,
    this.icon,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['name'] as String?,
        icon: json['icon'],
        slug: json['slug'] as String?,
      );

  final String? name;
  final dynamic icon;
  final String? slug;

  Map<String, dynamic> toJson() => {
        'name': name,
        'icon': icon,
        'slug': slug,
      };
}
