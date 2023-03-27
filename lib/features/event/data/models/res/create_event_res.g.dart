// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateEventRes _$$_CreateEventResFromJson(Map<String, dynamic> json) =>
    _$_CreateEventRes(
      id: json['id'] as String?,
      duration: json['duration'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      isFlexible: json['is_flexible'] as bool?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      guestLimit: json['guest_limit'] as int?,
      isActive: json['is_active'] as bool?,
      merchant: json['merchant'] as String?,
    );

Map<String, dynamic> _$$_CreateEventResToJson(_$_CreateEventRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'is_flexible': instance.isFlexible,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'guest_limit': instance.guestLimit,
      'is_active': instance.isActive,
      'merchant': instance.merchant,
    };
