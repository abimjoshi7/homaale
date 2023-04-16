// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskSubCategoryModel _$$_TaskSubCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_TaskSubCategoryModel(
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

Map<String, dynamic> _$$_TaskSubCategoryModelToJson(
        _$_TaskSubCategoryModel instance) =>
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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String?,
      level: json['level'] as int?,
      icon: json['icon'],
      slug: json['slug'] as String?,
      isActive: json['is_active'] as bool?,
      mediaLimit: json['media_limit'] as int?,
      parent: json['parent'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'level': instance.level,
      'icon': instance.icon,
      'slug': instance.slug,
      'is_active': instance.isActive,
      'media_limit': instance.mediaLimit,
      'parent': instance.parent,
    };
