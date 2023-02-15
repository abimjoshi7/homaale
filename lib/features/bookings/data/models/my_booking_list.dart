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

  final int? totalPages;
  final int? count;
  final int? current;
  final String? next;
  final dynamic previous;
  final int? pageSize;
  final List<Result>? result;

  factory MyBookingList.fromJson(Map<String, dynamic> json) => MyBookingList(
        totalPages: json["total_pages"] as int?,
        count: json["count"] as int?,
        current: json["current"] as int?,
        next: json["next"] as String?,
        previous: json["previous"] as dynamic,
        pageSize: json["page_size"] as int?,
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
            : List<dynamic>.from(result?.map((x) => x.toJson()) as Iterable),
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

  final int? id;
  final ResultCreatedBy? createdBy;
  final EntityService? entityService;
  final List<Image>? images;
  final List<dynamic>? videos;
  final int? progressPercent;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ResultDescription? description;
  final Map<String, Requirement>? requirements;
  final int? budgetFrom;
  final int? budgetTo;
  final DateTime? startDate;
  final DateTime? endDate;
  final dynamic startTime;
  final dynamic endTime;
  final Location? location;
  final bool? isActive;
  final Status? status;
  final dynamic extraData;
  final bool? isAccepted;
  final dynamic bookingMerchant;
  final int? city;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] as int?,
        createdBy: json["created_by"] == null
            ? null
            : ResultCreatedBy.fromJson(
                json["created_by"] as Map<String, dynamic>),
        entityService: json["entity_service"] == null
            ? null
            : EntityService.fromJson(
                json["entity_service"] as Map<String, dynamic>),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!
                    .map((x) => Image.fromJson(x as Map<String, dynamic>))
                as Iterable),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(json["videos"]!.map((x) => x) as Iterable),
        progressPercent: json["progress_percent"] as int?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        description: resultDescriptionValues.map[json["description"]]!,
        requirements:
            Map.from(json["requirements"] as Map<String, dynamic>).map(
          (k, v) => MapEntry<String, Requirement>(
            k as String,
            requirementValues.map[v]!,
          ),
        ),
        budgetFrom: json["budget_from"] as int?,
        budgetTo: json["budget_to"] as int?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"] as String),
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(json["end_date"] as String),
        startTime: json["start_time"],
        endTime: json["end_time"],
        location: locationValues.map[json["location"]],
        isActive: json["is_active"] as bool?,
        status: statusValues.map[json["status"]],
        extraData: json["extra_data"],
        isAccepted: json["is_accepted"] as bool?,
        bookingMerchant: json["booking_merchant"],
        city: json["city"] as int?,
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
        "description": resultDescriptionValues.reverse[description],
        "requirements": Map.from(requirements!).map((k, v) =>
            MapEntry<String, dynamic>(k, requirementValues.reverse[v])),
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "location": locationValues.reverse[location],
        "is_active": isActive,
        "status": statusValues.reverse[status],
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

  final int? id;
  final User? user;
  final Bio? bio;
  final PurpleUserType? userType;
  final String? profileImage;
  final Stats? stats;
  final Skill? skill;
  final Currency? chargeCurrency;
  final int? hourlyRate;

  factory ResultCreatedBy.fromJson(Map<String, dynamic> json) =>
      ResultCreatedBy(
        id: json["id"] as int?,
        user: json["user"] == null
            ? null
            : User.fromJson(json["user"] as Map<String, dynamic>),
        bio: bioValues.map[json["bio"]]!,
        userType: purpleUserTypeValues.map[json["user_type"]]!,
        profileImage: json["profile_image"] as String?,
        stats: json["stats"] == null
            ? null
            : Stats.fromJson(json["stats"] as Map<String, dynamic>),
        skill: skillValues.map[json["skill"]]!,
        chargeCurrency: json["charge_currency"] == null
            ? null
            : Currency.fromJson(
                json["charge_currency"] as Map<String, dynamic>),
        hourlyRate: json["hourly_rate"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "bio": bioValues.reverse[bio],
        "user_type": purpleUserTypeValues.reverse[userType],
        "profile_image": profileImage,
        "stats": stats?.toJson(),
        "skill": skillValues.reverse[skill],
        "charge_currency": chargeCurrency?.toJson(),
        "hourly_rate": hourlyRate,
      };
}

enum Bio { BIO }

final bioValues = EnumValues({"Bio": Bio.BIO});

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  final ChargeCurrencyCode? code;
  final ChargeCurrencyName? name;
  final Symbol? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: chargeCurrencyCodeValues.map[json["code"]]!,
        name: chargeCurrencyNameValues.map[json["name"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
      );

  Map<String, dynamic> toJson() => {
        "code": chargeCurrencyCodeValues.reverse[code],
        "name": chargeCurrencyNameValues.reverse[name],
        "symbol": symbolValues.reverse[symbol],
      };
}

