// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyBookingListModel _$$_MyBookingListModelFromJson(
        Map<String, dynamic> json) =>
    _$_MyBookingListModel(
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

Map<String, dynamic> _$$_MyBookingListModelToJson(
        _$_MyBookingListModel instance) =>
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
      createdBy: json['created_by'] == null
          ? null
          : ResultCreatedBy.fromJson(
              json['created_by'] as Map<String, dynamic>),
      entityService: json['entity_service'] == null
          ? null
          : EntityService.fromJson(
              json['entity_service'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      progressPercent: (json['progress_percent'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      description: json['description'] as String?,
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      budgetFrom: (json['budget_from'] as num?)?.toDouble(),
      budgetTo: (json['budget_to'] as num?)?.toDouble(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      location: json['location'] as String?,
      isActive: json['is_active'] as bool?,
      status: json['status'] as String?,
      isAccepted: json['is_accepted'] as bool?,
      city: json['city'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'entity_service': instance.entityService,
      'images': instance.images,
      'videos': instance.videos,
      'progress_percent': instance.progressPercent,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'requirements': instance.requirements,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'location': instance.location,
      'is_active': instance.isActive,
      'status': instance.status,
      'is_accepted': instance.isAccepted,
      'city': instance.city,
    };

_$_ResultCreatedBy _$$_ResultCreatedByFromJson(Map<String, dynamic> json) =>
    _$_ResultCreatedBy(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      userType: json['user_type'] as String?,
      profileImage: json['profile_image'] as String?,
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      skill: json['skill'] as String?,
      chargeCurrency: json['charge_currency'] == null
          ? null
          : Currency.fromJson(json['charge_currency'] as Map<String, dynamic>),
      hourlyRate: (json['hourly_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ResultCreatedByToJson(_$_ResultCreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'bio': instance.bio,
      'user_type': instance.userType,
      'profile_image': instance.profileImage,
      'stats': instance.stats,
      'skill': instance.skill,
      'charge_currency': instance.chargeCurrency,
      'hourly_rate': instance.hourlyRate,
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

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      successRate: (json['success_rate'] as num?)?.toDouble(),
      happyClients: (json['happy_clients'] as num?)?.toDouble(),
      taskCompleted: (json['task_completed'] as num?)?.toDouble(),
      userReviews: (json['user_reviews'] as num?)?.toDouble(),
      taskAssigned: (json['task_assigned'] as num?)?.toDouble(),
      taskInProgress: (json['task_in_progress'] as num?)?.toDouble(),
      taskCancelled: (json['task_cancelled'] as num?)?.toDouble(),
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
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
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
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$_EntityService _$$_EntityServiceFromJson(Map<String, dynamic> json) =>
    _$_EntityService(
      id: json['id'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : EntityServiceCreatedBy.fromJson(
              json['created_by'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      budgetType: json['budget_type'] as String?,
      budgetFrom: (json['budget_from'] as num?)?.toDouble(),
      budgetTo: (json['budget_to'] as num?)?.toDouble(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      shareLocation: json['share_location'] as bool?,
      isNegotiable: json['is_negotiable'] as bool?,
      revisions: json['revisions'] as int?,
      viewsCount: json['view_count'] as int?,
      location: json['location'] as String?,
      isProfessional: json['is_professional'] as bool?,
      isOnline: json['is_online'] as bool?,
      isRequested: json['is_requested'] as bool?,
      discountType: json['discount_type'] as String?,
      discountValue: (json['discount_value'] as num?)?.toDouble(),
      noOfReservation: json['no_of_reservation'] as int?,
      slug: json['slug'] as String?,
      isActive: json['is_active'] as bool?,
      needsApproval: json['needs_approval'] as bool?,
      isEndorsed: json['is_endorsed'] as bool?,
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EntityServiceToJson(_$_EntityService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'currency': instance.currency,
      'city': instance.city,
      'images': instance.images,
      'videos': instance.videos,
      'service': instance.service,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'highlights': instance.highlights,
      'budget_type': instance.budgetType,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'share_location': instance.shareLocation,
      'is_negotiable': instance.isNegotiable,
      'revisions': instance.revisions,
      'view_count': instance.viewsCount,
      'location': instance.location,
      'is_professional': instance.isProfessional,
      'is_online': instance.isOnline,
      'is_requested': instance.isRequested,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'no_of_reservation': instance.noOfReservation,
      'slug': instance.slug,
      'is_active': instance.isActive,
      'needs_approval': instance.needsApproval,
      'is_endorsed': instance.isEndorsed,
      'event': instance.event,
    };

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      title: json['title'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      duration: json['duration'] as String?,
      isFlexible: json['isFlexible'] as bool?,
      isActive: json['isActive'] as bool?,
      activeDates: (json['activeDates'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'duration': instance.duration,
      'isFlexible': instance.isFlexible,
      'isActive': instance.isActive,
      'activeDates':
          instance.activeDates?.map((e) => e.toIso8601String()).toList(),
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      id: json['id'] as int?,
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
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

_$_EntityServiceCreatedBy _$$_EntityServiceCreatedByFromJson(
        Map<String, dynamic> json) =>
    _$_EntityServiceCreatedBy(
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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      designation: json['designation'] as String?,
      userType: json['user_type'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      isFollowed: json['is_followed'] as bool?,
      isFollowing: json['is_following'] as bool?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EntityServiceCreatedByToJson(
        _$_EntityServiceCreatedBy instance) =>
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
      'created_at': instance.createdAt?.toIso8601String(),
      'designation': instance.designation,
      'user_type': instance.userType,
      'is_profile_verified': instance.isProfileVerified,
      'is_followed': instance.isFollowed,
      'is_following': instance.isFollowing,
      'badge': instance.badge,
    };

_$_Badge _$$_BadgeFromJson(Map<String, dynamic> json) => _$_Badge(
      id: json['id'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_BadgeToJson(_$_Badge instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
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
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'category': instance.category,
      'images': instance.images,
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
