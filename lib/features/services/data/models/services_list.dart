class ServiceList {
  ServiceList({
    this.id,
    this.createdBy,
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
    this.views,
  });

  final String? id;
  final String? createdBy;
  final Category? category;
  final List<dynamic>? images;
  final List<dynamic>? videos;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final bool? isActive;
  final String? title;
  final dynamic description;
  final bool? isVerified;
  final int? viewsCount;
  final String? slug;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaKeyword;
  final List<dynamic>? views;

  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
        id: json["id"] as String?,
        createdBy: json["created_by"] as String?,
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"] as Map<String, dynamic>),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"].map((x) => x) as Iterable),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(json["videos"].map((x) => x) as Iterable),
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
        description: json["description"] as dynamic,
        isVerified: json["is_verified"] as bool?,
        viewsCount: json["views_count"] as int?,
        slug: json["slug"] as String?,
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        views: json["views"] == null
            ? []
            : List<dynamic>.from(json["views"].map((x) => x) as Iterable),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "category": category?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
        icon: json["icon"],
        extraData: json["extra_data"] == null
            ? null
            : json["extra_data"] as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "extra_data": extraData,
      };
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImage,
    this.bio,
    this.createdAt,
    this.designation,
    this.userType,
    this.isProfileVerified,
    this.isFollowed,
    this.isFollowing,
    this.avatar,
  });

  final String? id;
  final String? username;
  final String? email;
  final dynamic phone;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileImage;
  final String? bio;
  final DateTime? createdAt;
  final String? designation;
  final dynamic userType;
  final dynamic isProfileVerified;
  final bool? isFollowed;
  final bool? isFollowing;
  final dynamic avatar;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"] as String?,
        username: json["username"] as String?,
        email: json["email"] as String?,
        phone: json["phone"] as dynamic,
        firstName: json["first_name"] as String?,
        middleName: json["middle_name"] as String?,
        lastName: json["last_name"] as String?,
        profileImage: json["profile_image"] as String?,
        bio: json["bio"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(
                json["created_at"] as String,
              ),
        designation: json["designation"] as String?,
        userType: json["user_type"],
        isProfileVerified: json["is_profile_verified"],
        isFollowed: json["is_followed"] as bool?,
        isFollowing: json["is_following"] as bool?,
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "profile_image": profileImage,
        "bio": bio,
        "created_at": createdAt?.toIso8601String(),
        "designation": designation,
        "user_type": userType,
        "is_profile_verified": isProfileVerified,
        "is_followed": isFollowed,
        "is_following": isFollowing,
        "avatar": avatar,
      };
}
