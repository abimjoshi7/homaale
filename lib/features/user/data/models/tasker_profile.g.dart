// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasker_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskerProfile _$$_TaskerProfileFromJson(Map<String, dynamic> json) =>
    _$_TaskerProfile(
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
      securityQuestions: json[''] as List<dynamic>?,
    );

Map<String, dynamic> _$$_TaskerProfileToJson(_$_TaskerProfile instance) =>
    <String, dynamic>{
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
      '': instance.securityQuestions,
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

_$_Language _$$_LanguageFromJson(Map<String, dynamic> json) => _$_Language(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
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

_$_Certificate _$$_CertificateFromJson(Map<String, dynamic> json) =>
    _$_Certificate(
      id: json['id'] as int?,
      name: json['name'] as String?,
      issuingOrganization: json['issuing_organization'] as String?,
      description: json['description'] as String?,
      doesExpire: json['doesExpire'] as bool?,
      credentialId: json['credential_id'] as String?,
      certificateUrl: json['certificate_url'] as String?,
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
      'doesExpire': instance.doesExpire,
      'credential_id': instance.credentialId,
      'certificate_url': instance.certificateUrl,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'expire_date': instance.expireDate?.toIso8601String(),
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
      files: json['files'] as List<dynamic>?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      issuedDate: json['issued_date'] == null
          ? null
          : DateTime.parse(json['issued_date'] as String),
      credentialUrl: json['credential_url'] as String?,
    );

Map<String, dynamic> _$$_PortfolioToJson(_$_Portfolio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'files': instance.files,
      'title': instance.title,
      'description': instance.description,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'credential_url': instance.credentialUrl,
    };

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      userRatingCount: json['user_rating_count'] as int?,
      avgRating: json['avg_rating'] as num?,
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'user_rating_count': instance.userRatingCount,
      'avg_rating': instance.avgRating,
    };

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      successRate: (json['success_rate'] as num?)?.toDouble(),
      happyClients: (json['happy_clients'] as num?)?.toDouble(),
      taskCompleted: (json['task_completed'] as num?)?.toDouble(),
      userReviews: (json['user_reviews'] as num?)?.toDouble(),
      taskAssigned: (json['task_assigned'] as num?)?.toDouble(),
      taskInProgress: (json['task_in_progess'] as num?)?.toDouble(),
      taskCancelled: (json['task_cancelled'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'success_rate': instance.successRate,
      'happy_clients': instance.happyClients,
      'task_completed': instance.taskCompleted,
      'user_reviews': instance.userReviews,
      'task_assigned': instance.taskAssigned,
      'task_in_progess': instance.taskInProgress,
      'task_cancelled': instance.taskCancelled,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      draftEmail: json['draft_email'] as String?,
      phone: json['phone'] as String?,
      draftPhone: json['draft_phone'] as String?,
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'draft_email': instance.draftEmail,
      'phone': instance.phone,
      'draft_phone': instance.draftPhone,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'created_at': instance.createdAt?.toIso8601String(),
    };
