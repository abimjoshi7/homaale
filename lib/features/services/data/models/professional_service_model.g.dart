// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfessionalServiceModel _$$_ProfessionalServiceModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProfessionalServiceModel(
      totalPages: json['totalPages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['pageSize'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProfessionalServiceModelToJson(
        _$_ProfessionalServiceModel instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'pageSize': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isActive: json['isActive'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isVerified: json['isVerified'] as bool?,
      viewsCount: json['viewsCount'] as int?,
      slug: json['slug'] as String?,
      metaTitle: json['metaTitle'] as String?,
      metaDescription: json['metaDescription'] as String?,
      metaKeyword: json['metaKeyword'] as String?,
      createdBy: json['createdBy'] as String?,
      views: json['views'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'images': instance.images,
      'videos': instance.videos,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'title': instance.title,
      'description': instance.description,
      'isVerified': instance.isVerified,
      'viewsCount': instance.viewsCount,
      'slug': instance.slug,
      'metaTitle': instance.metaTitle,
      'metaDescription': instance.metaDescription,
      'metaKeyword': instance.metaKeyword,
      'createdBy': instance.createdBy,
      'views': instance.views,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'icon': instance.icon,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      id: json['id'] as int?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      mediaType: json['mediaType'] as String?,
      media: json['media'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'mediaType': instance.mediaType,
      'media': instance.media,
    };
