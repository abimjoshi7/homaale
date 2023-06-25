// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_created_task_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelfCreatedTaskService _$$_SelfCreatedTaskServiceFromJson(
        Map<String, dynamic> json) =>
    _$_SelfCreatedTaskService(
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

Map<String, dynamic> _$$_SelfCreatedTaskServiceToJson(
        _$_SelfCreatedTaskService instance) =>
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
      id: json['id'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
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
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
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
      isRange: json['is_range'] as bool?,
      budgetFrom: json['budget_from'] as String?,
      budgetTo: json['budget_to'] as String?,
      payableFrom: json['payable_from'] as String?,
      payableTo: json['payable_to'] as String?,
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
      viewsCount: json['views_count'] as int?,
      location: json['location'] as String?,
      isProfessional: json['is_professional'] as bool?,
      isOnline: json['is_online'] as bool?,
      isRequested: json['is_requested'] as bool?,
      discountType: json['discount_type'] as String?,
      discountValue: json['discount_value'] as String?,
      extraData: json['extra_data'],
      slug: json['slug'] as String?,
      isActive: json['is_active'] as bool?,
      needsApproval: json['needs_approval'] as bool?,
      isEndorsed: json['is_endorsed'] as bool?,
      updatedBy: json['updated_by'] as String?,
      owner: json['owner'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'currency': instance.currency,
      'city': instance.city,
      'images': instance.images,
      'videos': instance.videos,
      'service': instance.service,
      'event': instance.event,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'highlights': instance.highlights,
      'budget_type': instance.budgetType,
      'is_range': instance.isRange,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'payable_from': instance.payableFrom,
      'payable_to': instance.payableTo,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'share_location': instance.shareLocation,
      'is_negotiable': instance.isNegotiable,
      'revisions': instance.revisions,
      'views_count': instance.viewsCount,
      'location': instance.location,
      'is_professional': instance.isProfessional,
      'is_online': instance.isOnline,
      'is_requested': instance.isRequested,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'extra_data': instance.extraData,
      'slug': instance.slug,
      'is_active': instance.isActive,
      'needs_approval': instance.needsApproval,
      'is_endorsed': instance.isEndorsed,
      'updated_by': instance.updatedBy,
      'owner': instance.owner,
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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      designation: json['designation'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      isFollowed: json['is_followed'] as bool?,
      isFollowing: json['is_following'] as bool?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
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
      'created_at': instance.createdAt?.toIso8601String(),
      'designation': instance.designation,
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

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      title: json['title'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      duration: json['duration'] as String?,
      isFlexible: json['is_flexible'] as bool?,
      isActive: json['is_active'] as bool?,
      activeDates: (json['active_dates'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'duration': instance.duration,
      'is_flexible': instance.isFlexible,
      'is_active': instance.isActive,
      'active_dates':
          instance.activeDates?.map((e) => e.toIso8601String()).toList(),
    };

_$_ExtraDataClass _$$_ExtraDataClassFromJson(Map<String, dynamic> json) =>
    _$_ExtraDataClass();

Map<String, dynamic> _$$_ExtraDataClassToJson(_$_ExtraDataClass instance) =>
    <String, dynamic>{};

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      id: json['id'] as int?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      mediaType: json['meida_type'] as String?,
      media: json['media'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'meida_type': instance.mediaType,
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
      images: json['images'] as List<dynamic>?,
      requiredDocuments: json['required_documents'] as List<dynamic>?,
      commission: json['commission'] as String?,
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
      'commission': instance.commission,
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
