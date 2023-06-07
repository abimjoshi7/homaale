// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedModelRes _$$_SavedModelResFromJson(Map<String, dynamic> json) =>
    _$_SavedModelRes(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SavedModelResToJson(_$_SavedModelRes instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as int?,
      user: json['user'] as String?,
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      objectId: json['object_id'] as String?,
      contentType: json['content_type'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'type': instance.type,
      'data': instance.data,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'object_id': instance.objectId,
      'content_type': instance.contentType,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      id: json['id'],
      profileImage: json['profile_image'] as String?,
      fullName: json['full_name'] as String?,
      chargeCurrency: json['charge_currency'] == null
          ? null
          : Currency.fromJson(json['charge_currency'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      portfolio: (json['portfolio'] as List<dynamic>?)
          ?.map((e) => Portfolio.fromJson(e as Map<String, dynamic>))
          .toList(),
      experience: (json['experience'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      country: json['country'] == null
          ? null
          : CountryClass.fromJson(json['country'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : CountryClass.fromJson(json['language'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFollowed: json['is_followed'] as bool?,
      badge: json['badge'] == null
          ? null
          : NextClass.fromJson(json['badge'] as Map<String, dynamic>),
      isBookmarked: json['is_bookmarked'] as bool?,
      status: json['status'] as String?,
      bio: json['bio'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_brith'] == null
          ? null
          : DateTime.parse(json['date_of_brith'] as String),
      skill: json['skill'] as String?,
      activeHourStart: json['active_hour_start'] as String?,
      activeHourEnd: json['active_hour_end'] as String?,
      experienceLevel: json['experience_level'] as String?,
      profileVisibility: json['profile_visibility'] as String?,
      taskPreferences: json['task_preferences'] as String?,
      addressLine1: json['address_line1'] as String?,
      addressLine2: json['address_line2'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      designation: json['designation'] as String?,
      points: json['points'] as int?,
      remainingPoints: json['remaining_point'] as int?,
      followersCount: json['followers_count'] as int?,
      followingCount: json['following_count'] as int?,
      avatar: json['avatar'] as int?,
      subscription: json['subscription'] as List<dynamic>?,
      securityQuestions: (json['security_questions'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      slug: json['slug'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      title: json['title'] as String?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      isOnline: json['is_online'] as bool?,
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      budgetType: json['budget_type'] as String?,
      isRequested: json['is_requested'] as bool?,
      isRange: json['is_range'] as bool?,
      budgetFrom: json['budget_from'] as String?,
      budgetTo: json['budget_to'] as String?,
      location: json['location'] as String?,
      count: json['count'] as int?,
      isEndorsed: json['is_endorsed'] as bool?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      videos: json['videos'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'id': instance.id,
      'profile_image': instance.profileImage,
      'full_name': instance.fullName,
      'charge_currency': instance.chargeCurrency,
      'user': instance.user,
      'portfolio': instance.portfolio,
      'experience': instance.experience,
      'education': instance.education,
      'certificates': instance.certificates,
      'stats': instance.stats,
      'rating': instance.rating,
      'country': instance.country,
      'language': instance.language,
      'city': instance.city,
      'interests': instance.interests,
      'is_followed': instance.isFollowed,
      'badge': instance.badge,
      'is_bookmarked': instance.isBookmarked,
      'status': instance.status,
      'bio': instance.bio,
      'gender': instance.gender,
      'date_of_brith': instance.dateOfBirth?.toIso8601String(),
      'skill': instance.skill,
      'active_hour_start': instance.activeHourStart,
      'active_hour_end': instance.activeHourEnd,
      'experience_level': instance.experienceLevel,
      'profile_visibility': instance.profileVisibility,
      'task_preferences': instance.taskPreferences,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'is_profile_verified': instance.isProfileVerified,
      'designation': instance.designation,
      'points': instance.points,
      'remaining_point': instance.remainingPoints,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'avatar': instance.avatar,
      'subscription': instance.subscription,
      'security_questions': instance.securityQuestions,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'title': instance.title,
      'currency': instance.currency,
      'is_online': instance.isOnline,
      'service': instance.service,
      'images': instance.images,
      'budget_type': instance.budgetType,
      'is_requested': instance.isRequested,
      'is_range': instance.isRange,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'location': instance.location,
      'count': instance.count,
      'is_endorsed': instance.isEndorsed,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'videos': instance.videos,
    };

_$_NextClass _$$_NextClassFromJson(Map<String, dynamic> json) => _$_NextClass(
      id: json['id'] as int?,
      next: json['next'] == null
          ? null
          : NextClass.fromJson(json['next'] as Map<String, dynamic>),
      image: json['image'] as String?,
      title: json['title'] as String?,
      progressLevelStart: json['progress_level_start'] as int?,
      progressLevelEnd: json['progress_level_end'] as int?,
    );

Map<String, dynamic> _$$_NextClassToJson(_$_NextClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'next': instance.next,
      'image': instance.image,
      'title': instance.title,
      'progress_level_start': instance.progressLevelStart,
      'progress_level_end': instance.progressLevelEnd,
    };

_$_Certificate _$$_CertificateFromJson(Map<String, dynamic> json) =>
    _$_Certificate(
      id: json['id'] as int?,
      name: json['name'] as String?,
      issuingOrganization: json['issuing_organization'] as String?,
      description: json['description'] as String?,
      doesExpire: json['created_at'] as bool?,
      credentialId: json['credential_id'] as String?,
      certificateUrl: json['certificate_url'] as String?,
      image: json['image'],
      issuedDate: json['issued_date'] == null
          ? null
          : DateTime.parse(json['issued_date'] as String),
      expireDate: json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String),
    );

Map<String, dynamic> _$$_CertificateToJson(_$_Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issuing_organization': instance.issuingOrganization,
      'description': instance.description,
      'created_at': instance.doesExpire,
      'credential_id': instance.credentialId,
      'certificate_url': instance.certificateUrl,
      'image': instance.image,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'expire_date': instance.expireDate?.toIso8601String(),
    };

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      code: json['code'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      id: json['id'] as int?,
      name: json['name'] as String?,
      localName: json['local_name'] as String?,
      zipCode: json['zip_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      country: json['country'],
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'local_name': instance.localName,
      'zip_code': instance.zipCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
    };

_$_CountryClass _$$_CountryClassFromJson(Map<String, dynamic> json) =>
    _$_CountryClass(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_CountryClassToJson(_$_CountryClass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_CreatedBy _$$_CreatedByFromJson(Map<String, dynamic> json) => _$_CreatedBy(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['created_at'] as String?,
      designation: json['designation'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      isFollowed: json['is_followed'] as bool?,
      isFollowing: json['is_following'] as bool?,
      badge: json['badge'] == null
          ? null
          : CreatedByBadge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreatedByToJson(_$_CreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'bio': instance.bio,
      'created_at': instance.createdAt,
      'designation': instance.designation,
      'is_profile_verified': instance.isProfileVerified,
      'is_followed': instance.isFollowed,
      'is_following': instance.isFollowing,
      'badge': instance.badge,
    };

_$_CreatedByBadge _$$_CreatedByBadgeFromJson(Map<String, dynamic> json) =>
    _$_CreatedByBadge(
      id: json['id'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_CreatedByBadgeToJson(_$_CreatedByBadge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
    };

_$_Education _$$_EducationFromJson(Map<String, dynamic> json) => _$_Education(
      id: json['id'] as int?,
      school: json['school'] as String?,
      description: json['description'] as String?,
      degree: json['degree'] as String?,
      fieldOfStudy: json['field_of_study'] as String?,
      location: json['location'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'description': instance.description,
      'degree': instance.degree,
      'field_of_study': instance.fieldOfStudy,
      'location': instance.location,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
    };

_$_Experience _$$_ExperienceFromJson(Map<String, dynamic> json) =>
    _$_Experience(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      employmentType: json['employment_type'] as String?,
      companyName: json['company_name'] as String?,
      location: json['location'] as String?,
      currentlyWorking: json['currently_working'] as bool?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$$_ExperienceToJson(_$_Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'employment_type': instance.employmentType,
      'company_name': instance.companyName,
      'location': instance.location,
      'currently_working': instance.currentlyWorking,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
    };

_$_Interest _$$_InterestFromJson(Map<String, dynamic> json) => _$_Interest(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_InterestToJson(_$_Interest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Portfolio _$$_PortfolioFromJson(Map<String, dynamic> json) => _$_Portfolio(
      id: json['id'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      issuedDate: json['issued_date'] == null
          ? null
          : DateTime.parse(json['issued_date'] as String),
      credentialUrl: json['cretential_url'] as String?,
    );

Map<String, dynamic> _$$_PortfolioToJson(_$_Portfolio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'files': instance.files,
      'title': instance.title,
      'description': instance.description,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'cretential_url': instance.credentialUrl,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      id: json['id'] as int?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      mediaType: json['media_type'] as String?,
      media: json['media'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'media_type': instance.mediaType,
      'media': instance.media,
    };

_$_RatingElement _$$_RatingElementFromJson(Map<String, dynamic> json) =>
    _$_RatingElement(
      rating: json['rating'] as int?,
      ratingCount: json['rating_count'] as int?,
    );

Map<String, dynamic> _$$_RatingElementToJson(_$_RatingElement instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
    };

_$_PurpleRating _$$_PurpleRatingFromJson(Map<String, dynamic> json) =>
    _$_PurpleRating(
      userRatingCount: json['user_rating_count'] as int?,
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PurpleRatingToJson(_$_PurpleRating instance) =>
    <String, dynamic>{
      'user_rating_count': instance.userRatingCount,
      'avg_rating': instance.avgRating,
    };

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isActive: json['is_active'] as bool?,
      isVerified: json['is_verified'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredDocuments: json['required_documents'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'category': instance.category,
      'images': instance.images,
      'required_documents': instance.requiredDocuments,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      level: json['level'] as int?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'slug': instance.slug,
    };

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      successRate: (json['success_rate'] as num?)?.toDouble(),
      happyClients: json['happy_clients'] as int?,
      taskCompleted: json['task_completed'] as int?,
      userReviews: json['user_reviews'] as int?,
      taskAssigned: json['task_assigned'] as int?,
      taskInProgress: json['task_in_progress'] as int?,
      taskCancelled: json['task_cancelled'] as int?,
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'success_rate': instance.successRate,
      'happy_clients': instance.happyClients,
      'task_completed': instance.taskCompleted,
      'user_reviews': instance.userReviews,
      'task_assigned': instance.taskAssigned,
      'task_in_progress': instance.taskInProgress,
      'task_cancelled': instance.taskCancelled,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'],
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'created_at': instance.createdAt,
    };
