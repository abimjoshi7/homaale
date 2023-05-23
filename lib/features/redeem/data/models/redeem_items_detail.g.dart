// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_items_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RedeemItemsDetail _$$_RedeemItemsDetailFromJson(Map<String, dynamic> json) =>
    _$_RedeemItemsDetail(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      offerType: json['offer_type'] as String?,
      code: json['code'],
      offerRule: json['offer_rule'],
      redeemPoints: json['redeem_points'] as int?,
      entityServices: (json['entity_services'] as List<dynamic>?)
          ?.map((e) => EntityService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RedeemItemsDetailToJson(
        _$_RedeemItemsDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'offer_type': instance.offerType,
      'code': instance.code,
      'offer_rule': instance.offerRule,
      'redeem_points': instance.redeemPoints,
      'entity_services': instance.entityServices,
    };

_$_EntityService _$$_EntityServiceFromJson(Map<String, dynamic> json) =>
    _$_EntityService(
      id: json['id'] as String?,
      title: json['title'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_EntityServiceToJson(_$_EntityService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_by': instance.createdBy,
      'images': instance.images,
      'description': instance.description,
    };

_$_CreatedBy _$$_CreatedByFromJson(Map<String, dynamic> json) => _$_CreatedBy(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      profileImage: json['profile_image'],
    );

Map<String, dynamic> _$$_CreatedByToJson(_$_CreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'profile_image': instance.profileImage,
    };
