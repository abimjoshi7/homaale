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

  final int? totalPages;
  final int? count;
  final int? current;
  final dynamic next;
  final dynamic previous;
  final int? pageSize;
  final List<Result>? result;

  factory TaskHeroCategory.fromJson(Map<String, dynamic> json) =>
      TaskHeroCategory(
        totalPages: json['total_pages'] as int?,
        count: json['count'] as int?,
        current: json['current'] as int?,
        next: json['next'],
        previous: json['previous'],
        pageSize: json['page_size'] as int?,
        result: List<Result>.from(
          json['result'].map(
            (x) => Result.fromJson(x as Map<String, dynamic>),
          ) as Iterable<dynamic>,
        ),
      );

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

  final int? id;
  final Category? category;
  final bool? isActive;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        isActive: json['is_active'] as bool?,
      );

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

  final String? name;
  final dynamic icon;
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['name'] as String?,
        icon: json['icon'],
        slug: json['slug'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'icon': icon,
        'slug': slug,
      };
}
