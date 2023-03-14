class TaskModel {
  TaskModel({
    this.id,
    this.currency,
    this.city,
    this.createdBy,
    this.service,
    this.images,
    this.videos,
    this.rating,
    this.count,
    this.offers,
    this.endorsements,
    this.isRedeemable,
    this.event,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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
    this.avatar,
  });

  final String? id;
  final Currency? currency;
  final City? city;
  final CreatedBy? createdBy;
  final Service? service;
  final List<dynamic>? images;
  final List<dynamic>? videos;
  final dynamic rating;
  final num? count;
  final List<Offer>? offers;
  final List<dynamic>? endorsements;
  final bool? isRedeemable;
  final dynamic event;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? title;
  final String? description;
  final dynamic highlights;
  final String? budgetType;
  final num? budgetFrom;
  final num? budgetTo;
  final DateTime? startDate;
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
  final String? discountType;
  final num? discountValue;
  final dynamic extraData;
  final num? noOfReservation;
  final String? slug;
  final bool? isActive;
  final bool? needsApproval;
  final bool? isEndorsed;
  final dynamic merchant;
  final num? avatar;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"] as String?,
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
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(
                json["created_by"] as Map<String, dynamic>,
              ),
        service: json["service"] == null
            ? null
            : Service.fromJson(
                json["service"] as Map<String, dynamic>,
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
        rating: json["rating"],
        count: json["count"] as num?,
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(
                json["offers"]!.map(
                  (x) => Offer.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        endorsements: json["endorsements"] == null
            ? []
            : List<dynamic>.from(
                json["endorsements"]!.map((x) => x) as Iterable,
              ),
        isRedeemable: json["is_redeemable"] as bool?,
        event: json["event"],
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
        title: json["title"] as String?,
        description: json["description"] as String?,
        highlights:
            json["highlights"] == null ? null : json["highlights"] as dynamic,
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
        discountType: json["discount_type"] as String?,
        discountValue: json["discount_value"] as num?,
        extraData:
            json["extra_data"] == null ? null : json["extra_data"] as dynamic,
        noOfReservation: json["no_of_reservation"] as num?,
        slug: json["slug"] as String?,
        isActive: json["is_active"] as bool?,
        needsApproval: json["needs_approval"] as bool?,
        isEndorsed: json["is_endorsed"] as bool?,
        merchant: json["merchant"],
        avatar: json["avatar"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency": currency?.toJson(),
        "city": city?.toJson(),
        "created_by": createdBy?.toJson(),
        "service": service?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "rating": rating,
        "count": count,
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
        "endorsements": endorsements == null
            ? []
            : List<dynamic>.from(endorsements!.map((x) => x)),
        "is_redeemable": isRedeemable,
        "event": event,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "title": title,
        "description": description,
        "highlights": highlights,
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
    this.fullName,
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
  final String? fullName;
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
        phone: json["phone"],
        fullName: json["full_name"] as String?,
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
        "full_name": fullName,
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

class Offer {
  Offer({
    this.id,
    this.title,
    this.description,
    this.image,
    this.offerType,
    this.code,
    this.offerRule,
    this.free,
  });

  final num? id;
  final String? title;
  final String? description;
  final String? image;
  final String? offerType;
  final String? code;
  final num? offerRule;
  final String? free;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"] as num?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
        offerType: json["offer_type"] as String?,
        code: json["code"] as String?,
        offerRule: json["offer_rule"] as num?,
        free: json["free"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "offer_type": offerType,
        "code": code,
        "offer_rule": offerRule,
        "free": free,
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
