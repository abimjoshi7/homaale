class AllTaskList {
  AllTaskList({
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

  factory AllTaskList.fromJson(Map<String, dynamic> json) => AllTaskList(
        totalPages: json["total_pages"] as int?,
        count: json["count"] as int?,
        current: json["current"] as int?,
        next: json["next"] as String?,
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
    this.assigner,
    this.assignee,
    this.entityService,
    this.currency,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.status,
    this.title,
    this.description,
    this.requirements,
    this.charge,
    this.location,
    this.estimatedTime,
    this.slug,
    this.startDate,
    this.endDate,
    this.completedOn,
    this.startTime,
    this.endTime,
    this.extraData,
    this.isPaid,
    this.booking,
    this.city,
    this.images,
    this.videos,
  });

  final String? id;
  final Assignee? assigner;
  final Assignee? assignee;
  final EntityService? entityService;
  final Currency? currency;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isActive;
  final String? status;
  final String? title;
  final String? description;
  final List<String>? requirements;
  final double? charge;
  final String? location;
  final int? estimatedTime;
  final String? slug;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? completedOn;
  final String? startTime;
  final String? endTime;
  final List<dynamic>? extraData;
  final bool? isPaid;
  final int? booking;
  final int? city;
  final List<dynamic>? images;
  final List<dynamic>? videos;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as String?,
        assigner: json["assigner"] == null
            ? null
            : Assignee.fromJson(
                json["assigner"] as Map<String, dynamic>,
              ),
        assignee: json["assignee"] == null
            ? null
            : Assignee.fromJson(
                json["assignee"] as Map<String, dynamic>,
              ),
        entityService: json["entity_service"] == null
            ? null
            : EntityService.fromJson(
                json["entity_service"] as Map<String, dynamic>,
              ),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(
                json["currency"] as Map<String, dynamic>,
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
        isActive: json["is_active"] as bool?,
        status: json["status"] as String?,
        title: json["title"] as String,
        description: json["description"] as String,
        requirements: json["requirements"] == null
            ? []
            : List<String>.from(
                json["requirements"]!.map((x) => x) as Iterable,
              ),
        charge: json["charge"] as double?,
        location: json["location"] as String?,
        estimatedTime: json["estimated_time"] as int?,
        slug: json["slug"] as String?,
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
        completedOn: json["completed_on"] == null
            ? null
            : DateTime.parse(
                json["completed_on"] as String,
              ),
        startTime: json["start_time"] as String?,
        endTime: json["end_time"] as String?,
        extraData: json["extra_data"] == null
            ? []
            : List<dynamic>.from(
                json["extra_data"]!.map((x) => x) as Iterable,
              ),
        isPaid: json["is_paid"] as bool?,
        booking: json["booking"] as int?,
        city: json["city"] as int?,
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "assigner": assigner?.toJson(),
        "assignee": assignee?.toJson(),
        "entity_service": entityService?.toJson(),
        "currency": currency?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_active": isActive,
        "status": status,
        "title": title,
        "description": description,
        "requirements": requirements == null
            ? []
            : List<dynamic>.from(requirements!.map((x) => x)),
        "charge": charge,
        "location": location,
        "estimated_time": estimatedTime,
        "slug": slug,
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
        "completed_on":
            "${completedOn?.year.toString().padLeft(4, '0')}-${completedOn?.month.toString().padLeft(2, '0')}-${completedOn?.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "extra_data": extraData == null
            ? []
            : List<dynamic>.from(extraData!.map((x) => x)),
        "is_paid": isPaid,
        "booking": booking,
        "city": city,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
      };
}

class Assignee {
  Assignee({
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

  factory Assignee.fromJson(Map<String, dynamic> json) => Assignee(
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
    this.id,
  });

  final String? image;
  final int? id;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        image: json["image"] as String?,
        id: json["id"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
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

class EntityService {
  EntityService({
    this.id,
    this.budgetType,
    this.budgetFrom,
    this.budgetTo,
    this.images,
    this.videos,
    this.createdBy,
  });

  final String? id;
  final String? budgetType;
  final double? budgetFrom;
  final double? budgetTo;
  final List<Image>? images;
  final List<dynamic>? videos;
  final Assignee? createdBy;

  factory EntityService.fromJson(Map<String, dynamic> json) => EntityService(
        id: json["id"] as String?,
        budgetType: json["budget_type"] as String?,
        budgetFrom: json["budget_from"] as double?,
        budgetTo: json["budget_to"] as double?,
        images: json["images"] == null
            ? []
            : List<Image>.from(
                json["images"]!.map(
                  (x) => Image.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(
                json["videos"]!.map((x) => x) as Iterable,
              ),
        createdBy: json["created_by"] == null
            ? null
            : Assignee.fromJson(
                json["created_by"] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "budget_type": budgetType,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "created_by": createdBy?.toJson(),
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
