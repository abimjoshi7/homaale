// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentTypeList _$$_PaymentTypeListFromJson(Map<String, dynamic> json) =>
    _$_PaymentTypeList(
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

Map<String, dynamic> _$$_PaymentTypeListToJson(_$_PaymentTypeList instance) =>
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
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      logo: json['logo'] as String?,
      type: json['type'] as String?,
      thumbnail: json['thumb_nail'],
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
      'type': instance.type,
      'thumb_nail': instance.thumbnail,
    };
