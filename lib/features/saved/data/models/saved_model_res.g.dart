// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedModelRes _$$_SavedModelResFromJson(Map<String, dynamic> json) =>
    _$_SavedModelRes(
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

Map<String, dynamic> _$$_SavedModelResToJson(_$_SavedModelRes instance) =>
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
      user: json['user'] as String?,
      type: json['type'] as String?,
      data: json['data'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      objectId: json['object_id'] as String?,
      contentType: json['content_type'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'type': instance.type,
      'data': instance.data,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'object_id': instance.objectId,
      'content_type': instance.contentType,
    };
