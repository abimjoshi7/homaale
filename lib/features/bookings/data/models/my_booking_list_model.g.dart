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
      images: json['images'] as List<dynamic>?,
      videos: json['videos'] as List<dynamic>?,
      progressPercent: json['progress_percentage'] as int?,
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
      price: json['price'] as String?,
      earning: json['earning'] as String?,
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
      extraData: json['extra_data'],
      isAccepted: json['is_accepted'] as bool?,
      cancellingParty: json['cancelling_party'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      cancellationDescription: json['cancellation_description'] as String?,
      isRefunded: json['is_refunded'] as bool?,
      isCompensated: json['is_compensated'] as bool?,
      isPenalized: json['is_penalized'] as bool?,
      updatedBy: json['updated_by'] as String?,
      approvedBy: json['approved_by'],
      owner: json['owner'] as String?,
      city: json['city'] as int?,
      cancelledBy: json['cancelled_by'],
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'entity_service': instance.entityService,
      'images': instance.images,
      'videos': instance.videos,
      'progress_percentage': instance.progressPercent,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'requirements': instance.requirements,
      'price': instance.price,
      'earning': instance.earning,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'location': instance.location,
      'is_active': instance.isActive,
      'status': instance.status,
      'extra_data': instance.extraData,
      'is_accepted': instance.isAccepted,
      'cancelling_party': instance.cancellingParty,
      'cancellation_reason': instance.cancellationReason,
      'cancellation_description': instance.cancellationDescription,
      'is_refunded': instance.isRefunded,
      'is_compensated': instance.isCompensated,
      'is_penalized': instance.isPenalized,
      'updated_by': instance.updatedBy,
      'approved_by': instance.approvedBy,
      'owner': instance.owner,
      'city': instance.city,
      'cancelled_by': instance.cancelledBy,
    };

_$_ResultCreatedBy _$$_ResultCreatedByFromJson(Map<String, dynamic> json) =>
    _$_ResultCreatedBy(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      profileImage: json['profile_image'] as String?,
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      chargeCurrency: json['charge_currency'] == null
          ? null
          : Currency.fromJson(json['charge_currency'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CreatedByCity.fromJson(json['city'] as Map<String, dynamic>),
      addressLine1: json['address_line1'] as String?,
      addressLine2: json['address_line2'] as String?,
    );

Map<String, dynamic> _$$_ResultCreatedByToJson(_$_ResultCreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'bio': instance.bio,
      'profile_image': instance.profileImage,
      'stats': instance.stats,
      'skills': instance.skills,
      'charge_currency': instance.chargeCurrency,
      'city': instance.city,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
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

_$_CreatedByCity _$$_CreatedByCityFromJson(Map<String, dynamic> json) =>
    _$_CreatedByCity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      localName: json['local_name'] as String?,
      zipCode: json['zip_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_CreatedByCityToJson(_$_CreatedByCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'local_name': instance.localName,
      'zip_code': instance.zipCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
    };

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      successRate: json['success_rate'] as num?,
      happyClients: json['happy_clients'] as num?,
      taskCompleted: json['task_completed'] as num?,
      userReviews: json['user_reviews'] as num?,
      taskAssigned: json['task_assigned'] as num?,
      taskInProgress: json['task_in_progress'] as num?,
      taskCancelled: json['task_cancelled'] as num?,
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
          : EntityServiceCity.fromJson(json['city'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      videos: json['videos'] as List<dynamic>?,
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
      isProfessional: json['is_profesisonal'] as bool?,
      isOnline: json['is_online'] as bool?,
      isRequested: json['is_requested'] as bool?,
      discountType: json['discount_type'] as String?,
      discountValue: json['discount_value'] as String?,
      slug: json['slug'] as String?,
      isActive: json['is_active'] as bool?,
      needsApproval: json['needs_approval'] as bool?,
      isEndorsed: json['is_endorsed'] as bool?,
      updatedBy: json['updated_by'] as String?,
      owner: json['owner'] as String?,
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
      'is_profesisonal': instance.isProfessional,
      'is_online': instance.isOnline,
      'is_requested': instance.isRequested,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'slug': instance.slug,
      'is_active': instance.isActive,
      'needs_approval': instance.needsApproval,
      'is_endorsed': instance.isEndorsed,
      'updated_by': instance.updatedBy,
      'owner': instance.owner,
    };

_$_EntityServiceCity _$$_EntityServiceCityFromJson(Map<String, dynamic> json) =>
    _$_EntityServiceCity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EntityServiceCityToJson(
        _$_EntityServiceCity instance) =>
    <String, dynamic>{
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

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isActive: json['is_active'] as bool?,
      isVerified: json['is_verified'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      requiredDocuments: (json['required_documents'] as List<dynamic>?)
          ?.map((e) => RequiredDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
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

_$_RequiredDocument _$$_RequiredDocumentFromJson(Map<String, dynamic> json) =>
    _$_RequiredDocument(
      id: json['id'] as int?,
      name: json['name'] as String?,
      requiredForUser: json['required_for_user'] as bool?,
      requiredForMerchant: json['required_for_merchant'] as bool?,
    );

Map<String, dynamic> _$$_RequiredDocumentToJson(_$_RequiredDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'required_for_user': instance.requiredForUser,
      'required_for_merchant': instance.requiredForMerchant,
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
      activeDates: json['active_dates'] as String?,
      guestLimit: (json['guest_limit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'duration': instance.duration,
      'is_flexible': instance.isFlexible,
      'is_active': instance.isActive,
      'active_dates': instance.activeDates,
      'guest_limit': instance.guestLimit,
    };
