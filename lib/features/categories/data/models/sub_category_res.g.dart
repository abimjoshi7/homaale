// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryRes _$$_SubCategoryResFromJson(Map<String, dynamic> json) =>
    _$_SubCategoryRes(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      requiredDocuments: json['requiredDocuments'] as List<dynamic>?,
      commission: json['commission'] as String?,
    );

Map<String, dynamic> _$$_SubCategoryResToJson(_$_SubCategoryRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'category': instance.category,
      'images': instance.images,
      'requiredDocuments': instance.requiredDocuments,
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
