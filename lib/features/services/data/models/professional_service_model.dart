class ProfessionalServiceCategoryModel {
  ProfessionalServiceCategoryModel({
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
  final String? next;
  final dynamic previous;
  final int? pageSize;
  final List<Result>? result;

  factory ProfessionalServiceCategoryModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProfessionalServiceCategoryModel(
        totalPages: json["total_pages"] as int?,
        count: json["count"] as int?,
        current: json["current"] as int?,
        next: json["next"] as String?,
        previous: json["previous"] as int?,
        pageSize: json["page_size"] as int?,
        result: json["result"] == null
            ? []
            : List<Result>.from(
                json["result"]!.map(
                  (x) => Result.fromJson(
                    x as Map<String, dynamic>,
                  ),
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
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.category,
    this.images,
    this.videos,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isActive,
    this.title,
    this.description,
    this.isVerified,
    this.viewsCount,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.metaKeyword,
    this.createdBy,
    this.views,
  });

  final String? id;
  final Category? category;
  final List<Image>? images;
  final List<dynamic>? videos;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final bool? isActive;
  final String? title;
  final String? description;
  final bool? isVerified;
  final int? viewsCount;
  final String? slug;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaKeyword;
  final String? createdBy;
  final List<dynamic>? views;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as String?,
        category: json["category"] == null
            ? null
            : Category.fromJson(
                json["category"] as Map<String, dynamic>,
              ),
        images: json["images"] == null
            ? []
            : List<Image>.from(
                json["images"].map(
                  (x) => Image.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(
                json["videos"].map((x) => x) as Iterable,
              ),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(
                json["created_at"] as String,
              ),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(
                json["updated_at"] as String,
              ),
        deletedAt: json["deleted_at"],
        isActive: json["is_active"] as bool?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        isVerified: json["is_verified"] as bool?,
        viewsCount: json["views_count"] as int?,
        slug: json["slug"] as String?,
        metaTitle: json["meta_title"] as String?,
        metaDescription: json["meta_description"] as String?,
        metaKeyword: json["meta_keyword"] as String?,
        createdBy: json["created_by"] as String?,
        views: json["views"] == null
            ? []
            : List<dynamic>.from(
                json["views"].map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "is_active": isActive,
        "title": title,
        "description": description,
        "is_verified": isVerified,
        "views_count": viewsCount,
        "slug": slug,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "created_by": createdBy,
        "views": views == null ? [] : List<dynamic>.from(views!.map((x) => x)),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.extraData,
  });

  final int? id;
  final String? name;
  final String? slug;
  final dynamic icon;
  final Map<String, dynamic>? extraData;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as int?,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        icon: json["icon"] as String?,
        extraData: json["extra_data"] as Map<String, dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "extra_data": extraData,
      };
}

class Image {
  Image({
    this.id,
    this.name,
    this.size,
    this.mediaType,
    this.media,
  });

  final int? id;
  final String? name;
  final String? size;
  final String? mediaType;
  final String? media;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] as int?,
        name: json["name"] as String?,
        size: json["size"] as String?,
        mediaType: json["media_type"] as String?,
        media: json["media"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
        "media_type": mediaType,
        "media": media,
      };
}
