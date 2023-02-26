class TaskerListRes {
  TaskerListRes({
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
  final List<Tasker>? result;

  factory TaskerListRes.fromJson(Map<String, dynamic> json) => TaskerListRes(
        totalPages: json["total_pages"] as num?,
        count: json["count"] as num?,
        current: json["current"] as num?,
        next: json["next"] as String?,
        previous: json["previous"],
        pageSize: json["page_size"] as num?,
        result: json["result"] == null
            ? []
            : List<Tasker>.from(
                json["result"]!.map(
                  (x) => Tasker.fromJson(
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

class Tasker {
  Tasker({
    this.id,
    this.chargeCurrency,
    this.user,
    this.portfolio,
    this.experience,
    this.education,
    this.certificates,
    this.stats,
    this.rating,
    this.country,
    this.language,
    this.city,
    this.interests,
    this.isFollowed,
    this.avatar,
    this.badge,
    this.status,
    this.bio,
    this.gender,
    this.profileImage,
    this.dateOfBirth,
    this.skill,
    this.activeHourStart,
    this.activeHourEnd,
    this.experienceLevel,
    this.userType,
    this.hourlyRate,
    this.profileVisibility,
    this.taskPreferences,
    this.addressLine1,
    this.addressLine2,
    this.isProfileVerified,
    this.designation,
    this.points,
    this.remainingPoints,
    this.followersCount,
    this.followingCount,
    this.subscription,
    this.securityQuestions,
  });

  final num? id;
  final ChargeCurrency? chargeCurrency;
  final User? user;
  final List<Portfolio>? portfolio;
  final List<Experience>? experience;
  final List<dynamic>? education;
  final List<dynamic>? certificates;
  final Stats? stats;
  final Rating? rating;
  final CountryClass? country;
  final CountryClass? language;
  final City? city;
  final List<Interest>? interests;
  final bool? isFollowed;
  final Avatar? avatar;
  final Badge? badge;
  final String? status;
  final String? bio;
  final String? gender;
  final String? profileImage;
  final DateTime? dateOfBirth;
  final String? skill;
  final String? activeHourStart;
  final String? activeHourEnd;
  final String? experienceLevel;
  final String? userType;
  final num? hourlyRate;
  final String? profileVisibility;
  final String? taskPreferences;
  final String? addressLine1;
  final String? addressLine2;
  final bool? isProfileVerified;
  final String? designation;
  final num? points;
  final num? remainingPoints;
  final num? followersCount;
  final num? followingCount;
  final List<dynamic>? subscription;
  final List<int>? securityQuestions;

  factory Tasker.fromJson(Map<String, dynamic> json) => Tasker(
        id: json["id"] as num?,
        chargeCurrency: json["charge_currency"] == null
            ? null
            : ChargeCurrency.fromJson(
                json["charge_currency"] as Map<String, dynamic>,
              ),
        user: json["user"] == null
            ? null
            : User.fromJson(
                json["user"] as Map<String, dynamic>,
              ),
        portfolio: json["portfolio"] == null
            ? []
            : List<Portfolio>.from(
                json["portfolio"]!.map(
                  (x) => Portfolio.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        experience: json["experience"] == null
            ? []
            : List<Experience>.from(
                json["experience"]!.map(
                  (x) => Experience.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        education: json["education"] == null
            ? []
            : List<dynamic>.from(
                json["education"]!.map((x) => x) as Iterable,
              ),
        certificates: json["certificates"] == null
            ? []
            : List<dynamic>.from(
                json["certificates"]!.map((x) => x) as Iterable,
              ),
        stats: json["stats"] == null
            ? null
            : Stats.fromJson(
                json["stats"] as Map<String, dynamic>,
              ),
        rating: json["rating"] == null
            ? null
            : Rating.fromJson(
                json["rating"] as Map<String, dynamic>,
              ),
        country: json["country"] == null
            ? null
            : CountryClass.fromJson(
                json["country"] as Map<String, dynamic>,
              ),
        language: json["language"] == null
            ? null
            : CountryClass.fromJson(
                json["language"] as Map<String, dynamic>,
              ),
        city: json["city"] == null
            ? null
            : City.fromJson(
                json["city"] as Map<String, dynamic>,
              ),
        interests: json["interests"] == null
            ? []
            : List<Interest>.from(
                json["interests"]!.map(
                  (x) => Interest.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        isFollowed: json["is_followed"] as bool?,
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
        status: json["status"] as String?,
        bio: json["bio"] as String?,
        gender: json["gender"] as String?,
        profileImage: json["profile_image"] as String?,
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(
                json["date_of_birth"] as String,
              ),
        skill: json["skill"] as String?,
        activeHourStart: json["active_hour_start"] as String?,
        activeHourEnd: json["active_hour_end"] as String?,
        experienceLevel: json["experience_level"] as String?,
        userType: json["user_type"] as String?,
        hourlyRate: json["hourly_rate"] as num?,
        profileVisibility: json["profile_visibility"] as String?,
        taskPreferences: json["task_preferences"] as String?,
        addressLine1: json["address_line1"] as String?,
        addressLine2: json["address_line2"] as String?,
        isProfileVerified: json["is_profile_verified"] as bool?,
        designation: json["designation"] as String?,
        points: json["points"] as num?,
        remainingPoints: json["remaining_points"] as num?,
        followersCount: json["followers_count"] as num?,
        followingCount: json["following_count"] as num?,
        subscription: json["subscription"] == null
            ? []
            : List<dynamic>.from(
                json["subscription"]!.map((x) => x) as Iterable,
              ),
        securityQuestions: json["security_questions"] == null
            ? []
            : List<int>.from(
                json["security_questions"]!.map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "charge_currency": chargeCurrency?.toJson(),
        "user": user?.toJson(),
        "portfolio": portfolio == null
            ? []
            : List<dynamic>.from(portfolio!.map((x) => x.toJson())),
        "experience": experience == null
            ? []
            : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "education": education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x)),
        "certificates": certificates == null
            ? []
            : List<dynamic>.from(certificates!.map((x) => x)),
        "stats": stats?.toJson(),
        "rating": rating?.toJson(),
        "country": country?.toJson(),
        "language": language?.toJson(),
        "city": city?.toJson(),
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x.toJson())),
        "is_followed": isFollowed,
        "avatar": avatar?.toJson(),
        "badge": badge?.toJson(),
        "status": status,
        "bio": bio,
        "gender": gender,
        "profile_image": profileImage,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "skill": skill,
        "active_hour_start": activeHourStart,
        "active_hour_end": activeHourEnd,
        "experience_level": experienceLevel,
        "user_type": userType,
        "hourly_rate": hourlyRate,
        "profile_visibility": profileVisibility,
        "task_preferences": taskPreferences,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "is_profile_verified": isProfileVerified,
        "designation": designation,
        "points": points,
        "remaining_points": remainingPoints,
        "followers_count": followersCount,
        "following_count": followingCount,
        "subscription": subscription == null
            ? []
            : List<dynamic>.from(subscription!.map((x) => x)),
        "security_questions": securityQuestions == null
            ? []
            : List<dynamic>.from(securityQuestions!.map((x) => x)),
      };
}

class Avatar {
  Avatar({
    this.image,
  });

  final String? image;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Badge {
  Badge({
    this.id,
    this.next,
    this.image,
    this.title,
    this.progressLevelStart,
    this.progressLevelEnd,
  });

  final num? id;
  final Badge? next;
  final String? image;
  final String? title;
  final num? progressLevelStart;
  final num? progressLevelEnd;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"] as num?,
        next: json["next"] == null
            ? null
            : Badge.fromJson(
                json["next"] as Map<String, dynamic>,
              ),
        image: json["image"] as String?,
        title: json["title"] as String?,
        progressLevelStart: json["progress_level_start"] as num?,
        progressLevelEnd: json["progress_level_end"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "next": next?.toJson(),
        "image": image,
        "title": title,
        "progress_level_start": progressLevelStart,
        "progress_level_end": progressLevelEnd,
      };
}

class ChargeCurrency {
  ChargeCurrency({
    this.code,
    this.name,
    this.symbol,
  });

  final String? code;
  final String? name;
  final String? symbol;

  factory ChargeCurrency.fromJson(Map<String, dynamic> json) => ChargeCurrency(
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

class City {
  City({
    this.id,
    this.name,
    this.localName,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.country,
  });

  final num? id;
  final String? name;
  final String? localName;
  final String? zipCode;
  final num? latitude;
  final num? longitude;
  final String? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] as num?,
        name: json["name"] as String?,
        localName: json["local_name"] as String?,
        zipCode: json["zip_code"] as String?,
        latitude: json["latitude"] as num?,
        longitude: json["longitude"] as num?,
        country: json["country"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "local_name": localName,
        "zip_code": zipCode,
        "latitude": latitude,
        "longitude": longitude,
        "country": country,
      };
}

class CountryClass {
  CountryClass({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory CountryClass.fromJson(Map<String, dynamic> json) => CountryClass(
        name: json["name"] as String?,
        code: json["code"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class Experience {
  Experience({
    this.id,
    this.title,
    this.description,
    this.employmentType,
    this.companyName,
    this.location,
    this.currentlyWorking,
    this.startDate,
    this.endDate,
  });

  final num? id;
  final String? title;
  final String? description;
  final String? employmentType;
  final String? companyName;
  final String? location;
  final bool? currentlyWorking;
  final DateTime? startDate;
  final dynamic endDate;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"] as num?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        employmentType: json["employment_type"] as String?,
        companyName: json["company_name"] as String?,
        location: json["location"] as String?,
        currentlyWorking: json["currently_working"] as bool?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(
                json["start_date"] as String,
              ),
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "employment_type": employmentType,
        "company_name": companyName,
        "location": location,
        "currently_working": currentlyWorking,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": endDate,
      };
}

class Interest {
  Interest({
    this.id,
    this.name,
  });

  final num? id;
  final String? name;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        id: json["id"] as num?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Portfolio {
  Portfolio({
    this.id,
    this.images,
    this.files,
    this.title,
    this.description,
    this.issuedDate,
    this.credentialUrl,
  });

  final num? id;
  final List<Image>? images;
  final List<dynamic>? files;
  final String? title;
  final String? description;
  final DateTime? issuedDate;
  final String? credentialUrl;

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        id: json["id"] as num?,
        images: json["images"] == null
            ? []
            : List<Image>.from(
                json["images"]!.map(
                  (x) => Image.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        files: json["files"] == null
            ? []
            : List<dynamic>.from(
                json["files"]!.map((x) => x) as Iterable,
              ),
        title: json["title"] as String?,
        description: json["description"] as String?,
        issuedDate: json["issued_date"] == null
            ? null
            : DateTime.parse(
                json["issued_date"] as String,
              ),
        credentialUrl: json["credential_url"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
        "title": title,
        "description": description,
        "issued_date":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "credential_url": credentialUrl,
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

class Rating {
  Rating({
    this.userRatingCount,
    this.avgRating,
  });

  final num? userRatingCount;
  final num? avgRating;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        userRatingCount: json["user_rating_count"] as num?,
        avgRating: json["avg_rating"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "user_rating_count": userRatingCount,
        "avg_rating": avgRating,
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
            : DateTime.parse(
                json["created_at"] as String,
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
        "created_at": createdAt?.toIso8601String(),
      };
}
