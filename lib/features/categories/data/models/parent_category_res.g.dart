// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_category_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParentCategoryRes _$$_ParentCategoryResFromJson(Map<String, dynamic> json) =>
    _$_ParentCategoryRes(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      icon: json['icon'] as String?,
      extraData: json['extra_data'] == null
          ? null
          : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ParentCategoryResToJson(
        _$_ParentCategoryRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'icon': instance.icon,
      'extra_data': instance.extraData,
    };

_$_ExtraData _$$_ExtraDataFromJson(Map<String, dynamic> json) => _$_ExtraData(
      bookButtonName: json['book_button_name'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$$_ExtraDataToJson(_$_ExtraData instance) =>
    <String, dynamic>{
      'book_button_name': instance.bookButtonName,
      'key': instance.key,
    };