enum ChargeCurrencyCode { THB, NPR }

final chargeCurrencyCodeValues =
    EnumValues({"NPR": ChargeCurrencyCode.NPR, "THB": ChargeCurrencyCode.THB});

enum ChargeCurrencyName { BAHT, NEPALESE_RUPEE }

final chargeCurrencyNameValues = EnumValues({
  "Baht": ChargeCurrencyName.BAHT,
  "Nepalese Rupee": ChargeCurrencyName.NEPALESE_RUPEE
});

enum Symbol { EMPTY, SYMBOL }

final symbolValues = EnumValues({"\u0024": Symbol.EMPTY, "रु": Symbol.SYMBOL});

enum Skill { POLITICS }

final skillValues = EnumValues({"['Politics']": Skill.POLITICS});

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

  final int? successRate;
  final int? happyClients;
  final int? taskCompleted;
  final int? userReviews;
  final int? taskAssigned;
  final int? taskInProgress;
  final int? taskCancelled;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        successRate: json["success_rate"],
        happyClients: json["happy_clients"],
        taskCompleted: json["task_completed"],
        userReviews: json["user_reviews"],
        taskAssigned: json["task_assigned"],
        taskInProgress: json["task_in_progress"],
        taskCancelled: json["task_cancelled"],
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
  final UsernameEnum? username;
  final UsernameEnum? email;
  final dynamic phone;
  final UserFirstName? firstName;
  final MiddleName? middleName;
  final UserLastName? lastName;
  final DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: usernameEnumValues.map[json["username"]]!,
        email: usernameEnumValues.map[json["email"]]!,
        phone: json["phone"],
        firstName: userFirstNameValues.map[json["first_name"]]!,
        middleName: middleNameValues.map[json["middle_name"]]!,
        lastName: userLastNameValues.map[json["last_name"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameEnumValues.reverse[username],
        "email": usernameEnumValues.reverse[email],
        "phone": phone,
        "first_name": userFirstNameValues.reverse[firstName],
        "middle_name": middleNameValues.reverse[middleName],
        "last_name": userLastNameValues.reverse[lastName],
        "created_at": createdAt?.toIso8601String(),
      };
}

enum UsernameEnum { ABIMJOSHI_CAGTU_COM }

final usernameEnumValues =
    EnumValues({"abimjoshi@cagtu.com": UsernameEnum.ABIMJOSHI_CAGTU_COM});

enum UserFirstName { COMRADE }

final userFirstNameValues = EnumValues({"Comrade": UserFirstName.COMRADE});

enum UserLastName { PRACHANDAA }

final userLastNameValues = EnumValues({"Prachandaa": UserLastName.PRACHANDAA});

enum MiddleName { KUMAR }

final middleNameValues = EnumValues({"Kumar": MiddleName.KUMAR});

enum PurpleUserType { CLIENT_TASKER }

final purpleUserTypeValues =
    EnumValues({"[\"Client\", \"Tasker\"]": PurpleUserType.CLIENT_TASKER});

enum ResultDescription { QWE, ASI, SOME_PROBLEM }

