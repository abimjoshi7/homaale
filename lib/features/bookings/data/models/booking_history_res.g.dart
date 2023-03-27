// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_history_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingHistoryRes _$$_BookingHistoryResFromJson(Map<String, dynamic> json) =>
    _$_BookingHistoryRes(
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

Map<String, dynamic> _$$_BookingHistoryResToJson(
        _$_BookingHistoryRes instance) =>
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
      assigner: json['assigner'] == null
          ? null
          : Assignee.fromJson(json['assigner'] as Map<String, dynamic>),
      assignee: json['assignee'] == null
          ? null
          : Assignee.fromJson(json['assignee'] as Map<String, dynamic>),
      entityService: json['entity_service'] == null
          ? null
          : EntityService.fromJson(
              json['entity_service'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isActive: json['is_active'] as bool?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      charge: json['charge'] as int?,
      location: json['location'] as String?,
      estimatedTime: json['estimated_time'] as int?,
      slug: json['slug'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      completedOn: json['completedOn'],
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      extraData: json['extra_data'] as List<dynamic>?,
      isPaid: json['is_paid'] as bool?,
      booking: json['booking'] as int?,
      city: json['city'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'assigner': instance.assigner,
      'assignee': instance.assignee,
      'entity_service': instance.entityService,
      'currency': instance.currency,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_active': instance.isActive,
      'status': instance.status,
      'title': instance.title,
      'description': instance.description,
      'requirements': instance.requirements,
      'charge': instance.charge,
      'location': instance.location,
      'estimated_time': instance.estimatedTime,
      'slug': instance.slug,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'completedOn': instance.completedOn,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'extra_data': instance.extraData,
      'is_paid': instance.isPaid,
      'booking': instance.booking,
      'city': instance.city,
      'images': instance.images,
      'videos': instance.videos,
    };

_$_Assignee _$$_AssigneeFromJson(Map<String, dynamic> json) => _$_Assignee(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullName: json['fill_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['created_at'] as String?,
      designation: json['designation'] as String?,
      userType: json['user_type'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      isFollowed: json['is_followed'] as bool?,
      isFollowing: json['is_following'] as bool?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AssigneeToJson(_$_Assignee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fill_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'bio': instance.bio,
      'created_at': instance.createdAt,
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

_$_EntityService _$$_EntityServiceFromJson(Map<String, dynamic> json) =>
    _$_EntityService(
      id: json['id'] as String?,
      budgetType: json['budget_type'] as String?,
      budgetFrom: json['budget_from'] as int?,
      budgetTo: json['budget_to'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['created_by'] == null
          ? null
          : Assignee.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EntityServiceToJson(_$_EntityService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'budget_type': instance.budgetType,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'images': instance.images,
      'videos': instance.videos,
      'created_by': instance.createdBy,
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
