// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntityServiceModel _$$_EntityServiceModelFromJson(
        Map<String, dynamic> json) =>
    _$_EntityServiceModel(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => EntityService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EntityServiceModelToJson(
        _$_EntityServiceModel instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_EntityService _$$_EntityServiceFromJson(Map<String, dynamic> json) =>
    _$_EntityService(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'] as String?,
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
      rating: (json['rating'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      budgetType: json['budget_type'] as String?,
      isRequested: json['is_requested'] as bool?,
      budgetFrom: (json['budget_from'] as num?)?.toDouble(),
      budgetTo: (json['budget_to'] as num?)?.toDouble(),
      location: json['location'] as String?,
      count: json['count'] as int?,
      isEndorsed: json['is_endorsed'] as bool?,
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'end_date': instance.endDate?.toIso8601String(),
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

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: json['rating_count'] as int?,
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
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
