// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentClient _$$_ContentClientFromJson(Map<String, dynamic> json) =>
    _$_ContentClient(
      id: json['id'] as int?,
      title: json['title'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      content: json['content'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_ContentClientToJson(_$_ContentClient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt?.toIso8601String(),
      'content': instance.content,
      'slug': instance.slug,
    };