final resultDescriptionValues = EnumValues({
  "asi": ResultDescription.ASI,
  "qwe": ResultDescription.QWE,
  "some problem": ResultDescription.SOME_PROBLEM
});

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
  final EntityServiceTitle? title;
  final EntityServiceDescription? description;
  final List<String>? highlights;
  final BudgetType? budgetType;
  final int? budgetFrom;
  final int? budgetTo;
  final dynamic startDate;
  final DateTime? endDate;
  final dynamic startTime;
  final dynamic endTime;
  final bool? shareLocation;
  final bool? isNegotiable;
  final int? revisions;
  final dynamic recursionType;
  final int? viewsCount;
  final Location? location;
  final bool? isProfessional;
  final bool? isOnline;
  final bool? isRequested;
  final dynamic discountType;
  final dynamic discountValue;
  final List<dynamic>? extraData;
  final int? noOfReservation;
  final String? slug;
  final bool? isActive;
  final bool? needsApproval;
  final bool? isEndorsed;
  final dynamic merchant;
  final dynamic event;
  final dynamic avatar;

  factory EntityService.fromJson(Map<String, dynamic> json) => EntityService(
        id: json["id"],
        createdBy: json["created_by"] == null
            ? null
            : EntityServiceCreatedBy.fromJson(json["created_by"]),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(json["videos"]!.map((x) => x)),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        title: entityServiceTitleValues.map[json["title"]]!,
        description: entityServiceDescriptionValues.map[json["description"]]!,
        highlights: json["highlights"] == null
            ? []
            : List<String>.from(json["highlights"]!.map((x) => x)),
        budgetType: budgetTypeValues.map[json["budget_type"]]!,
        budgetFrom: json["budget_from"],
        budgetTo: json["budget_to"],
        startDate: json["start_date"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        shareLocation: json["share_location"],
        isNegotiable: json["is_negotiable"],
        revisions: json["revisions"],
        recursionType: json["recursion_type"],
        viewsCount: json["views_count"],
        location: locationValues.map[json["location"]]!,
        isProfessional: json["is_professional"],
        isOnline: json["is_online"],
        isRequested: json["is_requested"],
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        extraData: json["extra_data"] == null
            ? []
            : List<dynamic>.from(json["extra_data"]!.map((x) => x)),
        noOfReservation: json["no_of_reservation"],
        slug: json["slug"],
        isActive: json["is_active"],
        needsApproval: json["needs_approval"],
        isEndorsed: json["is_endorsed"],
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
        "title": entityServiceTitleValues.reverse[title],
        "description": entityServiceDescriptionValues.reverse[description],
        "highlights": highlights == null
            ? []
            : List<dynamic>.from(highlights!.map((x) => x)),
        "budget_type": budgetTypeValues.reverse[budgetType],
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
        "location": locationValues.reverse[location],
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

enum BudgetType { PROJECT }

final budgetTypeValues = EnumValues({"Project": BudgetType.PROJECT});

class City {
  City({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.country,
  });

  final int? id;
  final CityName? name;
  final double? latitude;
  final double? longitude;
  final Country? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: cityNameValues.map[json["name"]]!,
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": cityNameValues.reverse[name],
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

  final CountryName? name;
  final CountryCode? code;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: countryNameValues.map[json["name"]]!,
        code: countryCodeValues.map[json["code"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": countryNameValues.reverse[name],
        "code": countryCodeValues.reverse[code],
      };
}

enum CountryCode { NP }

final countryCodeValues = EnumValues({"NP": CountryCode.NP});

enum CountryName { NEPAL }

final countryNameValues = EnumValues({"Nepal": CountryName.NEPAL});

enum CityName { KATHMANDU }

final cityNameValues = EnumValues({"Kathmandu": CityName.KATHMANDU});

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
  final Username? username;
  final CreatedByEmail? email;
  final dynamic phone;
  final CreatedByFirstName? firstName;
  final String? middleName;
  final CreatedByLastName? lastName;
  final String? profileImage;
  final String? bio;
  final DateTime? createdAt;
  final Designation? designation;
  final FluffyUserType? userType;
  final IsProfileVerified? isProfileVerified;
  final bool? isFollowed;
  final bool? isFollowing;
  final Avatar? avatar;
  final Badge? badge;

  factory EntityServiceCreatedBy.fromJson(Map<String, dynamic> json) =>
      EntityServiceCreatedBy(
        id: json["id"],
        username: usernameValues.map[json["username"]]!,
        email: createdByEmailValues.map[json["email"]]!,
        phone: json["phone"],
        firstName: createdByFirstNameValues.map[json["first_name"]]!,
        middleName: json["middle_name"],
        lastName: createdByLastNameValues.map[json["last_name"]]!,
        profileImage: json["profile_image"],
        bio: json["bio"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        designation: designationValues.map[json["designation"]]!,
        userType: fluffyUserTypeValues.map[json["user_type"]]!,
        isProfileVerified:
            isProfileVerifiedValues.map[json["is_profile_verified"]]!,
        isFollowed: json["is_followed"],
        isFollowing: json["is_following"],
        avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
        badge: json["badge"] == null ? null : Badge.fromJson(json["badge"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameValues.reverse[username],
        "email": createdByEmailValues.reverse[email],
        "phone": phone,
        "first_name": createdByFirstNameValues.reverse[firstName],
        "middle_name": middleName,
        "last_name": createdByLastNameValues.reverse[lastName],
        "profile_image": profileImage,
        "bio": bio,
        "created_at": createdAt?.toIso8601String(),
        "designation": designationValues.reverse[designation],
        "user_type": fluffyUserTypeValues.reverse[userType],
        "is_profile_verified":
            isProfileVerifiedValues.reverse[isProfileVerified],
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
        image: json["image"],
        id: json["id"],
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
  final BadgeTitle? title;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"],
        image: json["image"],
        title: badgeTitleValues.map[json["title"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": badgeTitleValues.reverse[title],
      };
}

enum BadgeTitle { BRONZE }

final badgeTitleValues = EnumValues({"Bronze": BadgeTitle.BRONZE});

enum Designation { THE_1_SAD, FRONTEND_DEVELOPER, NOUN }

final designationValues = EnumValues({
  "Frontend Developer": Designation.FRONTEND_DEVELOPER,
  "Noun": Designation.NOUN,
  "1sad": Designation.THE_1_SAD
});

enum CreatedByEmail {
  DARSHANMAN_180_CAGTU_COM,
  SANDIPTHAPA_1_CAGTU_COM,
  DARSHANMAN_CAGTU_COM
}

final createdByEmailValues = EnumValues({
  "darshanman+180@cagtu.com": CreatedByEmail.DARSHANMAN_180_CAGTU_COM,
  "darshanman@cagtu.com": CreatedByEmail.DARSHANMAN_CAGTU_COM,
  "sandipthapa+1@cagtu.com": CreatedByEmail.SANDIPTHAPA_1_CAGTU_COM
});

enum CreatedByFirstName { ONE, SANDIP, NAM }

final createdByFirstNameValues = EnumValues({
  "Nam": CreatedByFirstName.NAM,
  "one": CreatedByFirstName.ONE,
  "Sandip": CreatedByFirstName.SANDIP
});

enum IsProfileVerified { FALSE, TRUE }

final isProfileVerifiedValues = EnumValues(
    {"False": IsProfileVerified.FALSE, "True": IsProfileVerified.TRUE});

enum CreatedByLastName { EIGHTY, THAPA, SARBANAM }

final createdByLastNameValues = EnumValues({
  "eighty": CreatedByLastName.EIGHTY,
  "Sarbanam": CreatedByLastName.SARBANAM,
  "Thapa": CreatedByLastName.THAPA
});

enum FluffyUserType { CLIENT, TASKER }

final fluffyUserTypeValues = EnumValues({
  "[\"Client\"]": FluffyUserType.CLIENT,
  "[\"Tasker\"]": FluffyUserType.TASKER
});

enum Username {
  DARSHANMAN_180_CAGTU_COM,
  SANDIPTHAPA_1_CAGTU_COM,
  DARSHANMAN_CAGTU_COM
}

final usernameValues = EnumValues({
  "darshanman+180@cagtu.com": Username.DARSHANMAN_180_CAGTU_COM,
  "darshanman_cagtu_com": Username.DARSHANMAN_CAGTU_COM,
  "sandipthapa+1@cagtu.com": Username.SANDIPTHAPA_1_CAGTU_COM
});

enum EntityServiceDescription { ASD_ASD_ASD_ASD, P_ASFASDF_P, P_134234234_P }

final entityServiceDescriptionValues = EnumValues({
  "asd asd asd asd": EntityServiceDescription.ASD_ASD_ASD_ASD,
  "<p>134234234</p>": EntityServiceDescription.P_134234234_P,
  "<p>asfasdf</p>": EntityServiceDescription.P_ASFASDF_P
});

enum Location { REMOTE }

final locationValues = EnumValues({"remote": Location.REMOTE});

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
  final ServiceTitle? title;
  final bool? isActive;
  final bool? isVerified;
  final Category? category;
  final List<dynamic>? images;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        title: serviceTitleValues.map[json["title"]]!,
        isActive: json["is_active"],
        isVerified: json["is_verified"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": serviceTitleValues.reverse[title],
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
  final CategoryName? name;
  final int? level;
  final Slug? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: categoryNameValues.map[json["name"]]!,
        level: json["level"],
        slug: slugValues.map[json["slug"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": categoryNameValues.reverse[name],
        "level": level,
        "slug": slugValues.reverse[slug],
      };
}

enum CategoryName { REAL_ESTATE_RENTAL }

final categoryNameValues =
    EnumValues({"Real Estate Rental": CategoryName.REAL_ESTATE_RENTAL});

enum Slug { RENTAL_REAL_ESTATE }

final slugValues = EnumValues({"rental_real-estate": Slug.RENTAL_REAL_ESTATE});

enum ServiceTitle { OTHER_PLACES, LAND_RENTAL }

final serviceTitleValues = EnumValues({
  "Land Rental": ServiceTitle.LAND_RENTAL,
  "Other Places": ServiceTitle.OTHER_PLACES
});

enum EntityServiceTitle { SERVICE, SADFSADF, TEJ_SASTO_DEAL }

final entityServiceTitleValues = EnumValues({
  "sadfsadf": EntityServiceTitle.SADFSADF,
  "service": EntityServiceTitle.SERVICE,
  "tej sasto deal": EntityServiceTitle.TEJ_SASTO_DEAL
});

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
        id: json["id"],
        name: json["name"],
        size: json["size"],
        mediaType: json["media_type"],
        media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
        "media_type": mediaType,
        "media": media,
      };
}

enum Requirement { QWE, WEE, ASD }

final requirementValues = EnumValues(
    {"asd": Requirement.ASD, "qwe": Requirement.QWE, "wee": Requirement.WEE});

enum Status { PENDING }

final statusValues = EnumValues({"pending": Status.PENDING});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
