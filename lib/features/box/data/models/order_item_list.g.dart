// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItemList _$$_OrderItemListFromJson(Map<String, dynamic> json) =>
    _$_OrderItemList(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'],
      previous: json['previous'],
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderItemListToJson(_$_OrderItemList instance) =>
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
      title: json['title'] as String?,
      charge: json['charge'] as String?,
      entityService: json['entity_service'] == null
          ? null
          : EntityService.fromJson(
              json['entity_service'] as Map<String, dynamic>),
      assigner: json['assigner'] == null
          ? null
          : Assignee.fromJson(json['assigner'] as Map<String, dynamic>),
      assignee: json['assignee'] == null
          ? null
          : Assignee.fromJson(json['assignee'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      videos: json['videos'] as List<dynamic>?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'charge': instance.charge,
      'entity_service': instance.entityService,
      'assigner': instance.assigner,
      'assignee': instance.assignee,
      'currency': instance.currency,
      'images': instance.images,
      'videos': instance.videos,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$_Assignee _$$_AssigneeFromJson(Map<String, dynamic> json) => _$_Assignee(
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
      'full_name': instance.fullName,
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
      slug: json['slug'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : Assignee.fromJson(json['created_by'] as Map<String, dynamic>),
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
      rating: (json['rating'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      budgetType: json['budget_type'] as String?,
      isRequested: json['is_requested'] as bool?,
      budgetFrom: json['budget_from'] as String?,
      budgetTo: json['budget_to'] as String?,
      location: json['location'] as String?,
      count: json['count'] as int?,
      isEndorsed: json['is_endorsed'] as bool?,
      endDate: json['end_date'] as String?,
      videos: json['videos'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_EntityServiceToJson(_$_EntityService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'created_at': instance.createdAt,
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
      'is_endorsed': instance.isEndorsed,
      'end_date': instance.endDate,
      'videos': instance.videos,
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

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      id: json['id'] as int?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      mediaType: json['mediaType'] as String?,
      media: json['media'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'mediaType': instance.mediaType,
      'media': instance.media,
    };

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: json['ratingCount'] as int?,
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
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
