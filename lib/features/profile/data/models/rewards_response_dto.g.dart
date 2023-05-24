// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RewardsResponseDto _$$_RewardsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_RewardsResponseDto(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Rewards.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RewardsResponseDtoToJson(
        _$_RewardsResponseDto instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Rewards _$$_RewardsFromJson(Map<String, dynamic> json) => _$_Rewards(
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
      code: json['code'] as String?,
      offerRule: json['offer_rule'] as int?,
      redeemPoints: json['redeem_points'] as int?,
    );

Map<String, dynamic> _$$_RewardsToJson(_$_Rewards instance) =>
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
    };
