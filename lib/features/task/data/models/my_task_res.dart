class MyTaskRes {
  MyTaskRes({
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

  factory MyTaskRes.fromJson(Map<String, dynamic> json) => MyTaskRes(
        totalPages: json["total_pages"] as int?,
        count: json["count"] as int?,
        current: json["current"] as int?,
        next: json["next"],
        previous: json["previous"],
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
    this.createdBy,
    this.currency,
    this.city,
    this.images,
    this.videos,
    this.service,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.highlights,
    this.budgetType,
    this.budgetFrom,
    this.budgetTo,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.shareLocation,
    this.isNegotiable,
    this.revisions,
    this.recursionType,
    this.viewsCount,
    this.location,
    this.isProfessional,
    this.isOnline,
    this.isRequested,
    this.discountType,
    this.discountValue,
    this.extraData,
    this.noOfReservation,
    this.slug,
    this.isActive,
    this.needsApproval,
    this.isEndorsed,
    this.merchant,
    this.event,
    this.avatar,
  });

  final String? id;
  final CreatedBy? createdBy;
  final Currency? currency;
  final City? city;
  final List<dynamic>? images;
  final List<dynamic>? videos;
  final Service? service;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? description;
  final Map<String, String>? highlights;
  final String? budgetType;
  final num? budgetFrom;
  final num? budgetTo;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final String? endTime;
  final bool? shareLocation;
  final bool? isNegotiable;
  final int? revisions;
  final dynamic recursionType;
  final int? viewsCount;
  final String? location;
  final bool? isProfessional;
  final bool? isOnline;
  final bool? isRequested;
  final String? discountType;
  final double? discountValue;
  final Map<String, dynamic>? extraData;
  final int? noOfReservation;
  final String? slug;
  final bool? isActive;
  final bool? needsApproval;
  final bool? isEndorsed;
  final dynamic merchant;
  final dynamic event;
  final int? avatar;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as String?,
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(
                json["created_by"] as Map<String, dynamic>,
              ),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(
                json["currency"] as Map<String, dynamic>,
              ),
        city: json["city"] == null
            ? null
            : City.fromJson(
                json["city"] as Map<String, dynamic>,
              ),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(
                json["images"]!.map((x) => x) as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(
                json["videos"]!.map((x) => x) as Iterable,
              ),
        service: json["service"] == null
            ? null
            : Service.fromJson(
                json["service"] as Map<String, dynamic>,
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
        title: json["title"] as String?,
        description: json["description"] as String?,
        highlights: Map.from(
          json["highlights"] as Map<String, dynamic>,
        ).map(
          (k, v) => MapEntry<String, String>(
            k as String,
            v as String,
          ),
        ),
        budgetType: json["budget_type"] as String?,
        budgetFrom: json["budget_from"] as num?,
        budgetTo: json["budget_to"] as num?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(
                json["start_date"] as String,
              ),
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(
                json["end_date"] as String,
              ),
        startTime: json["start_time"] as String?,
        endTime: json["end_time"] as String?,
        shareLocation: json["share_location"] as bool?,
        isNegotiable: json["is_negotiable"] as bool?,
        revisions: json["revisions"] as int?,
        recursionType: json["recursion_type"] as String?,
        viewsCount: json["views_count"] as int?,
        location: json["location"] as String?,
        isProfessional: json["is_professional"] as bool?,
        isOnline: json["is_online"] as bool?,
        isRequested: json["is_requested"] as bool?,
        discountType: json["discount_type"] as String?,
        discountValue: json["discount_value"] as double?,
        extraData: json["extra_data"] == null
            ? null
            : json["extra_data"] as Map<String, dynamic>,
        noOfReservation: json["no_of_reservation"] as int?,
        slug: json["slug"] as String?,
        isActive: json["is_active"] as bool?,
        needsApproval: json["needs_approval"] as bool?,
        isEndorsed: json["is_endorsed"] as bool?,
        merchant: json["merchant"],
        event: json["event"],
        avatar: json["avatar"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy?.toJson(),
        "currency": currency?.toJson(),
        "city": city?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "service": service?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "description": description,
        "highlights": Map.from(highlights!).map(
          (k, v) => MapEntry<String, dynamic>(
            k as String,
            v,
          ),
        ),
        "budget_type": budgetType,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "share_location": shareLocation,
        "is_negotiable": isNegotiable,
        "revisions": revisions,
        "recursion_type": recursionType,
        "views_count": viewsCount,
        "location": location,
        "is_professional": isProfessional,
        "is_online": isOnline,
        "is_requested": isRequested,
        "discount_type": discountType,
        "discount_value": discountValue,
        "extra_data": extraData,
        "no_of_reservation": noOfReservation,
        "slug": slug,
        "is_active": isActive,
        "needs_approval": needsApproval,
        "is_endorsed": isEndorsed,
        "merchant": merchant,
        "event": event,
        "avatar": avatar,
      };
}

class City {
  City({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.country,
  });

  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final Country? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] as int?,
        name: json["name"] as String?,
        latitude: json["latitude"] as double?,
        longitude: json["longitude"] as double?,
        country: json["country"] == null
            ? null
            : Country.fromJson(
                json["country"] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "country": country?.toJson(),
      };
}

class Country {
  Country({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] as String?,
        code: json["code"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
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
    this.badge,
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
  final String? userType;
  final String? isProfileVerified;
  final bool? isFollowed;
  final bool? isFollowing;
  final Avatar? avatar;
  final Badge? badge;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"] as String?,
        username: json["username"] as String?,
        email: json["email"] as String?,
        phone: json["phone"] as String?,
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
        userType: json["user_type"] as String?,
        isProfileVerified: json["is_profile_verified"] as String?,
        isFollowed: json["is_followed"] as bool?,
        isFollowing: json["is_following"] as bool?,
        avatar: json["avatar"] == null
            ? null
            : Avatar.fromJson(
                json["avatar"] as Map<String, dynamic>,
              ),
        badge: json["badge"] == null
            ? null
            : Badge.fromJson(
                json["badge"] as Map<String, dynamic>,
              ),
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
        "avatar": avatar?.toJson(),
        "badge": badge?.toJson(),
      };
}

class Avatar {
  Avatar({
    this.image,
  });

  final dynamic image;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Badge {
  Badge({
    this.id,
    this.image,
    this.title,
  });

  final int? id;
  final String? image;
  final String? title;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"] as int?,
        image: json["image"] as String?,
        title: json["title"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
      };
}

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  final String? code;
  final String? name;
  final String? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"] as String?,
        name: json["name"] as String?,
        symbol: json["symbol"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class Service {
  Service({
    this.id,
    this.title,
    this.isActive,
    this.isVerified,
    this.category,
    this.images,
  });

  final String? id;
  final String? title;
  final bool? isActive;
  final bool? isVerified;
  final Category? category;
  final List<dynamic>? images;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"] as String?,
        title: json["title"] as String?,
        isActive: json["is_active"] as bool?,
        isVerified: json["is_verified"] as bool?,
        category: json["category"] == null
            ? null
            : Category.fromJson(
                json["category"] as Map<String, dynamic>,
              ),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(
                json["images"]!.map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_active": isActive,
        "is_verified": isVerified,
        "category": category?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.level,
    this.slug,
  });

  final int? id;
  final String? name;
  final int? level;
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as int?,
        name: json["name"] as String?,
        level: json["level"] as int?,
        slug: json["slug"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "level": level,
        "slug": slug,
      };
}
