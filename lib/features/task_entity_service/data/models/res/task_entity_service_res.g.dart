// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity_service_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskEntityServiceRes _$$_TaskEntityServiceResFromJson(
        Map<String, dynamic> json) =>
    _$_TaskEntityServiceRes(
      id: json['id'] as String?,
      owner: json['owner'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      budgetType: json['budget_type'] as String?,
      budgetFrom: json['budget_from'] as String?,
      budgetTo: json['budget_to'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      shareLocation: json['share_location'] as bool?,
      isNegotiable: json['is_negotiable'] as bool?,
      revisions: json['revisions'] as int?,
      recursionType: json['recursion_type'] as String?,
      location: json['location'] as String?,
      isProfessional: json['is_professional'] as bool?,
      isOnline: json['is_online'] as bool?,
      isRequested: json['is_requested'] as bool?,
      discountType: json['discount_type'] as String?,
      discountValue: json['discount_value'] as String?,
      noOfReservation: json['no_of_reservation'] as int?,
      isActive: json['is_active'] as bool?,
      needsApproval: json['needs_approval'] as bool?,
      isEndorsed: json['is_endorsed'] as bool?,
      payableFrom: json['payable_from'] as String?,
      payableTo: json['payable_to'] as String?,
      service: json['service'] as String?,
      event: json['event'] as String?,
      city: json['city'] as int?,
      currency: json['currency'] as String?,
      avatar: json['avatar'] as int?,
      images: (json['images'] as List<dynamic>?)?.map((e) => e as int).toList(),
      videos: (json['videos'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_TaskEntityServiceResToJson(
        _$_TaskEntityServiceRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
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
      'location': instance.location,
      'is_professional': instance.isProfessional,
      'is_online': instance.isOnline,
      'is_requested': instance.isRequested,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'no_of_reservation': instance.noOfReservation,
      'is_active': instance.isActive,
      'needs_approval': instance.needsApproval,
      'is_endorsed': instance.isEndorsed,
      'payable_from': instance.payableFrom,
      'payable_to': instance.payableTo,
      'service': instance.service,
      'event': instance.event,
      'city': instance.city,
      'currency': instance.currency,
      'avatar': instance.avatar,
      'images': instance.images,
      'videos': instance.videos,
    };
