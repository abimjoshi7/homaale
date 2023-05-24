// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_task_entity_services_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NearbyTaskEntityServiceReq _$$_NearbyTaskEntityServiceReqFromJson(
        Map<String, dynamic> json) =>
    _$_NearbyTaskEntityServiceReq(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      nearBy: json['near_by'] as bool? ?? true,
      radius: (json['radius'] as num?)?.toDouble() ?? 10000,
    );

Map<String, dynamic> _$$_NearbyTaskEntityServiceReqToJson(
        _$_NearbyTaskEntityServiceReq instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'near_by': instance.nearBy,
      'radius': instance.radius,
    };
