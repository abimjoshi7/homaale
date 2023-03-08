// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceModel _$$_ServiceModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceModel(
      id: json['id'] as String?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
      endorsements: (json['endorsements'] as List<dynamic>?)
          ?.map((e) => Endorsement.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRedeemable: json['is_redeemable'] as bool?,
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      budgetType: json['budget_type'] as String?,
      budgetFrom: (json['budget_from'] as num?)?.toDouble(),
      budgetTo: (json['budget_to'] as num?)?.toDouble(),
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      shareLocation: json['share_location'] as bool?,
      isNegotiable: json['is_negotiable'] as bool?,
      revisions: json['revisions'] as int?,
      recursionType: json['recursion_type'] as String?,
      viewsCount: json['views_count'] as int?,
      location: json['location'] as String?,
      isProfessional: json['is_professional'] as bool?,
      isOnline: json['is_online'] as bool?,
      isRequested: json['is_requested'] as bool?,
      discountType: json['discount_type'] as String?,
      discountValue: json['discount_value'] as int?,
      extraData: (json['extra_data'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      noOfReservation: json['no_of_reservaton'] as int?,
      slug: json['slug'] as String?,
      isActive: json['is_active'] as bool?,
      needsApproval: json['needs_approval'] as bool?,
      isEndorsed: json['is_endorsed'] as bool?,
      merchant: json['merchant'] as String?,
      avatar: json['avatar'] as int?,
    );

Map<String, dynamic> _$$_ServiceModelToJson(_$_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'city': instance.city,
      'created_by': instance.createdBy,
      'service': instance.service,
      'images': instance.images,
      'videos': instance.videos,
      'rating': instance.rating,
      'count': instance.count,
      'offers': instance.offers,
      'endorsements': instance.endorsements,
      'is_redeemable': instance.isRedeemable,
      'event': instance.event,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'title': instance.title,
      'description': instance.description,
      'highlights': instance.highlights,
      'budget_type': instance.budgetType,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'share_location': instance.shareLocation,
      'is_negotiable': instance.isNegotiable,
      'revisions': instance.revisions,
      'recursion_type': instance.recursionType,
      'views_count': instance.viewsCount,
      'location': instance.location,
      'is_professional': instance.isProfessional,
      'is_online': instance.isOnline,
      'is_requested': instance.isRequested,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'extra_data': instance.extraData,
      'no_of_reservaton': instance.noOfReservation,
      'slug': instance.slug,
      'is_active': instance.isActive,
      'needs_approval': instance.needsApproval,
      'is_endorsed': instance.isEndorsed,
      'merchant': instance.merchant,
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

_$_Endorsement _$$_EndorsementFromJson(Map<String, dynamic> json) =>
    _$_Endorsement(
      id: json['id'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_EndorsementToJson(_$_Endorsement instance) =>
    <String, dynamic>{
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

_$_Offer _$$_OfferFromJson(Map<String, dynamic> json) => _$_Offer(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      offerType: json['offer_type'] as String?,
      code: json['code'] as String?,
      offerRule: json['offer_rule'] as int?,
      free: json['free'] as String?,
    );

Map<String, dynamic> _$$_OfferToJson(_$_Offer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'offer_type': instance.offerType,
      'code': instance.code,
      'offer_rule': instance.offerRule,
      'free': instance.free,
    };

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      title: json['title'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      duration: json['duration'] as String?,
      isFlexible: json['is_flexible'] as bool?,
      isActive: json['is_active'] as bool?,
      activeDates: (json['active_dates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start,
      'end': instance.end,
      'duration': instance.duration,
      'is_flexible': instance.isFlexible,
      'is_active': instance.isActive,
      'active_dates': instance.activeDates,
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

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rating': instance.rating,
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
