// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchRes _$$_SearchResFromJson(Map<String, dynamic> json) => _$_SearchRes(
      task: (json['task'] as List<dynamic>?)
          ?.map((e) => ServiceElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      service: (json['service'] as List<dynamic>?)
          ?.map((e) => ServiceElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasker: (json['tasker'] as List<dynamic>?)
          ?.map((e) => Tasker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResToJson(_$_SearchRes instance) =>
    <String, dynamic>{
      'task': instance.task,
      'service': instance.service,
      'tasker': instance.tasker,
    };

_$_ServiceElement _$$_ServiceElementFromJson(Map<String, dynamic> json) =>
    _$_ServiceElement(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      title: json['title'] as String?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      isOnline: json['is_online'] as bool?,
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      budgetType: json['budget_type'] as String?,
      isRequested: json['is_requested'] as bool?,
      budgetFrom: json['budget_from'] as String?,
      budgetTo: json['budget_to'] as String?,
      location: json['location'] as String?,
      count: json['count'] as int?,
      ratingCount: json['rating_count'] as int?,
      isEndorsed: json['is_endorsed'] as bool?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBookmarked: json['is_bookmarked'] as bool?,
    );

Map<String, dynamic> _$$_ServiceElementToJson(_$_ServiceElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'title': instance.title,
      'currency': instance.currency,
      'city': instance.city,
      'is_online': instance.isOnline,
      'service': instance.service,
      'images': instance.images,
      'rating': instance.rating,
      'budget_type': instance.budgetType,
      'is_requested': instance.isRequested,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'location': instance.location,
      'count': instance.count,
      'rating_count': instance.ratingCount,
      'is_endorsed': instance.isEndorsed,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'videos': instance.videos,
      'is_bookmarked': instance.isBookmarked,
    };

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      rating: json['rating'] as num?,
      ratingCount: json['rating_count'] as num?,
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
    };

_$_Tasker _$$_TaskerFromJson(Map<String, dynamic> json) => _$_Tasker(
      id: json['id'] as int?,
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
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFollowed: json['is_followed'] as bool?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
      isBookmarked: json['is_bookmarked'] as bool?,
      status: json['status'] as String?,
      bio: json['bio'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
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
      remainingPoints: json['remaining_points'] as int?,
      followersCount: json['followers_count'] as int?,
      followingCount: json['following_count'] as int?,
      avatar: json['avatar'],
      subscription: json['subscription'] as List<dynamic>?,
      securityQuestions: json['security_questions'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_TaskerToJson(_$_Tasker instance) => <String, dynamic>{
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
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
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
      'remaining_points': instance.remainingPoints,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'avatar': instance.avatar,
      'subscription': instance.subscription,
      'security_questions': instance.securityQuestions,
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      id: json['id'] as num?,
      name: json['name'] as String?,
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      country: json['country'],
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
    };

_$_Language _$$_LanguageFromJson(Map<String, dynamic> json) => _$_Language(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_Badge _$$_BadgeFromJson(Map<String, dynamic> json) => _$_Badge(
      id: json['id'] as int?,
      next: json['next'],
      image: json['image'] as String?,
      title: json['title'] as String?,
      progressLevelStart: json['progress_level_start'] as int?,
      progressLevelEnd: json['progress_level_end'] as int?,
    );

Map<String, dynamic> _$$_BadgeToJson(_$_Badge instance) => <String, dynamic>{
      'id': instance.id,
      'next': instance.next,
      'image': instance.image,
      'title': instance.title,
      'progress_level_start': instance.progressLevelStart,
      'progress_level_end': instance.progressLevelEnd,
    };
