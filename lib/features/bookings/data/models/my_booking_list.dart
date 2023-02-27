class MyBookingList {
  MyBookingList({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });

  final num? totalPages;
  final num? count;
  final num? current;
  final String? next;
  final dynamic previous;
  final num? pageSize;
  final List<Result>? result;

  factory MyBookingList.fromJson(Map<String, dynamic> json) => MyBookingList(
        totalPages: json["total_pages"] as num?,
        count: json["count"] as num?,
        current: json["current"] as num?,
        next: json["next"] as String?,
        previous: json["previous"] as dynamic,
        pageSize: json["page_size"] as num?,
        result: json["result"] == null
            ? []
            : List<Result>.from(
                json["result"].map(
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
    this.entityService,
    this.images,
    this.videos,
    this.progressPercent,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.requirements,
    this.budgetFrom,
    this.budgetTo,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.location,
    this.isActive,
    this.status,
    this.extraData,
    this.isAccepted,
    this.bookingMerchant,
    this.city,
  });

  final num? id;
  final ResultCreatedBy? createdBy;
  final EntityService? entityService;
  final List<Image>? images;
  final List<dynamic>? videos;
  final num? progressPercent;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;
  final Map<String, dynamic>? requirements;
  final num? budgetFrom;
  final num? budgetTo;
  final DateTime? startDate;
  final DateTime? endDate;
  final dynamic startTime;
  final dynamic endTime;
  final String? location;
  final bool? isActive;
  final String? status;
  final dynamic extraData;
  final bool? isAccepted;
  final dynamic bookingMerchant;
  final num? city;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as num?,
        createdBy: json["created_by"] == null
            ? null
            : ResultCreatedBy.fromJson(
                json["created_by"] as Map<String, dynamic>,
              ),
        entityService: json["entity_service"] == null
            ? null
            : EntityService.fromJson(
                json["entity_service"] as Map<String, dynamic>,
              ),
        images: json["images"] == null
            ? []
            : List<Image>.from(
                json["images"]!
                        .map((x) => Image.fromJson(x as Map<String, dynamic>))
                    as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(json["videos"]!.map((x) => x) as Iterable),
        progressPercent: json["progress_percent"] as num?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        description: json["description"] as String?,
        requirements: json["requirements"] as Map<String, dynamic>,
        budgetFrom: json["budget_from"] as num?,
        budgetTo: json["budget_to"] as num?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"] as String),
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(json["end_date"] as String),
        startTime: json["start_time"],
        endTime: json["end_time"],
        location: json["location"] as String?,
        isActive: json["is_active"] as bool?,
        status: json["status"] as String?,
        extraData: json["extra_data"],
        isAccepted: json["is_accepted"] as bool?,
        bookingMerchant: json["booking_merchant"],
        city: json["city"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy?.toJson(),
        "entity_service": entityService?.toJson(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "progress_percent": progressPercent,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "description": description,
        "requirements": requirements,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "location": location,
        "is_active": isActive,
        "status": status,
        "extra_data": extraData,
        "is_accepted": isAccepted,
        "booking_merchant": bookingMerchant,
        "city": city,
      };
}

class ResultCreatedBy {
  ResultCreatedBy({
    this.id,
    this.user,
    this.bio,
    this.userType,
    this.profileImage,
    this.stats,
    this.skill,
    this.chargeCurrency,
    this.hourlyRate,
  });

  final num? id;
  final User? user;
  final String? bio;
  final String? userType;
  final String? profileImage;
  final Stats? stats;
  final String? skill;
  final Currency? chargeCurrency;
  final num? hourlyRate;

  factory ResultCreatedBy.fromJson(Map<String, dynamic> json) =>
      ResultCreatedBy(
        id: json["id"] as num?,
        user: json["user"] == null
            ? null
            : User.fromJson(json["user"] as Map<String, dynamic>),
        bio: json["bio"] as String?,
        userType: json["user_type"] as String?,
        profileImage: json["profile_image"] as String?,
        stats: json["stats"] == null
            ? null
            : Stats.fromJson(json["stats"] as Map<String, dynamic>),
        skill: json["skill"] as String?,
        chargeCurrency: json["charge_currency"] == null
            ? null
            : Currency.fromJson(
                json["charge_currency"] as Map<String, dynamic>,
              ),
        hourlyRate: json["hourly_rate"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "bio": bio,
        "user_type": userType,
        "profile_image": profileImage,
        "stats": stats?.toJson(),
        "skill": skill,
        "charge_currency": chargeCurrency?.toJson(),
        "hourly_rate": hourlyRate,
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

class Stats {
  Stats({
    this.successRate,
    this.happyClients,
    this.taskCompleted,
    this.userReviews,
    this.taskAssigned,
    this.taskInProgress,
    this.taskCancelled,
  });

  final num? successRate;
  final num? happyClients;
  final num? taskCompleted;
  final num? userReviews;
  final num? taskAssigned;
  final num? taskInProgress;
  final num? taskCancelled;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        successRate: json["success_rate"] as num?,
        happyClients: json["happy_clients"] as num?,
        taskCompleted: json["task_completed"] as num?,
        userReviews: json["user_reviews"] as num?,
        taskAssigned: json["task_assigned"] as num?,
        taskInProgress: json["task_in_progress"] as num?,
        taskCancelled: json["task_cancelled"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "success_rate": successRate,
        "happy_clients": happyClients,
        "task_completed": taskCompleted,
        "user_reviews": userReviews,
        "task_assigned": taskAssigned,
        "task_in_progress": taskInProgress,
        "task_cancelled": taskCancelled,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.firstName,
    this.middleName,
    this.lastName,
    this.createdAt,
  });

  final String? id;
  final String? username;
  final String? email;
  final dynamic phone;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] as String?,
        username: json["username"] as String?,
        email: json["email"] as String?,
        phone: json["phone"],
        firstName: json["first_name"] as String?,
        middleName: json["middle_name"] as String?,
        lastName: json["last_name"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "created_at": createdAt?.toIso8601String(),
      };
}

class EntityService {
  EntityService({
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
  final EntityServiceCreatedBy? createdBy;
  final Currency? currency;
  final City? city;
  final List<dynamic>? images;
  final List<dynamic>? videos;
  final Service? service;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? description;
  final List<String>? highlights;
  final String? budgetType;
  final num? budgetFrom;
  final num? budgetTo;
  final dynamic startDate;
  final DateTime? endDate;
  final dynamic startTime;
  final dynamic endTime;
  final bool? shareLocation;
  final bool? isNegotiable;
  final num? revisions;
  final dynamic recursionType;
  final num? viewsCount;
  final String? location;
  final bool? isProfessional;
  final bool? isOnline;
  final bool? isRequested;
  final dynamic discountType;
  final dynamic discountValue;
  final List<dynamic>? extraData;
  final num? noOfReservation;
  final String? slug;
  final bool? isActive;
  final bool? needsApproval;
  final bool? isEndorsed;
  final dynamic merchant;
  final dynamic event;
  final dynamic avatar;

  factory EntityService.fromJson(Map<String, dynamic> json) => EntityService(
        id: json["id"] as String?,
        createdBy: json["created_by"] == null
            ? null
            : EntityServiceCreatedBy.fromJson(
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
            : List<dynamic>.from(json["images"].map((x) => x) as Iterable),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(json["videos"].map((x) => x) as Iterable),
        service: json["service"] == null
            ? null
            : Service.fromJson(
                json["service"] as Map<String, dynamic>,
              ),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        title: json["title"] as String?,
        description: json["description"] as String?,
        highlights: json["highlights"] == null
            ? []
            : List<String>.from(json["highlights"].map((x) => x) as Iterable),
        budgetType: json["budget_type"] as String?,
        budgetFrom: json["budget_from"] as num?,
        budgetTo: json["budget_to"] as num?,
        startDate: json["start_date"],
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(
                json["end_date"] as String,
              ),
        startTime: json["start_time"],
        endTime: json["end_time"],
        shareLocation: json["share_location"] as bool?,
        isNegotiable: json["is_negotiable"] as bool?,
        revisions: json["revisions"] as num?,
        recursionType: json["recursion_type"],
        viewsCount: json["views_count"] as num?,
        location: json["location"] as String?,
        isProfessional: json["is_professional"] as bool?,
        isOnline: json["is_online"] as bool?,
        isRequested: json["is_requested"] as bool?,
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        extraData: json["extra_data"] == null
            ? []
            : List<dynamic>.from(json["extra_data"].map((x) => x) as Iterable),
        noOfReservation: json["no_of_reservation"] as num?,
        slug: json["slug"] as String?,
        isActive: json["is_active"] as bool?,
        needsApproval: json["needs_approval"] as bool?,
        isEndorsed: json["is_endorsed"] as bool?,
        merchant: json["merchant"],
        event: json["event"],
        avatar: json["avatar"],
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
        "highlights": highlights == null
            ? []
            : List<dynamic>.from(highlights!.map((x) => x)),
        "budget_type": budgetType,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date": startDate,
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
        "extra_data": extraData == null
            ? []
            : List<dynamic>.from(extraData!.map((x) => x)),
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

  final num? id;
  final String? name;
  final num? latitude;
  final num? longitude;
  final Country? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] as num?,
        name: json["name"] as String?,
        latitude: json["latitude"] as num?,
        longitude: json["longitude"] as num?,
        country: json["country"] == null
            ? null
            : Country.fromJson(json["country"] as Map<String, dynamic>),
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

class EntityServiceCreatedBy {
  EntityServiceCreatedBy({
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
  final Map<String, dynamic>? avatar;
  final Badge? badge;

  factory EntityServiceCreatedBy.fromJson(Map<String, dynamic> json) =>
      EntityServiceCreatedBy(
        id: json["id"] as String?,
        username: json["username"] as String?,
        email: json["email"] as String?,
        phone: json["phone"],
        firstName: json["first_name"] as String?,
        middleName: json["middle_name"] as String?,
        lastName: json["last_name"] as String?,
        profileImage: json["profile_image"] as String?,
        bio: json["bio"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        designation: json["designation"] as String?,
        userType: json["user_type"] as String?,
        isProfileVerified: json["is_profile_verified"] as String?,
        isFollowed: json["is_followed"] as bool?,
        isFollowing: json["is_following"] as bool?,
        avatar: json["avatar"] == null
            ? null
            : json["avatar"] as Map<String, dynamic>,
        badge: json["badge"] == null
            ? null
            : Badge.fromJson(json["badge"] as Map<String, dynamic>),
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
        "badge": badge?.toJson(),
      };
}

class Badge {
  Badge({
    this.id,
    this.image,
    this.title,
  });

  final num? id;
  final String? image;
  final String? title;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"] as num?,
        image: json["image"] as String?,
        title: json["title"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
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
            : Category.fromJson(json["category"] as Map<String, dynamic>),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"].map((x) => x) as Iterable),
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

  final num? id;
  final String? name;
  final num? level;
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as num?,
        name: json["name"] as String?,
        level: json["level"] as num?,
        slug: json["slug"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "level": level,
        "slug": slug,
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

  final num? id;
  final String? name;
  final String? size;
  final String? mediaType;
  final String? media;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] as num?,
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
