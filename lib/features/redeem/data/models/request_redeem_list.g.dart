// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_redeem_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestRedeemList _$$_RequestRedeemListFromJson(Map<String, dynamic> json) =>
    _$_RequestRedeemList(
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

Map<String, dynamic> _$$_RequestRedeemListToJson(
        _$_RequestRedeemList instance) =>
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
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'],
      offerType: json['offer_type'] as String?,
      code: json['code'],
      offerRule: json['offerRule'],
      redeemPoints: json['redeem_points'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate,
      'offer_type': instance.offerType,
      'code': instance.code,
      'offerRule': instance.offerRule,
      'redeem_points': instance.redeemPoints,
    };
