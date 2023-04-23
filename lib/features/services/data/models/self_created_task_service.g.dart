// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_created_task_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelfCreatedTaskService _$$_SelfCreatedTaskServiceFromJson(
        Map<String, dynamic> json) =>
    _$_SelfCreatedTaskService(
      totalPages: json['totalPages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['pageSize'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SelfCreatedTaskServiceToJson(
        _$_SelfCreatedTaskService instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'pageSize': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      videos: json['videos'] as List<dynamic>?,
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      budgetType: json['budgetType'] as String?,
      budgetFrom: json['budgetFrom'] as String?,
      budgetTo: json['budgetTo'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      shareLocation: json['shareLocation'] as bool?,
      isNegotiable: json['isNegotiable'] as bool?,
      revisions: json['revisions'] as int?,
      recursionType: json['recursionType'] as String?,
      viewsCount: json['viewsCount'] as int?,
      location: json['location'] as String?,
      isProfessional: json['isProfessional'] as bool?,
      isOnline: json['isOnline'] as bool?,
      isRequested: json['isRequested'] as bool?,
      discountType: json['discountType'] as String?,
      discountValue: json['discountValue'] as String?,
      extraData: (json['extraData'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      noOfReservation: json['noOfReservation'] as int?,
      slug: json['slug'] as String?,
      isActive: json['isActive'] as bool?,
      needsApproval: json['needsApproval'] as bool?,
      isEndorsed: json['isEndorsed'] as bool?,
      merchant: json['merchant'],
      event: json['event'],
      avatar: json['avatar'],
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'currency': instance.currency,
      'city': instance.city,
      'images': instance.images,
      'videos': instance.videos,
      'service': instance.service,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'highlights': instance.highlights,
      'budgetType': instance.budgetType,
      'budgetFrom': instance.budgetFrom,
      'budgetTo': instance.budgetTo,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'shareLocation': instance.shareLocation,
      'isNegotiable': instance.isNegotiable,
      'revisions': instance.revisions,
      'recursionType': instance.recursionType,
      'viewsCount': instance.viewsCount,
      'location': instance.location,
      'isProfessional': instance.isProfessional,
      'isOnline': instance.isOnline,
      'isRequested': instance.isRequested,
      'discountType': instance.discountType,
      'discountValue': instance.discountValue,
      'extraData': instance.extraData,
      'noOfReservation': instance.noOfReservation,
      'slug': instance.slug,
      'isActive': instance.isActive,
      'needsApproval': instance.needsApproval,
      'isEndorsed': instance.isEndorsed,
      'merchant': instance.merchant,
      'event': instance.event,
      'avatar': instance.avatar,
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
      fullName: json['fullName'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      profileImage: json['profileImage'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      designation: json['designation'] as String?,
      userType: json['userType'] as String?,
      isProfileVerified: json['isProfileVerified'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
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
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'profileImage': instance.profileImage,
      'bio': instance.bio,
      'createdAt': instance.createdAt?.toIso8601String(),
      'designation': instance.designation,
      'userType': instance.userType,
      'isProfileVerified': instance.isProfileVerified,
      'isFollowed': instance.isFollowed,
      'isFollowing': instance.isFollowing,
      'avatar': instance.avatar,
      'badge': instance.badge,
    };

_$_Avatar _$$_AvatarFromJson(Map<String, dynamic> json) => _$_Avatar(
      image: json['image'],
    );

Map<String, dynamic> _$$_AvatarToJson(_$_Avatar instance) => <String, dynamic>{
      'image': instance.image,
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

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
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
