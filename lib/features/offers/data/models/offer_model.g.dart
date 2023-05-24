// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferModel _$$_OfferModelFromJson(Map<String, dynamic> json) =>
    _$_OfferModel(
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

Map<String, dynamic> _$$_OfferModelToJson(_$_OfferModel instance) =>
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
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      entityServices: (json['entity_services'] as List<dynamic>?)
          ?.map((e) => TaskEntityService.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      merchant: json['merchant'] as String?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      free: json['free'] == null
          ? null
          : ServiceElement.fromJson(json['free'] as Map<String, dynamic>),
      offerRule: json['offer_rule'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      offerType: json['offer_type'] as String?,
      code: json['code'] as String?,
      image: json['image'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      isConsumable: json['is_consumable'] as bool?,
      discount: json['discount'] as String?,
      discountType: json['discount_type'] as String?,
      discountLimit: json['discount_limit'] as String?,
      quantity: json['quantity'],
      isCommon: json['is_common'] as bool?,
      organizations: json['organizations'] as List<dynamic>?,
      redeems:
          (json['redeems'] as List<dynamic>?)?.map((e) => e as String).toList(),
      redeemPoints: json['redeem_points'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'services': instance.services,
      'entity_services': instance.entityServices,
      'categories': instance.categories,
      'created_by': instance.createdBy,
      'merchant': instance.merchant,
      'country': instance.country,
      'free': instance.free,
      'offer_rule': instance.offerRule,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
      'title': instance.title,
      'description': instance.description,
      'offer_type': instance.offerType,
      'code': instance.code,
      'image': instance.image,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'is_consumable': instance.isConsumable,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'discount_limit': instance.discountLimit,
      'quantity': instance.quantity,
      'is_common': instance.isCommon,
      'organizations': instance.organizations,
      'redeems': instance.redeems,
      'redeem_points': instance.redeemPoints,
    };

_$_OfferRule _$$_OfferRuleFromJson(Map<String, dynamic> json) => _$_OfferRule(
      id: json['id'] as int?,
      isActive: json['is_active'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      hasDiscount: json['has_discount'] as bool?,
      hasFreeItems: json['has_free_items'] as bool?,
      hasQuantity: json['has_quantity'] as bool?,
    );

Map<String, dynamic> _$$_OfferRuleToJson(_$_OfferRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isActive,
      'title': instance.title,
      'description': instance.description,
      'has_discount': instance.hasDiscount,
      'has_free_items': instance.hasFreeItems,
      'has_quantity': instance.hasQuantity,
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
      'is_endorsed': instance.isEndorsed,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'videos': instance.videos,
      'is_bookmarked': instance.isBookmarked,
    };
