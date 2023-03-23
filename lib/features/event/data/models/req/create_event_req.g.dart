// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateEventReq _$$_CreateEventReqFromJson(Map<String, dynamic> json) =>
    _$_CreateEventReq(
      duration: json['duration'] as String?,
      entityService: json['entity_service'] as String?,
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

Map<String, dynamic> _$$_CreateEventReqToJson(_$_CreateEventReq instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'entity_service': instance.entityService,
      'title': instance.title,
      'description': instance.description,
      'is_flexible': instance.isFlexible,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'guest_limit': instance.guestLimit,
      'is_active': instance.isActive,
      'merchant': instance.merchant,
    };
