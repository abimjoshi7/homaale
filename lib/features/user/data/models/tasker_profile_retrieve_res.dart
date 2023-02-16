class TaskerProfileRetrieveRes {
  TaskerProfileRetrieveRes({
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

  factory TaskerProfileRetrieveRes.fromJson(Map<String, dynamic> json) =>
      TaskerProfileRetrieveRes(
        id: json['id'] as int?,
        chargeCurrency: ChargeCurrency.fromJson(
          json['charge_currency'] as Map<String, dynamic>,
        ),
        user: User.fromJson(json['user'] as Map<String, dynamic>),
        portfolio: json['portfolio'] == null
            ? []
            : List<Portfolio?>.from(
                json['portfolio']!.map(
                  (x) => Portfolio.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        experience: json['experience'] == null
            ? []
            : List<Experience?>.from(
                json['experience']!.map(
                  (x) => Experience.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        education: json['education'] == null
            ? []
            : List<Education?>.from(
                json['education']!.map(
                  (x) => Education.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        certificates: json['certificates'] == null
            ? []
            : List<Certificate?>.from(
                json['certificates']!.map(
                  (x) => Certificate.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
        rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
        country: json['country'],
        language: json['language'],
        city: json['city'],
        interests: json['interests'] == null
            ? []
            : List<dynamic>.from(json['interests']!.map((x) => x) as Iterable),
        isFollowed: json['is_followed'] as bool?,
        avatar: json['avatar'],
        badge: Badge.fromJson(json['badge'] as Map<String, dynamic>),
        status: json['status'] as String?,
        bio: json['bio'] as String?,
        gender: json['gender'] as String?,
        profileImage: json['profile_image'],
        dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
        skill: json['skill'] as String?,
        activeHourStart: json['active_hour_start'] as String?,
        activeHourEnd: json['active_hour_end'] as String?,
        experienceLevel: json['experience_level'] as String?,
        userType: json['user_type'] as String?,
        hourlyRate: json['hourly_rate'] as num?,
        profileVisibility: json['profile_visibility'] as String?,
        taskPreferences: json['task_preferences'] as String?,
        addressLine1: json['address_line1'] as String?,
        addressLine2: json['address_line2'],
        isProfileVerified: json['is_profile_verified'] as bool?,
        designation: json['designation'],
        points: json['points'] as num?,
        remainingPoints: json['remaining_points'] as num?,
        followersCount: json['followers_count'] as num?,
        followingCount: json['following_count'] as num?,
        subscription: json['subscription'] == null
            ? []
            : List<dynamic>.from(
                json['subscription']!.map((x) => x) as Iterable,
              ),
        securityQuestions: json['security_questions'] == null
            ? []
            : List<dynamic>.from(
                json['security_questions']!.map((x) => x) as Iterable,
              ),
      );

  final int? id;
  final ChargeCurrency? chargeCurrency;
  final User? user;
  final List<Portfolio?>? portfolio;
  final List<Experience?>? experience;
  final List<Education?>? education;
  final List<Certificate?>? certificates;
  final Stats? stats;
  final Rating? rating;
  final dynamic country;
  final dynamic language;
  final dynamic city;
  final List<dynamic>? interests;
  final bool? isFollowed;
  final dynamic avatar;
  final Badge? badge;
  final String? status;
  final String? bio;
  final String? gender;
  final dynamic profileImage;
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
  final dynamic addressLine2;
  final bool? isProfileVerified;
  final dynamic designation;
  final num? points;
  final num? remainingPoints;
  final num? followersCount;
  final num? followingCount;
  final List<dynamic>? subscription;
  final List<dynamic>? securityQuestions;

  Map<String, dynamic> toJson() => {
        'id': id,
        'charge_currency': chargeCurrency!.toJson(),
        'user': user!.toJson(),
        'portfolio': portfolio == null
            ? []
            : List<dynamic>.from(portfolio!.map((x) => x!.toJson())),
        'experience': experience == null
            ? []
            : List<dynamic>.from(experience!.map((x) => x!.toJson())),
        'education': education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x!.toJson())),
        'certificates': certificates == null
            ? []
            : List<dynamic>.from(certificates!.map((x) => x!.toJson())),
        'stats': stats!.toJson(),
        'rating': rating!.toJson(),
        'country': country,
        'language': language,
        'city': city,
        'interests': interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        'is_followed': isFollowed,
        'avatar': avatar,
        'badge': badge!.toJson(),
        'status': status,
        'bio': bio,
        'gender': gender,
        'profile_image': profileImage,
        'date_of_birth':
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        'skill': skill,
        'active_hour_start': activeHourStart,
        'active_hour_end': activeHourEnd,
        'experience_level': experienceLevel,
        'user_type': userType,
        'hourly_rate': hourlyRate,
        'profile_visibility': profileVisibility,
        'task_preferences': taskPreferences,
        'address_line1': addressLine1,
        'address_line2': addressLine2,
        'is_profile_verified': isProfileVerified,
        'designation': designation,
        'points': points,
        'remaining_points': remainingPoints,
        'followers_count': followersCount,
        'following_count': followingCount,
        'subscription': subscription == null
            ? []
            : List<dynamic>.from(subscription!.map((x) => x)),
        'security_questions': securityQuestions == null
            ? []
            : List<dynamic>.from(securityQuestions!.map((x) => x)),
      };
}

class Badge {
  Badge({
    this.image,
    this.title,
    this.progressLevelStart,
    this.progressLevelEnd,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        image: json['image'],
        title: json['title'] as String?,
        progressLevelStart: json['progress_level_start'],
        progressLevelEnd: json['progress_level_end'],
      );

  final dynamic image;
  final String? title;
  final dynamic progressLevelStart;
  final dynamic progressLevelEnd;

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'progress_level_start': progressLevelStart,
        'progress_level_end': progressLevelEnd,
      };
}

class Certificate {
  Certificate({
    this.id,
    this.name,
    this.issuingOrganization,
    this.description,
    this.doesExpire,
    this.credentialId,
    this.certificateUrl,
    this.issuedDate,
    this.expireDate,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: json['id'] as int?,
        name: json['name'] as String?,
        issuingOrganization: json['issuing_organization'] as String?,
        description: json['description'] as String?,
        doesExpire: json['does_expire'] as bool?,
        credentialId: json['credential_id'] as String?,
        certificateUrl: json['certificate_url'] as String?,
        issuedDate: DateTime.parse(json['issued_date'] as String),
        expireDate: json['expire_date'] == null
            ? null
            : DateTime.parse(json['expire_date'] as String),
      );

  final int? id;
  final String? name;
  final String? issuingOrganization;
  final String? description;
  final bool? doesExpire;
  final String? credentialId;
  final String? certificateUrl;
  final DateTime? issuedDate;
  final DateTime? expireDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'issuing_organization': issuingOrganization,
        'description': description,
        'does_expire': doesExpire,
        'credential_id': credentialId,
        'certificate_url': certificateUrl,
        'issued_date':
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        'expire_date':
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
      };
}

class ChargeCurrency {
  ChargeCurrency({
    this.code,
    this.name,
    this.symbol,
  });

  factory ChargeCurrency.fromJson(Map<String, dynamic> json) => ChargeCurrency(
        code: json['code'] as String?,
        name: json['name'] as String?,
        symbol: json['symbol'] as String?,
      );

  final String? code;
  final String? name;
  final String? symbol;

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'symbol': symbol,
      };
}

class Education {
  Education({
    this.id,
    this.school,
    this.description,
    this.degree,
    this.fieldOfStudy,
    this.location,
    this.startDate,
    this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json['id'] as int?,
        school: json['school'] as String?,
        description: json['description'] as String?,
        degree: json['degree'] as String?,
        fieldOfStudy: json['field_of_study'] as String?,
        location: json['location'] as String?,
        startDate: DateTime.parse(json['start_date'] as String),
        endDate: DateTime.parse(json['end_date'] as String),
      );

  final int? id;
  final String? school;
  final String? description;
  final String? degree;
  final String? fieldOfStudy;
  final String? location;
  final DateTime? startDate;
  final DateTime? endDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'school': school,
        'description': description,
        'degree': degree,
        'field_of_study': fieldOfStudy,
        'location': location,
        'start_date':
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        'end_date':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
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

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        employmentType: json['employment_type'] as String?,
        companyName: json['company_name'] as String?,
        location: json['location'] as String?,
        currentlyWorking: json['currently_working'] as bool?,
        startDate: DateTime.parse(json['start_date'] as String),
        endDate: DateTime.parse(json['end_date'] as String),
      );

  final int? id;
  final String? title;
  final String? description;
  final String? employmentType;
  final String? companyName;
  final String? location;
  final bool? currentlyWorking;
  final DateTime? startDate;
  final DateTime? endDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'employment_type': employmentType,
        'company_name': companyName,
        'location': location,
        'currently_working': currentlyWorking,
        'start_date':
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        'end_date':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
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

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        id: json['id'] as int?,
        images: json['images'] == null
            ? []
            : List<dynamic>.from((json['images']!).map((x) => x) as Iterable),
        files: json['files'] == null
            ? []
            : List<dynamic>.from(json['files']!.map((x) => x) as Iterable),
        title: json['title'] as String?,
        description: json['description'] as String?,
        issuedDate: DateTime.parse(json['issued_date'] as String),
        credentialUrl: json['credential_url'] as String?,
      );

  final int? id;
  final List<dynamic>? images;
  final List<dynamic>? files;
  final String? title;
  final String? description;
  final DateTime? issuedDate;
  final String? credentialUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'images':
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        'files': files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
        'title': title,
        'description': description,
        'issued_date':
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        'credential_url': credentialUrl,
      };
}

class Rating {
  Rating({
    this.userRatingCount,
    this.avgRating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        userRatingCount: json['user_rating_count'] as int?,
        avgRating: json['avg_rating'],
      );

  final int? userRatingCount;
  final dynamic avgRating;

  Map<String, dynamic> toJson() => {
        'user_rating_count': userRatingCount,
        'avg_rating': avgRating,
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

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        successRate: json['success_rate'] as num?,
        happyClients: json['happy_clients'] as num?,
        taskCompleted: json['task_completed'] as num?,
        userReviews: json['user_reviews'] as num?,
        taskAssigned: json['task_assigned'] as num?,
        taskInProgress: json['task_in_progress'] as num?,
        taskCancelled: json['task_cancelled'] as num?,
      );

  final num? successRate;
  final num? happyClients;
  final num? taskCompleted;
  final num? userReviews;
  final num? taskAssigned;
  final num? taskInProgress;
  final num? taskCancelled;

  Map<String, dynamic> toJson() => {
        'success_rate': successRate,
        'happy_clients': happyClients,
        'task_completed': taskCompleted,
        'user_reviews': userReviews,
        'task_assigned': taskAssigned,
        'task_in_progress': taskInProgress,
        'task_cancelled': taskCancelled,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.draftEmail,
    this.phone,
    this.draftPhone,
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImage,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        draftEmail: json['draft_email'] as String?,
        phone: json['phone'] as String?,
        draftPhone: json['draft_phone'] as String?,
        firstName: json['first_name'] as String?,
        middleName: json['middle_name'] as String?,
        lastName: json['last_name'] as String?,
        profileImage: json['profile_image'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  final String? id;
  final String? username;
  final String? email;
  final dynamic draftEmail;
  final String? phone;
  final dynamic draftPhone;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final dynamic profileImage;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'draft_email': draftEmail,
        'phone': phone,
        'draft_phone': draftPhone,
        'first_name': firstName,
        'middle_name': middleName,
        'last_name': lastName,
        'profile_image': profileImage,
        // 'created_at': createdAt?.toIso8601String(),
        'created_at': createdAt,
      };
}
